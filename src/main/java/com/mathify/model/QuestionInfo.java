/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mathify.model;

/**
 *
 * @author ACER
 */
public record QuestionInfo(String id, String prompt, int points) {

    // Compact constructor for validation
    public QuestionInfo {
        if (id == null || id.isBlank()) {
            throw new IllegalArgumentException("id must not be blank");
        }
        if (prompt == null || prompt.isBlank()) {
            throw new IllegalArgumentException("prompt must not be blank");
        }
        if (points < 0) {
            throw new IllegalArgumentException("points must be >= 0");
        }
    }
}
