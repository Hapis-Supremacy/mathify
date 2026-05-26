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

public class DragDropQuestion implements Question {

    public static final String DELIMITER = ",";

    private final QuestionInfo info;
    private final List<String> items;
    private final List<String> correctOrder;

    public DragDropQuestion(QuestionInfo info, List<String> items, List<String> correctOrder) {
        if (info == null) {
            throw new IllegalArgumentException("info must not be null");
        }
        if (items == null || items.isEmpty()) {
            throw new IllegalArgumentException("items must not be empty");
        }
        if (correctOrder == null || correctOrder.isEmpty()) {
            throw new IllegalArgumentException("correctOrder must not be empty");
        }
        if (items.size() != correctOrder.size()) {
            throw new IllegalArgumentException("items and correctOrder must have the same size");
        }

        this.info = info;
        this.items = Collections.unmodifiableList(new ArrayList<>(items));
        this.correctOrder = Collections.unmodifiableList(new ArrayList<>(correctOrder));
    }

    @Override
    public QuestionInfo getInfo() {
        return info;
    }

    @Override
    public QuestionType getType() {
        return QuestionType.DRAG_AND_DROP;
    }

    public List<String> getItems() {
        return items;
    }

    public List<String> getCorrectOrder() {
        return correctOrder;
    }

    public String getAnswer() {
        return String.join(DELIMITER, correctOrder);
    }

    @Override
    public boolean evaluate(String answer) {
        if (answer == null) {
            return false;
        }

        String[] submitted = answer.split(DELIMITER, -1);
        if (submitted.length != correctOrder.size()) {
            return false;
        }

        for (int i = 0; i < correctOrder.size(); i++) {
            if (!correctOrder.get(i).equalsIgnoreCase(submitted[i].trim())) {
                return false;
            }
        }
        return true;
    }

    @Override
    public String toString() {
        return "DragDropQuestion{id='" + info.id() + "', correctOrder=" + correctOrder + '}';
    }
}
