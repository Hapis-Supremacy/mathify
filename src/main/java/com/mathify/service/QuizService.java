package com.mathify.service;

import com.mathify.dao.QuizDAO;
import com.mathify.model.Quiz;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import java.sql.SQLException;

@ApplicationScoped
public class QuizService {

    @Inject
    private QuizDAO quizDAO;

    public Quiz getQuiz(String id) {
        try {
            return quizDAO.findById(id);
        } catch (SQLException e) {
            throw new RuntimeException("DB error", e);
        }
    }
}
