package com.mathify.rest;

import com.mathify.model.AuthUser;
import com.mathify.model.UserProgress;
import com.mathify.rest.dto.response.ErrorResponse;
import com.mathify.rest.dto.response.MeResponse;
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

/**
 * {@code GET /api/me} — the compact current-user profile used by the navbar,
 * dashboard header and profile summary.
 *
 * <pre>
 *   GET /api/me -> { name, initial, streak, xp, level }
 * </pre>
 *
 * Identity is read from the session ({@code authUser}, set at login); streak /
 * XP / level come from the progress store. {@code 401} when the session has no
 * student identity.
 */
@Path("/me")
@Produces(MediaType.APPLICATION_JSON)
@Secured
public class MeResource {

    @Inject
    private StudentService studentService;

    @GET
    public Response me(@Context HttpServletRequest request) {
        AuthUser user = Sessions.currentUser(request);
        if (user == null) {
            return Response.status(Response.Status.UNAUTHORIZED)
                    .entity(new ErrorResponse("unauthenticated", null)).build();
        }
        UserProgress p = studentService.getProgress(user.uid());
        MeResponse body = new MeResponse(
                user.preferredName(),
                user.initial(),
                p.getCurrentStreak(),
                p.getTotalXP(),
                p.getLevel());
        return Response.ok(body).build();
    }
}
