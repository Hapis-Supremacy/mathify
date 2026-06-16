package com.mathify.service;

import com.google.firebase.auth.FirebaseToken;
import com.mathify.dao.AdminDAO;
import com.mathify.dao.UserDAO;
import com.mathify.dao.UserProgressDAO;
import com.mathify.model.Admin;
import com.mathify.model.AuthUser;
import com.mathify.model.UserProgress;
import com.mathify.util.FirebaseService;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDateTime;

@ApplicationScoped
public class AuthService {

    @Inject
    private AdminDAO adminDAO;
    
    @Inject
    private UserDAO userDAO;
    
    @Inject
    private UserProgressDAO progressDAO;

    public String login(String idToken, HttpServletRequest request) throws Exception {
        FirebaseToken decoded = FirebaseService.verifyIdToken(idToken);
        AuthUser authUser = new AuthUser(
            decoded.getUid(),
            decoded.getEmail(),
            decoded.getName()
        );

        Admin admin = adminDAO.findByEmail(authUser.email());
        if (admin != null) {
            admin.setLastLoginAt(LocalDateTime.now());
            adminDAO.upsert(admin);
            HttpSession session = request.getSession(true);
            session.setAttribute("admin", admin);
            return "admin";
        }

        userDAO.upsert(authUser);
        UserProgress progress = progressDAO.findOrCreate(authUser.uid());

        HttpSession session = request.getSession(true);
        session.setAttribute("authUser", authUser);
        session.setAttribute("progress", progress);
        return "student";
    }

    public void logout(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
    }
}
