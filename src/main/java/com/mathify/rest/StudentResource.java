package com.mathify.rest;

import com.mathify.dao.CourseEnrollmentDAO.EnrollmentProgress;
import com.mathify.model.AuthUser;
import com.mathify.rest.dto.response.EnrollmentResponse;
import com.mathify.rest.dto.response.ErrorResponse;
import com.mathify.rest.filter.Secured;
import com.mathify.service.StudentService;
import jakarta.inject.Inject;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.Context;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

/**
 * Student-scoped collections under {@code /api/students/me/...}.
 *
 * <pre>
 *   GET /api/students/me/enrollments
 *     -> [ { courseId, status, lastAccessedAt, progressPercent }, ... ]
 * </pre>
 *
 * {@code status} is {@code COMPLETED} once the enrolment's completion date is
 * set, else {@code IN_PROGRESS}. {@code progressPercent} is completed chapters
 * over total chapters (100 once the course is complete). {@code lastAccessedAt}
 * is the latest chapter activity, falling back to the enrolment date.
 */
@Path("/students/me")
@Produces(MediaType.APPLICATION_JSON)
@Secured
public class StudentResource {

    @Inject
    private StudentService studentService;

    @GET
    @Path("/enrollments")
    public Response enrollments(@Context HttpServletRequest request) {
        AuthUser user = Sessions.currentUser(request);
        if (user == null) {
            return Response.status(Response.Status.UNAUTHORIZED)
                    .entity(new ErrorResponse("unauthenticated", null)).build();
        }
        List<EnrollmentResponse> out = new ArrayList<>();
        for (EnrollmentProgress e : studentService.getEnrollmentProgress(user.uid())) {
            out.add(toResponse(e));
        }
        return Response.ok(out).build();
    }

    private static EnrollmentResponse toResponse(EnrollmentProgress e) {
        boolean completed = e.completedAt() != null;
        String status = completed ? "COMPLETED" : "IN_PROGRESS";

        int percent;
        if (completed) {
            percent = 100;
        } else if (e.totalChapters() > 0) {
            percent = (int) Math.round(100.0 * e.completedChapters() / e.totalChapters());
        } else {
            percent = 0;
        }

        LocalDateTime lastAccessed = (e.lastActivity() != null) ? e.lastActivity() : e.enrolledAt();
        return new EnrollmentResponse(
                e.courseId(),
                status,
                lastAccessed != null ? lastAccessed.toString() : null,
                percent);
    }
}
