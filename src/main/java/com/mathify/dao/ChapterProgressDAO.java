package com.mathify.dao;

import com.mathify.model.ChapterProgress;
import com.mathify.util.QueryHelper;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.Duration;
import java.time.LocalDateTime;
import java.util.List;

/** Per-user chapter progress ({@code chapter_progress}). */
public class ChapterProgressDAO {

    /** Inserts or updates a user's progress for one chapter. */
    public void save(String uid, ChapterProgress cp) throws SQLException {
        String sql = """
                INSERT INTO chapter_progress (uid, chapter_id, completed_at, time_spent_seconds)
                VALUES (?, ?, ?, ?)
                ON CONFLICT (uid, chapter_id) DO UPDATE
                  SET completed_at       = EXCLUDED.completed_at,
                      time_spent_seconds = EXCLUDED.time_spent_seconds
                """;
        QueryHelper.executeUpdate(sql,
                uid,
                cp.chapterId(),
                cp.completedAt(),
                cp.timeSpent() != null ? cp.timeSpent().getSeconds() : 0L);
    }

    public ChapterProgress find(String uid, String chapterId) throws SQLException {
        String sql = "SELECT * FROM chapter_progress WHERE uid = ? AND chapter_id = ?";
        return QueryHelper.queryOne(sql, ChapterProgressDAO::map, uid, chapterId);
    }

    public List<ChapterProgress> findByUser(String uid) throws SQLException {
        String sql = "SELECT * FROM chapter_progress WHERE uid = ? ORDER BY completed_at NULLS LAST";
        return QueryHelper.queryList(sql, ChapterProgressDAO::map, uid);
    }

    static ChapterProgress map(java.sql.ResultSet rs) throws SQLException {
        Timestamp completed = rs.getTimestamp("completed_at");
        LocalDateTime completedAt = (completed != null) ? completed.toLocalDateTime() : null;
        return new ChapterProgress(
                rs.getString("chapter_id"),
                completedAt,
                Duration.ofSeconds(rs.getLong("time_spent_seconds")));
    }
}
