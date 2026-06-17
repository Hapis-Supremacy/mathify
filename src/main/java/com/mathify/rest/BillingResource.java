package com.mathify.rest;

import com.mathify.model.AuthUser;
import com.mathify.rest.dto.request.CheckoutRequest;
import com.mathify.rest.dto.response.CheckoutResponse;
import com.mathify.rest.dto.response.ErrorResponse;
import com.mathify.rest.filter.Secured;
import com.mathify.service.BillingService;
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

/**
 * Subscription billing under {@code /api/billing/...}.
 *
 * <pre>
 *   POST /api/billing/checkout   { "planId": "ANNUAL" }
 *     -> 200 { redirectUrl, token, orderId }
 * </pre>
 *
 * Starts a Midtrans Snap checkout; the Plans CTA redirects the browser to
 * {@code redirectUrl}. Auth is required.
 */
@Path("/billing")
@Produces(MediaType.APPLICATION_JSON)
@Secured
public class BillingResource {

    @Inject
    private BillingService billingService;

    @POST
    @Path("/checkout")
    @Consumes(MediaType.APPLICATION_JSON)
    public Response checkout(@Valid CheckoutRequest request, @Context HttpServletRequest httpRequest) {
        AuthUser user = Sessions.currentUser(httpRequest);
        if (user == null) {
            return Response.status(Response.Status.UNAUTHORIZED)
                    .entity(new ErrorResponse("unauthenticated", null)).build();
        }
        CheckoutResponse body = billingService.checkout(user, request.getPlanId());
        return Response.ok(body).build();
    }
}
