package com.mathify.rest.dto.response;

/**
 * {@code GET /api/me} — compact current-user profile consumed globally by the
 * navbar, dashboard header and profile summary.
 */
public record MeResponse(String name, String initial, int streak, int xp, int level) {}
