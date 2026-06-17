package com.mathify.rest.dto.request;

import jakarta.validation.constraints.NotBlank;

public record ChapterInput(
    @NotBlank String title,
    Integer order
) {}
