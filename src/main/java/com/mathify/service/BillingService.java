package com.mathify.service;

import com.mathify.dao.PaymentDAO;
import com.mathify.model.AuthUser;
import com.mathify.model.Payment;
import com.mathify.model.PaymentStatus;
import com.mathify.model.Plan;
import com.mathify.rest.dto.response.CheckoutResponse;
import com.mathify.util.MidtransService;
import com.midtrans.httpclient.error.MidtransError;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * Starts a Midtrans Snap checkout for a paid {@link Plan}.
 *
 * <p>Creates a {@code PENDING} {@link Payment} row first (the audit trail), then
 * asks Midtrans for a Snap token + redirect URL. The payment is only flipped to
 * {@link PaymentStatus#PAID} later, after server-side verification — never here.
 */
@ApplicationScoped
public class BillingService {

    private static final Logger log = LoggerFactory.getLogger(BillingService.class);

    @Inject
    private PaymentDAO paymentDAO;

    /**
     * Begins a checkout for {@code user} on {@code planId}. Unknown/blank plans
     * fall back to {@link Plan#MONTHLY} (see {@link Plan#fromString}).
     */
    public CheckoutResponse checkout(AuthUser user, String planId) {
        Plan plan = Plan.fromString(planId);
        String orderId = "MTF-" + UUID.randomUUID().toString().replace("-", "");

        try {
            paymentDAO.insertPending(new Payment(orderId, user.uid(), plan, plan.priceIdr(), PaymentStatus.PENDING));
        } catch (SQLException e) {
            throw new RuntimeException("DB error", e);
        }

        Map<String, Object> params = buildSnapParams(orderId, plan, user);
        try {
            JSONObject result = MidtransService.snapApi().createTransaction(params);
            return new CheckoutResponse(
                    result.optString("redirect_url", null),
                    result.optString("token", null),
                    orderId);
        } catch (MidtransError e) {
            // Order stays PENDING; mark it FAILED so it isn't mistaken for an open order.
            try {
                paymentDAO.updateStatus(orderId, PaymentStatus.FAILED);
            } catch (SQLException ignored) {
                // best-effort; the Midtrans failure below is the real signal
            }
            log.error("Midtrans checkout failed for order {}: {}", orderId, e.getMessage());
            throw new RuntimeException("checkout_failed", e);
        }
    }

    private static Map<String, Object> buildSnapParams(String orderId, Plan plan, AuthUser user) {
        Map<String, Object> transactionDetails = new HashMap<>();
        transactionDetails.put("order_id", orderId);
        transactionDetails.put("gross_amount", plan.priceIdr());

        Map<String, Object> customerDetails = new HashMap<>();
        customerDetails.put("first_name", user.preferredName());
        if (user.email() != null) {
            customerDetails.put("email", user.email());
        }

        Map<String, Object> item = new HashMap<>();
        item.put("id", plan.name());
        item.put("price", plan.priceIdr());
        item.put("quantity", 1);
        item.put("name", "Mathify Premium (" + plan.name() + ")");

        Map<String, Object> params = new HashMap<>();
        params.put("transaction_details", transactionDetails);
        params.put("customer_details", customerDetails);
        params.put("item_details", List.of(item));
        return params;
    }
}
