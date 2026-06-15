package com.mathify.dao;

import com.mathify.model.Achievement;
import com.mathify.util.QueryHelper;

import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.AbstractMap;
import java.util.List;

/**
 * Join table between users and the achievements they have earned
 * ({@code user_achievements}). Mirrors {@code UserProgress.achievements}.
 */
public class UserAchievementDAO {

    /** Records that a user earned an achievement. No-op if already awarded. */
    public void award(String uid, String achievementId) throws SQLException {
        String sql = """
                INSERT INTO user_achievements (uid, achievement_id)
                VALUES (?, ?)
                ON CONFLICT (uid, achievement_id) DO NOTHING
                """;
        QueryHelper.executeUpdate(sql, uid, achievementId);
    }

    public boolean hasAchievement(String uid, String achievementId) throws SQLException {
        String sql = "SELECT 1 FROM user_achievements WHERE uid = ? AND achievement_id = ?";
        return QueryHelper.queryOne(sql, rs -> Boolean.TRUE, uid, achievementId) != null;
    }

    /**
     * Loads every achievement a user has earned, paired with the time it was earned —
     * matching the shape of {@link com.mathify.model.UserProgress#getAchievements()}.
     */
    public List<AbstractMap.SimpleEntry<Achievement, LocalDateTime>> findByUser(String uid) throws SQLException {
        String sql = """
                SELECT a.achievement_id, a.title, a.category, a.requirement, ua.earned_at
                FROM   user_achievements ua
                JOIN   achievements a ON a.achievement_id = ua.achievement_id
                WHERE  ua.uid = ?
                ORDER  BY ua.earned_at
                """;
        return QueryHelper.queryList(sql, rs -> {
            Achievement a = new Achievement(
                    rs.getString("achievement_id"),
                    rs.getString("title"),
                    rs.getString("category"),
                    rs.getString("requirement"));
            return new AbstractMap.SimpleEntry<>(a, rs.getTimestamp("earned_at").toLocalDateTime());
        }, uid);
    }
}
