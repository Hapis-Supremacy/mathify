package com.mathify.service;

import com.mathify.dao.CourseEnrollmentDAO;
import com.mathify.dao.UserProgressDAO;
import com.mathify.model.UserProgress;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;

import java.sql.SQLException;
import java.util.List;

/**
 * Read-side queries scoped to the current student (the {@code /api/me} and
 * {@code /api/students/me/...} endpoints). Identity comes from the session; this
 * service resolves the progress and enrolment data hung off a {@code uid}.
 */
@ApplicationScoped
public class StudentService {

    @Inject
    private UserProgressDAO progressDAO;

    @Inject
    private CourseEnrollmentDAO enrollmentDAO;

    /** The student's progress row, created lazily on first access. */
    public UserProgress getProgress(String uid) {
        try {
            return progressDAO.findOrCreate(uid);
        } catch (SQLException e) {
            throw new RuntimeException("DB error", e);
        }
    }

    /** The student's enrolments enriched with chapter-derived progress. */
    public List<CourseEnrollmentDAO.EnrollmentProgress> getEnrollmentProgress(String uid) {
        try {
            return enrollmentDAO.findProgressByUser(uid);
        } catch (SQLException e) {
            throw new RuntimeException("DB error", e);
        }
    }
}
