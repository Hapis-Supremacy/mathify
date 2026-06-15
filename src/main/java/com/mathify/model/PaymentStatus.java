package com.mathify.model;

/** Lifecycle of a {@link Payment}, mirroring the resolved Midtrans transaction outcome. */
public enum PaymentStatus {
    /** Order created, awaiting payment / confirmation. */
    PENDING,
    /** Verified settled with Midtrans — premium has been (or can be) granted. */
    PAID,
    /** Denied, cancelled, or expired. */
    FAILED
}
