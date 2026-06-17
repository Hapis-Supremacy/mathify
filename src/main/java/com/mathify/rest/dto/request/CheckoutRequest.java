package com.mathify.rest.dto.request;

import jakarta.validation.constraints.NotBlank;

/** Body of {@code POST /api/billing/checkout}. {@code planId} is a {@link com.mathify.model.Plan} name (e.g. {@code "ANNUAL"}). */
public class CheckoutRequest {

    @NotBlank(message = "planId is required")
    private String planId;

    public String getPlanId() { return planId; }
    public void setPlanId(String planId) { this.planId = planId; }
}
