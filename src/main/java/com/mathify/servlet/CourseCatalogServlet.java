/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mathify.servlet;

import com.mathify.model.Course;
import com.mathify.service.CourseService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 *
 * @author Akari
 */
@WebServlet("/course-catalog")
public class CourseCatalogServlet extends HttpServlet {

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        CourseService service = new CourseService();

        // Cek apakah ada parameter search
        String keyword = request.getParameter("search");
        List<Course> courseList;

        if (keyword != null && !keyword.trim().isEmpty()) {
            courseList = service.searchCourse(keyword);
            request.setAttribute("keyword", keyword);
        } else {
            courseList = service.getAllCourses();
        }

        request.setAttribute("courseList", courseList);
        request.setAttribute("totalCourses", service.getTotalCourses());

        request.getRequestDispatcher("course-catalog.jsp")
                .forward(request, response);
    }
}
