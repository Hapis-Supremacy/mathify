package com.mathify.dao;

import jakarta.enterprise.context.ApplicationScoped;

import com.mathify.model.QuizAttempt;
import com.mathify.util.QueryHelper;

import java.sql.SQLException;
import java.util.List;

/**
 * Per-user quiz attempts ({@code quiz_attempts}). One row per (user, quiz),
 * holding the best score — matching {@code UserProgress.recordQuizAttempt}.
 */
@ApplicationScoped
public class QuizAttemptDAO {

    /** Records an attempt, keeping it only if it beats the stored score. */
    public void record(String uid, QuizAttempt attempt) throws SQLException {
        String sql = """
                INSERT INTO quiz_attempts (uid, quiz_id, score, completed_at)
                VALUES (?, ?, ?, ?)
                ON CONFLICT (uid, quiz_id) DO UPDATE
                  SET score        = EXCLUDED.score,
                      completed_at = EXCLUDED.completed_at
                WHERE EXCLUDED.score > quiz_attempts.score
                """;
        QueryHelper.executeUpdate(sql, uid, attempt.quizId(), attempt.score(), attempt.completedAt());
    }

    public QuizAttempt find(String uid, String quizId) throws SQLException {
        String sql = "SELECT * FROM quiz_attempts WHERE uid = ? AND quiz_id = ?";
        return QueryHelper.queryOne(sql, QuizAttemptDAO::map, uid, quizId);
    }

    public List<QuizAttempt> findByUser(String uid) throws SQLException {
        String sql = "SELECT * FROM quiz_attempts WHERE uid = ? ORDER BY completed_at";
        return QueryHelper.queryList(sql, QuizAttemptDAO::map, uid);
    }

    static QuizAttempt map(java.sql.ResultSet rs) throws SQLException {
        return new QuizAttempt(
                rs.getString("quiz_id"),
                rs.getInt("score"),
                rs.getTimestamp("completed_at").toLocalDateTime());
    }
}

