<%-- 
    Document   : course-catalog
    Created on : May 19, 2026, 11:48:36 PM
    Author     : Akari
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.mathify.model.Course"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Course Catalog - Mathify</title>
        <style>
            body {
                font-family: Arial;
                background: #f5f5f5;
                padding: 20px;
            }
            h1 { color: #333; }
            .search-bar {
                margin-bottom: 20px;
            }
            .search-bar input {
                padding: 10px;
                width: 300px;
                border-radius: 8px;
                border: 1px solid #ccc;
            }
            .search-bar button {
                padding: 10px 16px;
                background: #4F46E5;
                color: white;
                border: none;
                border-radius: 8px;
                cursor: pointer;
            }
            .course-card {
                background: white;
                padding: 20px;
                margin-bottom: 20px;
                border-radius: 10px;
                box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            }
            .level { color: #4F46E5; font-weight: bold; }
            .btn {
                display: inline-block;
                padding: 10px 15px;
                background: #4F46E5;
                color: white;
                border-radius: 8px;
                text-decoration: none;
            }
            .btn:hover { opacity: 0.8; }
            .empty { color: #999; }
        </style>
    </head>
    <body>
        <h1>Course Catalog Mathify</h1>

        <!-- SEARCH FORM -->
        <div class="search-bar">
            <form method="get" action="course-catalog">
                <input type="text"
                       name="search"
                       placeholder="Cari kursus..."
                       value="<%= request.getAttribute("keyword") != null
                                   ? request.getAttribute("keyword") : "" %>"/>
                <button type="submit">Cari</button>
            </form>
        </div>

        <p>Total kursus: <strong><%= request.getAttribute("totalCourses") %></strong></p>

        <%
            List<Course> courseList =
                    (List<Course>) request.getAttribute("courseList");

            if (courseList != null && !courseList.isEmpty()) {
                for (Course course : courseList) {
        %>
        <div class="course-card">
            <h2><%= course.getTitle() %></h2>
            <p><%= course.getDescription() %></p>
            <p class="level">Level: <%= course.getLevel() %></p>
            <a href="lesson-content?id=1" class="btn">Mulai Belajar</a>
        </div>
        <%
                }
            } else {
        %>
        <p class="empty">Kursus tidak ditemukan.</p>
        <%
            }
        %>
    </body>
</html>