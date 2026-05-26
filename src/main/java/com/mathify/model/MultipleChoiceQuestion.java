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

public class MultipleChoiceQuestion implements Question {

    private final QuestionInfo info;
    private final List<String> options;
    private final String correctOptionId;

    public MultipleChoiceQuestion(QuestionInfo info, List<String> options, String correctOptionId) {
        if (info == null) {
            throw new IllegalArgumentException("info must not be null");
        }
        if (options == null || options.size() < 2) {
            throw new IllegalArgumentException("options must have at least 2 entries");
        }
        if (correctOptionId == null) {
            throw new IllegalArgumentException("correctOptionId must not be null");
        }

        int idx = Integer.parseInt(correctOptionId);
        if (idx < 0 || idx >= options.size()) {
            throw new IllegalArgumentException("correctOptionId out of range");
        }

        this.info = info;
        this.options = Collections.unmodifiableList(new ArrayList<>(options));
        this.correctOptionId = correctOptionId;
    }

    @Override
    public QuestionInfo getInfo() {
        return info;
    }

    @Override
    public QuestionType getType() {
        return QuestionType.MULTIPLE_CHOICE;
    }

    public String getAnswer() {
        return options.get(Integer.parseInt(correctOptionId));
    }

    public List<String> getOptions() {
        return options;
    }

    public String getCorrectOptionId() {
        return correctOptionId;
    }

    @Override
    public boolean evaluate(String answer) {
        if (answer == null) {
            return false;
        }
        return correctOptionId.equalsIgnoreCase(answer.trim());
    }

    @Override
    public String toString() {
        return "MultipleChoiceQuestion{id='" + info.id() + "', options=" + options
                + ", correctOptionId=" + correctOptionId + '}';
    }
}
