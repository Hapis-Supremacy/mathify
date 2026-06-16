package com.mathify.dao;

import jakarta.enterprise.context.ApplicationScoped;

import com.mathify.model.Payment;
import com.mathify.model.PaymentStatus;
import com.mathify.model.Plan;
import com.mathify.util.QueryHelper;

import java.sql.SQLException;

/**
 * Midtrans checkout attempts ({@code payments}). One row per order.
 * The row is created PENDING at checkout and flipped to PAID/FAILED only after
 * server-side verification with Midtrans.
 */
@ApplicationScoped
public class PaymentDAO {

    /** Inserts a new PENDING payment for an order. */
    public void insertPending(Payment payment) throws SQLException {
        String sql = """
                INSERT INTO payments (order_id, uid, plan, gross_amount, status)
                VALUES (?, ?, ?, ?, ?)
                """;
        QueryHelper.executeUpdate(sql,
                payment.getOrderId(),
                payment.getUid(),
                payment.getPlan().name(),
                payment.getGrossAmount(),
                payment.getStatus().name());
    }

    /** Returns the payment for an order id, or {@code null} if none. */
    public Payment findByOrderId(String orderId) throws SQLException {
        String sql = "SELECT * FROM payments WHERE order_id = ?";
        return QueryHelper.queryOne(sql, rs -> new Payment(
                rs.getString("order_id"),
                rs.getString("uid"),
                Plan.valueOf(rs.getString("plan")),
                rs.getInt("gross_amount"),
                PaymentStatus.valueOf(rs.getString("status"))), orderId);
    }

    /** Updates the lifecycle status of an order. */
    public void updateStatus(String orderId, PaymentStatus status) throws SQLException {
        String sql = "UPDATE payments SET status = ?, updated_at = NOW() WHERE order_id = ?";
        QueryHelper.executeUpdate(sql, status.name(), orderId);
    }
}

