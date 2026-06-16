package com.mathify.rest.dto.response;

/** One directed edge of the prerequisite graph: complete {@code from} before {@code to}. */
public record PrereqEdgeResponse(String from, String to) {}
