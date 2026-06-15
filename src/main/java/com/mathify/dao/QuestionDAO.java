package com.mathify.dao;

import com.mathify.model.DragDropQuestion;
import com.mathify.model.DragItem;
import com.mathify.model.DropZone;
import com.mathify.model.FillBlankQuestion;
import com.mathify.model.MultipleChoiceQuestion;
import com.mathify.model.Question;
import com.mathify.model.QuestionInfo;
import com.mathify.model.QuestionType;
import com.mathify.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * Persists and reconstructs polymorphic {@link Question}s. The base row lives in
 * {@code questions}; the type-specific payload lives in {@code mc_options} /
 * {@code fill_blank_answers} / {@code drag_items} + {@code drop_zones} +
 * {@code drag_drop_pairings}.
 *
 * <p>Aggregate writes run inside a single transaction.
 */
public class QuestionDAO {

    /** Inserts a question and its payload for the given quiz. {@code orderIndex} preserves list order. */
    public void insert(String quizId, Question q, int orderIndex) throws SQLException {
        try (Connection conn = DBConnection.getConnection()) {
            conn.setAutoCommit(false);
            try {
                insertBase(conn, quizId, q, orderIndex);
                switch (q.getType()) {
                    case MULTIPLE_CHOICE -> insertMultipleChoice(conn, (MultipleChoiceQuestion) q);
                    case FILL_BLANK      -> insertFillBlank(conn, (FillBlankQuestion) q);
                    case DRAG_AND_DROP   -> insertDragDrop(conn, (DragDropQuestion) q);
                }
                conn.commit();
            } catch (SQLException e) {
                conn.rollback();
                throw e;
            }
        }
    }

    /** Loads every question for a quiz, ordered, fully reconstructed into its subtype. */
    public List<Question> findByQuiz(String quizId) throws SQLException {
        String sql = """
                SELECT question_id, prompt, points, type, case_sensitive
                FROM   questions
                WHERE  quiz_id = ?
                ORDER  BY order_index
                """;
        List<Question> questions = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, quizId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    String questionId = rs.getString("question_id");
                    QuestionInfo info = new QuestionInfo(questionId, rs.getString("prompt"), rs.getInt("points"));
                    QuestionType type = QuestionType.valueOf(rs.getString("type"));
                    boolean caseSensitive = rs.getBoolean("case_sensitive");
                    questions.add(switch (type) {
                        case MULTIPLE_CHOICE -> loadMultipleChoice(conn, info);
                        case FILL_BLANK      -> loadFillBlank(conn, info, caseSensitive);
                        case DRAG_AND_DROP   -> loadDragDrop(conn, info);
                    });
                }
            }
        }
        return questions;
    }

    public void delete(String questionId) throws SQLException {
        // Payload rows cascade via FK ON DELETE CASCADE.
        String sql = "DELETE FROM questions WHERE question_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, questionId);
            ps.executeUpdate();
        }
    }

    // ── Inserts ──────────────────────────────────────────────────────────────

    private void insertBase(Connection conn, String quizId, Question q, int orderIndex) throws SQLException {
        boolean caseSensitive = q instanceof FillBlankQuestion fb && fb.isCaseSensitive();
        String sql = """
                INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index)
                VALUES (?, ?, ?, ?, ?, ?, ?)
                """;
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, q.getId());
            ps.setString(2, quizId);
            ps.setString(3, q.getPrompt());
            ps.setInt(4, q.getPoints());
            ps.setString(5, q.getType().name());
            ps.setBoolean(6, caseSensitive);
            ps.setInt(7, orderIndex);
            ps.executeUpdate();
        }
    }

    private void insertMultipleChoice(Connection conn, MultipleChoiceQuestion q) throws SQLException {
        String sql = """
                INSERT INTO mc_options (question_id, option_id, option_text, is_correct)
                VALUES (?, ?, ?, ?)
                """;
        Set<String> correct = q.getCorrectOptionIds();
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            for (MultipleChoiceQuestion.Option opt : q.getOptions()) {
                ps.setString(1, q.getId());
                ps.setString(2, opt.id());
                ps.setString(3, opt.text());
                ps.setBoolean(4, correct.contains(opt.id()));
                ps.addBatch();
            }
            ps.executeBatch();
        }
    }

    private void insertFillBlank(Connection conn, FillBlankQuestion q) throws SQLException {
        String sql = """
                INSERT INTO fill_blank_answers (question_id, answer_order, answer_text)
                VALUES (?, ?, ?)
                """;
        List<String> answers = q.getCorrectAnswers();
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            for (int i = 0; i < answers.size(); i++) {
                ps.setString(1, q.getId());
                ps.setInt(2, i);
                ps.setString(3, answers.get(i));
                ps.addBatch();
            }
            ps.executeBatch();
        }
    }

    private void insertDragDrop(Connection conn, DragDropQuestion q) throws SQLException {
        try (PreparedStatement items = conn.prepareStatement(
                "INSERT INTO drag_items (question_id, item_id, label) VALUES (?, ?, ?)")) {
            for (DragItem item : q.getDraggables()) {
                items.setString(1, q.getId());
                items.setString(2, item.id());
                items.setString(3, item.label());
                items.addBatch();
            }
            items.executeBatch();
        }
        try (PreparedStatement zones = conn.prepareStatement(
                "INSERT INTO drop_zones (question_id, zone_id, label) VALUES (?, ?, ?)")) {
            for (DropZone zone : q.getDropZones()) {
                zones.setString(1, q.getId());
                zones.setString(2, zone.id());
                zones.setString(3, zone.label());
                zones.addBatch();
            }
            zones.executeBatch();
        }
        try (PreparedStatement pairs = conn.prepareStatement(
                "INSERT INTO drag_drop_pairings (question_id, item_id, zone_id) VALUES (?, ?, ?)")) {
            for (Map.Entry<String, String> pairing : q.getCorrectPairings().entrySet()) {
                pairs.setString(1, q.getId());
                pairs.setString(2, pairing.getKey());
                pairs.setString(3, pairing.getValue());
                pairs.addBatch();
            }
            pairs.executeBatch();
        }
    }

    // ── Loaders ──────────────────────────────────────────────────────────────

    private MultipleChoiceQuestion loadMultipleChoice(Connection conn, QuestionInfo info) throws SQLException {
        List<MultipleChoiceQuestion.Option> options = new ArrayList<>();
        Set<String> correct = new HashSet<>();
        String sql = "SELECT option_id, option_text, is_correct FROM mc_options WHERE question_id = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, info.id());
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    String optionId = rs.getString("option_id");
                    options.add(new MultipleChoiceQuestion.Option(optionId, rs.getString("option_text")));
                    if (rs.getBoolean("is_correct")) {
                        correct.add(optionId);
                    }
                }
            }
        }
        return new MultipleChoiceQuestion(info, options, correct);
    }

    private FillBlankQuestion loadFillBlank(Connection conn, QuestionInfo info, boolean caseSensitive) throws SQLException {
        List<String> answers = new ArrayList<>();
        String sql = "SELECT answer_text FROM fill_blank_answers WHERE question_id = ? ORDER BY answer_order";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, info.id());
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    answers.add(rs.getString("answer_text"));
                }
            }
        }
        return new FillBlankQuestion(info, answers, caseSensitive);
    }

    private DragDropQuestion loadDragDrop(Connection conn, QuestionInfo info) throws SQLException {
        List<DragItem> draggables = new ArrayList<>();
        try (PreparedStatement ps = conn.prepareStatement(
                "SELECT item_id, label FROM drag_items WHERE question_id = ?")) {
            ps.setString(1, info.id());
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    draggables.add(new DragItem(rs.getString("item_id"), rs.getString("label")));
                }
            }
        }
        List<DropZone> dropZones = new ArrayList<>();
        try (PreparedStatement ps = conn.prepareStatement(
                "SELECT zone_id, label FROM drop_zones WHERE question_id = ?")) {
            ps.setString(1, info.id());
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    dropZones.add(new DropZone(rs.getString("zone_id"), rs.getString("label")));
                }
            }
        }
        Map<String, String> pairings = new LinkedHashMap<>();
        try (PreparedStatement ps = conn.prepareStatement(
                "SELECT item_id, zone_id FROM drag_drop_pairings WHERE question_id = ?")) {
            ps.setString(1, info.id());
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    pairings.put(rs.getString("item_id"), rs.getString("zone_id"));
                }
            }
        }
        return new DragDropQuestion(info, draggables, dropZones, pairings);
    }
}
