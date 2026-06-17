package com.mathify.rest.filter;

import jakarta.annotation.Priority;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.ws.rs.Priorities;
import jakarta.ws.rs.container.ContainerRequestContext;
import jakarta.ws.rs.container.ContainerRequestFilter;
import jakarta.ws.rs.core.Context;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;
import jakarta.ws.rs.ext.Provider;

import java.io.IOException;

@AdminSecured
@Provider
@Priority(Priorities.AUTHORIZATION)
public class AdminAuthenticationFilter implements ContainerRequestFilter {

    @Context
    private HttpServletRequest request;

    @Override
    public void filter(ContainerRequestContext requestContext) throws IOException {
        HttpSession session = request.getSession(false);
        boolean isAdmin = session != null && session.getAttribute("admin") != null;
        
        if (!isAdmin) {
            requestContext.abortWith(
                Response.status(Response.Status.FORBIDDEN)
                        .entity("{\"error\":\"Forbidden\", \"message\":\"Admin access required\"}")
                        .type(MediaType.APPLICATION_JSON)
                        .build());
        }
    }
}
