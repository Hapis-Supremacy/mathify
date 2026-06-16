package com.mathify.rest.dto.response;

import java.util.List;

/** {@code GET /api/courses/paths} — the whole prerequisite DAG (skill tree). */
public record PrereqGraphResponse(List<CourseNode> nodes, List<PrereqEdgeResponse> edges) {}
