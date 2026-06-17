package com.mathify.service;

import com.mathify.dao.CourseDAO;
import com.mathify.dao.CourseEnrollmentDAO;
import com.mathify.model.Course;
import com.mathify.model.CourseCardView;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import java.util.List;
import java.sql.SQLException;

@ApplicationScoped
public class CourseService {

    @Inject
    private CourseDAO courseDAO;

    @Inject
    private CourseEnrollmentDAO enrollmentDAO;

    public List<CourseCardView> getAllCourses() {
        try {
            return courseDAO.findAll();
        } catch (SQLException e) {
            throw new RuntimeException("DB error", e);
        }
    }

    public Course getCourse(String id) {
        try {
            return courseDAO.findCourse(id);
        } catch (SQLException e) {
            throw new RuntimeException("DB error", e);
        }
    }

    /** Every prerequisite edge across the catalog — the skill-tree graph. */
    public List<CourseDAO.PrereqEdge> getAllPrerequisites() {
        try {
            return courseDAO.findAllPrerequisites();
        } catch (SQLException e) {
            throw new RuntimeException("DB error", e);
        }
    }

    /** Ordered learning path to reach {@code courseId} (transitive prereqs first, target last). */
    public List<CourseCardView> getPrerequisitePath(String courseId) {
        try {
            return courseDAO.findPrerequisitePath(courseId);
        } catch (SQLException e) {
            throw new RuntimeException("DB error", e);
        }
    }

    /** Whether {@code uid} is already enrolled in {@code courseId}. */
    public boolean isEnrolled(String uid, String courseId) {
        try {
            return enrollmentDAO.find(uid, courseId) != null;
        } catch (SQLException e) {
            throw new RuntimeException("DB error", e);
        }
    }

    /** Enrolls {@code uid} in {@code courseId}. Caller is responsible for the
     *  existence / duplicate checks; the DAO is a no-op if already enrolled. */
    public void enroll(String uid, String courseId) {
        try {
            enrollmentDAO.enroll(uid, courseId);
        } catch (SQLException e) {
            throw new RuntimeException("DB error", e);
        }
    }
}
