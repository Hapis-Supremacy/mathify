package com.mathify.model;

import java.time.LocalDate;

/** Subscription billing cadence for a {@link Subscribable}, with its price and duration. */
public enum Plan {

    MONTHLY(120_000, 1),
    ANNUAL(1_440_000, 12);

    private final int priceIdr;
    private final int durationMonths;

    Plan(int priceIdr, int durationMonths) {
        this.priceIdr = priceIdr;
        this.durationMonths = durationMonths;
    }

    /** Gross amount charged for this plan, in whole IDR (Midtrans bills in integer rupiah). */
    public int priceIdr() {
        return priceIdr;
    }

    public int durationMonths() {
        return durationMonths;
    }

    /** Expiry for a subscription that starts on {@code from} and runs for this plan's duration. */
    public LocalDate expiryFrom(LocalDate from) {
        return from.plusMonths(durationMonths);
    }

    /** Parses a plan name case-insensitively, falling back to {@link #MONTHLY} for blank/unknown input. */
    public static Plan fromString(String value) {
        if (value == null || value.isBlank()) {
            return MONTHLY;
        }
        try {
            return Plan.valueOf(value.trim().toUpperCase());
        } catch (IllegalArgumentException e) {
            return MONTHLY;
        }
    }
}
