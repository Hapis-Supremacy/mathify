package com.mathify.rest.dto.request;

import jakarta.validation.Valid;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import java.util.List;

public record QuestionInput(
    @NotBlank String prompt,
    @Min(0) int points,
    @NotBlank String type,
    @Valid @Size(min = 2) List<OptionInput> options
) {}
