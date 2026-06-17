package com.mathify.rest.dto.response;

public record QuizSummaryResponse(
    String quizId,
    String title,
    int passingScore,
    int questionCount
) {}
