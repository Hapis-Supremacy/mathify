package com.mathify.rest.dto.request;

import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;

public record QuizInput(
    @NotBlank String title,
    @Min(0) int passingScore
) {}
