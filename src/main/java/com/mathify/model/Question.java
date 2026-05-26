/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mathify.model;

/**
 *
 * @author ACER
 */
public interface Question {

    QuestionInfo getInfo();

    default String getId() {
        return getInfo().id();
    }

    default String getPrompt() {
        return getInfo().prompt();
    }

    default int getPoints() {
        return getInfo().points();
    }

    QuestionType getType();

    boolean evaluate(String answer);
}
