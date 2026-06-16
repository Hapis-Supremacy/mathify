package com.mathify.rest.dto.response;

/**
 * One row of {@code GET /api/students/me/enrollments}.
 *
 * @param courseId        the enrolled course
 * @param status          {@code IN_PROGRESS} or {@code COMPLETED}
 * @param lastAccessedAt  ISO-8601 timestamp of the latest chapter activity,
 *                        falling back to the enrolment date; never null
 * @param progressPercent 0–100, completed chapters over total chapters
 */
public record EnrollmentResponse(String courseId, String status, String lastAccessedAt, int progressPercent) {}
