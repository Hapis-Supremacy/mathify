package com.mathify.service;

import com.mathify.dao.CourseDAO;
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
}
