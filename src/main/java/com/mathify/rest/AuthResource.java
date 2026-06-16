package com.mathify.rest;

import com.mathify.rest.dto.request.LoginRequest;
import com.mathify.rest.dto.response.LoginResponse;
import com.mathify.service.AuthService;
import jakarta.inject.Inject;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;
import jakarta.ws.rs.Consumes;
import jakarta.ws.rs.POST;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.Context;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;

@Path("/auth")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
public class AuthResource {

    @Inject
    private AuthService authService;

    @POST
    @Path("/login")
    public Response login(@Valid LoginRequest request, @Context HttpServletRequest httpRequest) {
        try {
            String role = authService.login(request.getIdToken(), httpRequest);
            return Response.ok(new LoginResponse(role, "Login successful")).build();
        } catch (Exception e) {
            return Response.status(Response.Status.UNAUTHORIZED)
                           .entity("{\"error\":\"Invalid token: " + e.getMessage() + "\"}")
                           .build();
        }
    }

    @POST
    @Path("/logout")
    public Response logout(@Context HttpServletRequest httpRequest) {
        authService.logout(httpRequest);
        return Response.ok("{\"message\":\"Logged out\"}").build();
    }
}
