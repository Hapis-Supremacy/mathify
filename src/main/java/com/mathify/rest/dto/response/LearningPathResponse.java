package com.mathify.rest.dto.response;

import java.util.List;

/**
 * {@code GET /api/courses/paths?courseId=X} — the ordered completion path to
 * reach {@code target}: transitive prerequisites first, the target course last.
 */
public record LearningPathResponse(String target, List<CourseNode> path) {}
