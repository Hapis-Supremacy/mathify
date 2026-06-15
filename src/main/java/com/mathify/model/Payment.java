package com.mathify.model;

/**
 * A single Midtrans Snap checkout attempt ({@code payments} table).
 *
 * <p>The {@code orderId} is the reference handed to Midtrans and used to look the
 * transaction back up on return. A payment is only trusted once its {@code status}
 * reaches {@link PaymentStatus#PAID}, which happens server-side after
 * {@code CoreApi.checkTransaction} confirms settlement — never from the browser.
 */
public class Payment {

    private final String orderId;
    private final String uid;
    private final Plan plan;
    private final int grossAmount;
    private PaymentStatus status;

    public Payment(String orderId, String uid, Plan plan, int grossAmount, PaymentStatus status) {
        this.orderId = orderId;
        this.uid = uid;
        this.plan = plan;
        this.grossAmount = grossAmount;
        this.status = status;
    }

    public String getOrderId() {
        return orderId;
    }

    public String getUid() {
        return uid;
    }

    public Plan getPlan() {
        return plan;
    }

    public int getGrossAmount() {
        return grossAmount;
    }

    public PaymentStatus getStatus() {
        return status;
    }

    public void setStatus(PaymentStatus status) {
        this.status = status;
    }
}
