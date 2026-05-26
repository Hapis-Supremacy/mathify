/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mathify.model;

/**
 *
 * @author ACER
 */
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class Quiz {

    private final String quizId;
    private final String title;
    private final int passingScore;
    private final List<Question> questions;

    public Quiz(String quizId, String title, int passingScore, List<Question> questions) {
        if (quizId == null || quizId.isBlank()) {
            throw new IllegalArgumentException("quizId must not be blank");
        }
        if (title == null || title.isBlank()) {
            throw new IllegalArgumentException("title must not be blank");
        }
        if (passingScore < 0) {
            throw new IllegalArgumentException("passingScore must be >= 0");
        }
        if (questions == null || questions.isEmpty()) {
            throw new IllegalArgumentException("a quiz must have at least one question");
        }

        this.quizId = quizId;
        this.title = title;
        this.passingScore = passingScore;
        this.questions = Collections.unmodifiableList(new ArrayList<>(questions));
    }

    public String getQuizId() {
        return quizId;
    }

    public String getTitle() {
        return title;
    }

    public int getPassingScore() {
        return passingScore;
    }

    public List<Question> getQuestions() {
        return questions;
    }

    public int totalPoints() {
        int total = 0;
        for (Question q : questions) {
            total += q.getPoints();
        }
        return total;
    }

    public boolean isPassed(int score) {
        return score >= passingScore;
    }

    @Override
    public String toString() {
        return "Quiz{quizId='" + quizId + "', title='" + title
                + "', passingScore=" + passingScore
                + ", questions=" + questions.size()
                + ", totalPoints=" + totalPoints() + '}';
    }
}
