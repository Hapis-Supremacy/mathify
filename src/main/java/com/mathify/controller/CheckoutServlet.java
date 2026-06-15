package com.mathify.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import com.mathify.dao.PaymentDAO;
import com.mathify.model.AuthUser;
import com.mathify.model.Payment;
import com.mathify.model.PaymentStatus;
import com.mathify.model.Plan;
import com.mathify.util.MidtransService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Builds a Midtrans Snap checkout for a premium upgrade.
 *
 * <p>Access requires a student session (enforced by {@code AuthFilter}). The order
 * is tied to the logged-in uid and the chosen {@link Plan} (?plan=MONTHLY|ANNUAL),
 * persisted as a PENDING {@link Payment}, and a Snap token is generated for the
 * page. Premium is <strong>not</strong> granted here — that only happens after
 * {@code PaymentConfirmServlet} verifies the transaction with Midtrans on return.
 */
@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {

    private static final Logger log = LoggerFactory.getLogger(CheckoutServlet.class);

    private final PaymentDAO paymentDAO = new PaymentDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        AuthUser authUser = (session != null) ? (AuthUser) session.getAttribute("authUser") : null;
        if (authUser == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        Plan plan = Plan.fromString(request.getParameter("plan"));
        int grossAmount = plan.priceIdr();
        String orderId = "MTF-" + UUID.randomUUID().toString().substring(0, 12).toUpperCase();

        try {
            // Persist the attempt up front so the order id is recoverable on return.
            paymentDAO.insertPending(new Payment(orderId, authUser.uid(), plan, grossAmount, PaymentStatus.PENDING));

            Map<String, Object> transactionDetails = new HashMap<>();
            transactionDetails.put("order_id", orderId);
            transactionDetails.put("gross_amount", grossAmount);

            Map<String, Object> itemDetails = new HashMap<>();
            itemDetails.put("id", "premium-" + plan.name().toLowerCase());
            itemDetails.put("price", grossAmount);
            itemDetails.put("quantity", 1);
            itemDetails.put("name", "Mathify Premium (" + plan.name() + ")");

            Map<String, Object> customerDetails = new HashMap<>();
            customerDetails.put("first_name", authUser.preferredName());
            customerDetails.put("email", authUser.email());

            Map<String, Object> params = new HashMap<>();
            params.put("transaction_details", transactionDetails);
            params.put("item_details", List.of(itemDetails));
            params.put("customer_details", customerDetails);

            String snapToken = MidtransService.snapApi().createTransactionToken(params);

            request.setAttribute("snapToken", snapToken);
            request.setAttribute("clientKey", MidtransService.clientKey());
            request.setAttribute("isProduction", MidtransService.isProduction());
            request.setAttribute("orderId", orderId);
            request.setAttribute("planName", plan.name());
            request.setAttribute("grossAmount", grossAmount);

        } catch (SQLException e) {
            log.error("Failed to persist payment for uid={} order={}", authUser.uid(), orderId, e);
            request.setAttribute("error", "Could not start checkout. Please try again.");
        } catch (Exception e) {
            log.error("Midtrans token creation failed for order={}", orderId, e);
            request.setAttribute("error", "Payment service error: " + e.getMessage());
        }

        request.getRequestDispatcher("/WEB-INF/jsp/pages/checkout/index.jsp")
                .forward(request, response);
    }
}
