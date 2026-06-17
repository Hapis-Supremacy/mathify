package com.mathify.rest.dto.request;

import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import java.util.List;

public record CourseInput(
    @NotBlank String title,
    @NotBlank String description,
    @NotBlank String category,
    @NotBlank String level,
    @Min(1) int levelNum,
    @NotBlank String color,
    String glyph,
    String estimatedHours,
    @Min(0) Integer xpReward,
    String status,
    List<String> prerequisite
) {}
