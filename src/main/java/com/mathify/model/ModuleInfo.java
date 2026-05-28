package com.mathify.model;

import java.time.LocalDateTime;

public record ModuleInfo(
    String id,
    String title,
    int orderIndex,
    LocalDateTime createdAt
) {}