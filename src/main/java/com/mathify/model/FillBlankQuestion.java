/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mathify.model;

/**
 *
 * @author ACER
 */
public class FillBlankQuestion implements Question {

    private final QuestionInfo info;
    private final String correctAnswer;

    public FillBlankQuestion(QuestionInfo info, String correctAnswer) {
        if (info == null) {
            throw new IllegalArgumentException("info must not be null");
        }
        if (correctAnswer == null || correctAnswer.isBlank()) {
            throw new IllegalArgumentException("correctAnswer must not be blank");
        }
        this.info = info;
        this.correctAnswer = correctAnswer;
    }

    @Override
    public QuestionInfo getInfo() {
        return info;
    }

    @Override
    public QuestionType getType() {
        return QuestionType.FILL_BLANK;
    }

    public String getAnswer() {
        return correctAnswer;
    }

    @Override
    public boolean evaluate(String answer) {
        if (answer == null) {
            return false;
        }
        return correctAnswer.equalsIgnoreCase(answer.trim());
    }

    @Override
    public String toString() {
        return "FillBlankQuestion{id='" + info.id() + "', correctAnswer='" + correctAnswer + "'}";
    }
}
