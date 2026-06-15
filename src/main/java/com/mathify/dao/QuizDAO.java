package com.mathify.dao;

import com.mathify.model.Question;
import com.mathify.model.Quiz;
import com.mathify.util.DBConnection;
import com.mathify.util.QueryHelper;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Persists {@link Quiz} metadata ({@code quizzes}) and delegates question
 * persistence to {@link QuestionDAO}. A {@code Quiz} requires at least one
 * question, so reconstruction always loads its questions.
 */
public class QuizDAO {

    private final QuestionDAO questionDAO = new QuestionDAO();

    /** Inserts the quiz row and all of its questions (in list order). */
    public void insert(String chapterId, Quiz quiz) throws SQLException {
        String sql = """
                INSERT INTO quizzes (quiz_id, chapter_id, title, passing_score)
                VALUES (?, ?, ?, ?)
                ON CONFLICT (quiz_id) DO UPDATE
                  SET title         = EXCLUDED.title,
                      passing_score = EXCLUDED.passing_score
                """;
        QueryHelper.executeUpdate(sql, quiz.getQuizId(), chapterId, quiz.getTitle(), quiz.getPassingScore());

        List<Question> questions = quiz.getQuestions();
        for (int i = 0; i < questions.size(); i++) {
            questionDAO.insert(quiz.getQuizId(), questions.get(i), i);
        }
    }

    /** Loads a fully-populated quiz (with questions), or {@code null} if not found. */
    public Quiz findById(String quizId) throws SQLException {
        String sql = "SELECT quiz_id, title, passing_score FROM quizzes WHERE quiz_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, quizId);
            try (ResultSet rs = ps.executeQuery()) {
                if (!rs.next()) {
                    return null;
                }
                String title = rs.getString("title");
                int passingScore = rs.getInt("passing_score");
                List<Question> questions = questionDAO.findByQuiz(quizId);
                return new Quiz(quizId, title, passingScore, questions);
            }
        }
    }

    /** Loads every quiz belonging to a chapter, fully populated. */
    public List<Quiz> findByChapter(String chapterId) throws SQLException {
        List<String> quizIds = QueryHelper.queryList(
                "SELECT quiz_id FROM quizzes WHERE chapter_id = ? ORDER BY created_at",
                rs -> rs.getString("quiz_id"),
                chapterId);
        List<Quiz> quizzes = new ArrayList<>();
        for (String quizId : quizIds) {
            quizzes.add(findById(quizId));
        }
        return quizzes;
    }

    public void delete(String quizId) throws SQLException {
        // questions + payloads cascade via FK ON DELETE CASCADE.
        QueryHelper.executeUpdate("DELETE FROM quizzes WHERE quiz_id = ?", quizId);
    }
}
