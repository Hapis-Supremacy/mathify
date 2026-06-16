package com.mathify.dao;

import jakarta.enterprise.context.ApplicationScoped;

import com.mathify.model.CourseEnrollment;
import com.mathify.util.QueryHelper;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;

/** Per-user course enrollments ({@code course_enrollments}). */
@ApplicationScoped
public class CourseEnrollmentDAO {

    /** Enrolls a user in a course. No-op if already enrolled. */
    public void enroll(String uid, String courseId) throws SQLException {
        String sql = """
                INSERT INTO course_enrollments (uid, course_id)
                VALUES (?, ?)
                ON CONFLICT (uid, course_id) DO NOTHING
                """;
        QueryHelper.executeUpdate(sql, uid, courseId);
    }

    /** Marks an existing enrollment complete (sets completed_at if not already set). */
    public void markCompleted(String uid, String courseId) throws SQLException {
        String sql = """
                UPDATE course_enrollments
                SET    completed_at = NOW()
                WHERE  uid = ? AND course_id = ? AND completed_at IS NULL
                """;
        QueryHelper.executeUpdate(sql, uid, courseId);
    }

    public CourseEnrollment find(String uid, String courseId) throws SQLException {
        String sql = "SELECT * FROM course_enrollments WHERE uid = ? AND course_id = ?";
        return QueryHelper.queryOne(sql, CourseEnrollmentDAO::map, uid, courseId);
    }

    public List<CourseEnrollment> findByUser(String uid) throws SQLException {
        String sql = "SELECT * FROM course_enrollments WHERE uid = ? ORDER BY enrolled_at";
        return QueryHelper.queryList(sql, CourseEnrollmentDAO::map, uid);
    }

    /**
     * An enrolment enriched with chapter-derived progress: completion counts and
     * the most recent activity timestamp. Powers {@code GET /api/students/me/enrollments}.
     */
    public record EnrollmentProgress(String courseId, LocalDateTime enrolledAt, LocalDateTime completedAt,
                                     LocalDateTime lastActivity, int completedChapters, int totalChapters) {}

    /**
     * Every enrolment for {@code uid} with progress folded in. {@code last_activity}
     * is the latest completed chapter for that course; {@code completed_chapters} /
     * {@code total_chapters} drive the percentage. Computed in one query — the two
     * LEFT JOINs aggregate chapter progress and the course's chapter count
     * separately so courses with no progress still return a row (counts 0).
     */
    public List<EnrollmentProgress> findProgressByUser(String uid) throws SQLException {
        String sql = """
                SELECT ce.course_id,
                       ce.enrolled_at,
                       ce.completed_at,
                       prog.last_activity,
                       COALESCE(prog.completed_chapters, 0) AS completed_chapters,
                       COALESCE(tot.total_chapters, 0)      AS total_chapters
                FROM course_enrollments ce
                LEFT JOIN (
                    SELECT ch.course_id,
                           MAX(cp.completed_at) AS last_activity,
                           COUNT(*) FILTER (WHERE cp.completed_at IS NOT NULL) AS completed_chapters
                    FROM chapter_progress cp
                    JOIN chapters ch ON ch.chapter_id = cp.chapter_id
                    WHERE cp.uid = ?
                    GROUP BY ch.course_id
                ) prog ON prog.course_id = ce.course_id
                LEFT JOIN (
                    SELECT course_id, COUNT(*) AS total_chapters
                    FROM chapters
                    GROUP BY course_id
                ) tot ON tot.course_id = ce.course_id
                WHERE ce.uid = ?
                ORDER BY ce.enrolled_at
                """;
        return QueryHelper.queryList(sql, CourseEnrollmentDAO::mapProgress, uid, uid);
    }

    static EnrollmentProgress mapProgress(java.sql.ResultSet rs) throws SQLException {
        Timestamp completed = rs.getTimestamp("completed_at");
        Timestamp last = rs.getTimestamp("last_activity");
        return new EnrollmentProgress(
                rs.getString("course_id"),
                rs.getTimestamp("enrolled_at").toLocalDateTime(),
                (completed != null) ? completed.toLocalDateTime() : null,
                (last != null) ? last.toLocalDateTime() : null,
                rs.getInt("completed_chapters"),
                rs.getInt("total_chapters"));
    }

    /**
     * Returns the course_id the user most recently interacted with,
     * ranked by latest chapter activity falling back to enroll date.
     * Returns {@code null} if the user has no enrollments.
     */
    public String findLastAccessedCourseId(String uid) throws SQLException {
        String sql = """
                SELECT ce.course_id
                FROM course_enrollments ce
                LEFT JOIN (
                    SELECT ch.course_id, MAX(cp.completed_at) AS last_activity
                    FROM chapter_progress cp
                    JOIN chapters ch ON ch.chapter_id = cp.chapter_id
                    WHERE cp.uid = ?
                    GROUP BY ch.course_id
                ) recent ON recent.course_id = ce.course_id
                WHERE ce.uid = ?
                ORDER BY COALESCE(recent.last_activity, ce.enrolled_at) DESC
                LIMIT 1
                """;
        return QueryHelper.queryOne(sql, rs -> rs.getString("course_id"), uid, uid);
    }

    static CourseEnrollment map(java.sql.ResultSet rs) throws SQLException {
        Timestamp completed = rs.getTimestamp("completed_at");
        LocalDateTime completedAt = (completed != null) ? completed.toLocalDateTime() : null;
        return new CourseEnrollment(
                rs.getString("course_id"),
                rs.getTimestamp("enrolled_at").toLocalDateTime(),
                completedAt);
    }
}

