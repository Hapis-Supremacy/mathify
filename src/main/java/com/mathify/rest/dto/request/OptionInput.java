package com.mathify.rest.dto.request;

import jakarta.validation.constraints.NotBlank;

public record OptionInput(
    @NotBlank String text,
    boolean correct
) {}
