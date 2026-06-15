package com.mathify.controller;

import com.mathify.dao.QuizDAO;
import com.mathify.model.*;
import com.mathify.service.ProgressService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;
import java.util.*;

@WebServlet("/quiz")
public class QuizServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        HttpSession session = req.getSession(false);
//        if (session == null || session.getAttribute("authUser") == null) {
//            resp.sendRedirect(req.getContextPath() + "/login");
//            return;
//        }
        User user         = (session != null) ? (User) session.getAttribute("user") : null;
        UserProgress prog = (session != null) ? (UserProgress) session.getAttribute("progress") : null;
        AuthUser authUser = (session != null) ? (AuthUser) session.getAttribute("authUser") : null;
        req.setAttribute("user", user);
        req.setAttribute("authUser", authUser);
        req.setAttribute("progress", prog);
        req.getRequestDispatcher("/WEB-INF/jsp/pages/quiz/index.jsp")
           .forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("authUser") == null) {
            resp.sendError(HttpServletResponse.SC_UNAUTHORIZED, "User not authenticated");
            return;
        }

        AuthUser authUser = (AuthUser) session.getAttribute("authUser");
        UserProgress progress = (UserProgress) session.getAttribute("progress");
        if (progress == null) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "User progress not initialized");
            return;
        }

        String quizId = req.getParameter("quizId");
        if (quizId == null || quizId.isBlank()) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing quizId");
            return;
        }

        // Check energy
        if (progress.getEnergy() <= 0) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "No energy left to attempt this quiz");
            return;
        }

        try {
            Quiz quiz = new QuizDAO().findById(quizId);
            if (quiz == null) {
                resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Quiz not found");
                return;
            }

            int totalPoints = 0;
            int earnedPoints = 0;

            for (Question q : quiz.getQuestions()) {
                totalPoints += q.getPoints();
                Answer answer = null;

                switch (q.getType()) {
                    case MULTIPLE_CHOICE -> {
                        String[] selected = req.getParameterValues(q.getId());
                        Set<String> selectedSet = selected != null ? new HashSet<>(Arrays.asList(selected)) : Collections.emptySet();
                        answer = new Answer.MultipleChoiceAnswer(selectedSet);
                    }
                    case FILL_BLANK -> {
                        String[] filled = req.getParameterValues(q.getId());
                        List<String> filledList = filled != null ? Arrays.asList(filled) : Collections.emptyList();
                        answer = new Answer.FillBlankAnswer(filledList);
                    }
                    case DRAG_AND_DROP -> {
                        Map<String, String> pairings = new HashMap<>();
                        if (q instanceof DragDropQuestion ddq) {
                            for (DragItem item : ddq.getDraggables()) {
                                String zoneId = req.getParameter(q.getId() + "_" + item.id());
                                if (zoneId != null) {
                                    pairings.put(item.id(), zoneId);
                                }
                            }
                        }
                        answer = new Answer.DragAndDropAnswer(pairings);
                    }
                }

                if (answer != null && q.evaluate(answer)) {
                    earnedPoints += q.getPoints();
                }
            }

            // Calculate percentage score (accuracy)
            int score = totalPoints > 0 ? (int) Math.round(((double) earnedPoints / totalPoints) * 100) : 0;

            // Record quiz attempt
            new ProgressService().recordQuizAttempt(authUser.uid(), quizId, score, progress);

            String acceptHeader = req.getHeader("Accept");
            if (acceptHeader != null && acceptHeader.contains("application/json")) {
                resp.setContentType("application/json");
                resp.getWriter().write(String.format("{\"score\":%d,\"passed\":%b}", score, score >= quiz.getPassingScore()));
            } else {
                resp.sendRedirect(req.getContextPath() + "/course");
            }

        } catch (SQLException e) {
            throw new ServletException("Failed to process quiz submission", e);
        }
    }
}
