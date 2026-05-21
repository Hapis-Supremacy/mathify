/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mathify.service;

import com.mathify.dao.CourseDAO;
import com.mathify.model.Course;
import java.util.List;

/**
 *
 * @author Akari
 */
public class CourseService {

    private CourseDAO courseDAO;

    public CourseService() {
        this.courseDAO = new CourseDAO();
    }

    public List<Course> getAllCourses() {
        return courseDAO.getAllCourses();
    }

    public Course getCourseById(int id) {
        if (id <= 0) {
            throw new IllegalArgumentException("ID course tidak valid!");
        }
        return courseDAO.getCourseById(id);
    }

    public List<Course> searchCourse(String keyword) {
        if (keyword == null || keyword.trim().isEmpty()) {
            return getAllCourses();
        }
        return courseDAO.searchCourse(keyword.trim());
    }

    public void addCourse(Course course) {
        if (course.getTitle() == null || course.getTitle().isEmpty()) {
            throw new IllegalArgumentException("Judul course tidak boleh kosong!");
        }
        courseDAO.insertCourse(course);
    }

    public void updateCourse(int id, Course updatedCourse) {
        courseDAO.updateCourse(id, updatedCourse);
    }

    public void deleteCourse(int id) {
        courseDAO.deleteCourse(id);
    }

    public int getTotalCourses() {
        return courseDAO.getTotalCourses();
    }
}
