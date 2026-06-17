package com.mathify.rest.dto.response;

/**
 * Result of {@code POST /api/billing/checkout}. The Plans CTA redirects the
 * browser to {@code redirectUrl}; {@code token} backs the embedded Snap popup
 * and {@code orderId} is the reference used to verify the payment on return.
 */
public record CheckoutResponse(String redirectUrl, String token, String orderId) {}
