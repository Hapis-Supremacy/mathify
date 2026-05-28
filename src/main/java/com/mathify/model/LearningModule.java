package com.mathify.model;

import java.time.Duration;
import java.time.LocalDateTime;

public interface LearningModule {
    String getId();
    String getTitle();
    int getOrderIndex();
    LocalDateTime getCreatedAt();
    ModuleType getType();
    Duration estimatedDuration();
}