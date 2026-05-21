package com.mathify.dao;

import com.mathify.model.Course;
import java.util.ArrayList;
import java.util.List;

public class CourseDAO {

    // Simulasi database (static agar data tidak hilang antar request)
    private static List<Course> courseList = new ArrayList<>();

    // Data dummy awal — mirip pola LessonDAO
    static {
        courseList.add(new Course(
                1,
                "Basic Math",
                "Pelajari dasar-dasar matematika: penjumlahan, pengurangan, perkalian, dan pembagian.",
                "Beginner"
        ));
        courseList.add(new Course(
                2,
                "Algebra",
                "Pahami variabel, persamaan linear, dan sistem persamaan.",
                "Intermediate"
        ));
        courseList.add(new Course(
                3,
                "Calculus",
                "Belajar limit, turunan, dan integral dasar.",
                "Advanced"
        ));
        courseList.add(new Course(
                4,
                "Linear Algebra",
                "Eksplorasi vektor, matriks, dan transformasi linear.",
                "Advanced"
        ));
    }

    // CREATE
    public void insertCourse(Course course) {
        courseList.add(course);
        System.out.println("Course berhasil ditambahkan: " + course.getTitle());
    }

    // READ — semua
    public List<Course> getAllCourses() {
        return courseList;
    }

    // READ — by ID
    public Course getCourseById(int id) {
        for (Course course : courseList) {
            if (course.getId() == id) {
                return course;
            }
        }
        return null;
    }

    // READ — by judul (search)
    public List<Course> searchCourse(String keyword) {
        List<Course> result = new ArrayList<>();
        for (Course course : courseList) {
            if (course.getTitle().toLowerCase()
                    .contains(keyword.toLowerCase())) {
                result.add(course);
            }
        }
        return result;
    }

    // UPDATE
    public void updateCourse(int id, Course updatedCourse) {
        Course course = getCourseById(id);
        if (course != null) {
            course.setTitle(updatedCourse.getTitle());
            course.setDescription(updatedCourse.getDescription());
            course.setLevel(updatedCourse.getLevel());
            System.out.println("Course berhasil diupdate!");
        } else {
            System.out.println("Course tidak ditemukan!");
        }
    }

    // DELETE
    public void deleteCourse(int id) {
        courseList.removeIf(course -> course.getId() == id);
        System.out.println("Course berhasil dihapus!");
    }

    // UTILITY
    public int getTotalCourses() {
        return courseList.size();
    }
}