package com.mathify.dao;

import jakarta.enterprise.context.ApplicationScoped;

import com.mathify.model.PremiumStudent;
import com.mathify.model.Subscribable;
import com.mathify.util.QueryHelper;

import java.sql.Date;
import java.sql.SQLException;
import java.time.LocalDate;

/**
 * A student's subscription ({@code subscriptions}). One row per user.
 * Reconstructs a {@link PremiumStudent} (the only {@link Subscribable} impl).
 */
@ApplicationScoped
public class SubscriptionDAO {

    /** Inserts or updates the subscription for a user. */
    public void save(String uid, Subscribable sub) throws SQLException {
        // PremiumStudent exposes no isCanceled getter, so derive it: an inactive
        // subscription whose expiry has not yet passed must have been canceled.
        // (If the expiry has passed we cannot distinguish canceled from lapsed.)
        boolean isCanceled = !sub.isActive()
                && sub.subscriptionExpiry() != null
                && !sub.subscriptionExpiry().isBefore(LocalDate.now());

        String sql = """
                INSERT INTO subscriptions (uid, plan, expiry, is_canceled, updated_at)
                VALUES (?, ?, ?, ?, NOW())
                ON CONFLICT (uid) DO UPDATE
                  SET plan        = EXCLUDED.plan,
                      expiry      = EXCLUDED.expiry,
                      is_canceled = EXCLUDED.is_canceled,
                      updated_at  = NOW()
                """;
        QueryHelper.executeUpdate(sql,
                uid,
                sub.getSubscriptionPlan(),
                sub.subscriptionExpiry(),
                isCanceled);
    }

    /** Returns the user's subscription, or {@code null} if none. */
    public Subscribable find(String uid) throws SQLException {
        String sql = "SELECT * FROM subscriptions WHERE uid = ?";
        return QueryHelper.queryOne(sql, rs -> {
            Date expiry = rs.getDate("expiry");
            PremiumStudent sub = new PremiumStudent(
                    rs.getString("plan"),
                    expiry != null ? expiry.toLocalDate() : null);
            if (rs.getBoolean("is_canceled")) {
                sub.cancelSubscription();
            }
            return sub;
        }, uid);
    }

    public void delete(String uid) throws SQLException {
        QueryHelper.executeUpdate("DELETE FROM subscriptions WHERE uid = ?", uid);
    }
}

