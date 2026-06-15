package com.mathify.dao;

import com.mathify.model.LearningModule;
import com.mathify.model.ModuleInfo;
import com.mathify.model.ModuleType;
import com.mathify.model.Slide;
import com.mathify.model.SlideModule;
import com.mathify.model.VideoModule;
import com.mathify.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.Duration;
import java.util.ArrayList;
import java.util.List;

/**
 * Persists and reconstructs polymorphic {@link LearningModule}s. The base row lives
 * in {@code learning_modules}; subtype payload lives in {@code video_modules} or
 * {@code slide_modules} (+ {@code slides}). Aggregate writes run in one transaction.
 */
public class LearningModuleDAO {

    public void insert(String chapterId, LearningModule module) throws SQLException {
        try (Connection conn = DBConnection.getConnection()) {
            conn.setAutoCommit(false);
            try {
                insertBase(conn, chapterId, module);
                switch (module.getType()) {
                    case VIDEO -> insertVideo(conn, (VideoModule) module);
                    case SLIDE -> insertSlide(conn, (SlideModule) module);
                }
                conn.commit();
            } catch (SQLException e) {
                conn.rollback();
                throw e;
            }
        }
    }

    /** Loads every module for a chapter, ordered, reconstructed into its subtype. */
    public List<LearningModule> findByChapter(String chapterId) throws SQLException {
        String sql = """
                SELECT module_id, title, order_index, type, created_at
                FROM   learning_modules
                WHERE  chapter_id = ?
                ORDER  BY order_index
                """;
        List<LearningModule> modules = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, chapterId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Timestamp created = rs.getTimestamp("created_at");
                    ModuleInfo info = new ModuleInfo(
                            rs.getString("module_id"),
                            rs.getString("title"),
                            rs.getInt("order_index"),
                            created != null ? created.toLocalDateTime() : null);
                    ModuleType type = ModuleType.valueOf(rs.getString("type"));
                    modules.add(switch (type) {
                        case VIDEO -> loadVideo(conn, info);
                        case SLIDE -> loadSlide(conn, info);
                    });
                }
            }
        }
        return modules;
    }

    public void delete(String moduleId) throws SQLException {
        // Subtype + slide rows cascade via FK ON DELETE CASCADE.
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement("DELETE FROM learning_modules WHERE module_id = ?")) {
            ps.setString(1, moduleId);
            ps.executeUpdate();
        }
    }

    // ── Inserts ──────────────────────────────────────────────────────────────

    private void insertBase(Connection conn, String chapterId, LearningModule m) throws SQLException {
        String sql = """
                INSERT INTO learning_modules (module_id, chapter_id, title, order_index, type, created_at)
                VALUES (?, ?, ?, ?, ?, COALESCE(?, NOW()))
                """;
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, m.getId());
            ps.setString(2, chapterId);
            ps.setString(3, m.getTitle());
            ps.setInt(4, m.getOrderIndex());
            ps.setString(5, m.getType().name());
            ps.setObject(6, m.getCreatedAt());
            ps.executeUpdate();
        }
    }

    private void insertVideo(Connection conn, VideoModule m) throws SQLException {
        String sql = """
                INSERT INTO video_modules (module_id, video_url, duration_seconds, thumbnail_url)
                VALUES (?, ?, ?, ?)
                """;
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, m.getId());
            ps.setString(2, m.getVideoUrl());
            ps.setLong(3, m.estimatedDuration() != null ? m.estimatedDuration().getSeconds() : 0L);
            ps.setString(4, m.getThumbnailUrl());
            ps.executeUpdate();
        }
    }

    private void insertSlide(Connection conn, SlideModule m) throws SQLException {
        try (PreparedStatement ps = conn.prepareStatement(
                "INSERT INTO slide_modules (module_id, seconds_per_slide) VALUES (?, ?)")) {
            ps.setString(1, m.getId());
            ps.setInt(2, m.getSecondsPerSlide());
            ps.executeUpdate();
        }
        try (PreparedStatement ps = conn.prepareStatement(
                "INSERT INTO slides (module_id, slide_order, image_url, caption) VALUES (?, ?, ?, ?)")) {
            for (Slide slide : m.getSlides()) {
                ps.setString(1, m.getId());
                ps.setInt(2, slide.order());
                ps.setString(3, slide.imageUrl());
                ps.setString(4, slide.caption());
                ps.addBatch();
            }
            ps.executeBatch();
        }
    }

    // ── Loaders ──────────────────────────────────────────────────────────────

    private VideoModule loadVideo(Connection conn, ModuleInfo info) throws SQLException {
        String sql = "SELECT video_url, duration_seconds, thumbnail_url FROM video_modules WHERE module_id = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, info.id());
            try (ResultSet rs = ps.executeQuery()) {
                if (!rs.next()) {
                    throw new SQLException("video_modules row missing for module " + info.id());
                }
                return new VideoModule(
                        info,
                        rs.getString("video_url"),
                        Duration.ofSeconds(rs.getLong("duration_seconds")),
                        rs.getString("thumbnail_url"));
            }
        }
    }

    private SlideModule loadSlide(Connection conn, ModuleInfo info) throws SQLException {
        int secondsPerSlide = 0;
        try (PreparedStatement ps = conn.prepareStatement(
                "SELECT seconds_per_slide FROM slide_modules WHERE module_id = ?")) {
            ps.setString(1, info.id());
            try (ResultSet rs = ps.executeQuery()) {
                if (!rs.next()) {
                    throw new SQLException("slide_modules row missing for module " + info.id());
                }
                secondsPerSlide = rs.getInt("seconds_per_slide");
            }
        }
        List<Slide> slides = new ArrayList<>();
        try (PreparedStatement ps = conn.prepareStatement(
                "SELECT slide_order, image_url, caption FROM slides WHERE module_id = ? ORDER BY slide_order")) {
            ps.setString(1, info.id());
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    slides.add(new Slide(rs.getInt("slide_order"), rs.getString("image_url"), rs.getString("caption")));
                }
            }
        }
        return new SlideModule(info, slides, secondsPerSlide);
    }
}
