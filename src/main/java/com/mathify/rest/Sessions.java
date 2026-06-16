package com.mathify.rest;

import com.mathify.model.AuthUser;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

/**
 * Session helpers for JAX-RS resources.
 *
 * <p>Reads the identity placed on the {@link HttpSession} by
 * {@link com.mathify.service.AuthService#login}. Student-scoped endpoints use
 * this to resolve the current {@link AuthUser}; it returns {@code null} for an
 * unauthenticated session or an admin-only session (no {@code authUser}).
 */
public final class Sessions {

    private Sessions() {}

    /** The authenticated student on this session, or {@code null}. */
    public static AuthUser currentUser(HttpServletRequest req) {
        HttpSession session = req.getSession(false);
        return (session != null) ? (AuthUser) session.getAttribute("authUser") : null;
    }
}
