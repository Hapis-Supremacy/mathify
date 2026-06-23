package com.mathify.service;

import com.mathify.dao.AchievementDAO;
import com.mathify.dao.UserAchievementDAO;
import com.mathify.dao.UserProgressDAO;
import com.mathify.model.Achievement;
import com.mathify.model.UserProgress;
import jakarta.annotation.PostConstruct;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import java.sql.SQLException;

@ApplicationScoped
public class GamificationService {

    @Inject
    private UserProgressDAO userProgressDAO;

    @Inject
    private AchievementDAO achievementDAO;

    @Inject
    private UserAchievementDAO userAchievementDAO;

    @Inject
    private NotificationService notificationService;

    @PostConstruct
    public void init() {
        try {
            if (achievementDAO.findAll().isEmpty()) {
                achievementDAO.seedCatalog();
            }
        } catch (SQLException e) {
            // Log error
            System.err.println("Failed to seed achievements: " + e.getMessage());
        }
    }

    public UserProgress getUserProgress(String uid) {
        try {
            return userProgressDAO.findOrCreate(uid);
        } catch (SQLException e) {
            throw new RuntimeException("DB error", e);
        }
    }

    public void awardQuizXPAndEnergy(String uid, int score) {
        try {
            UserProgress up = userProgressDAO.findOrCreate(uid);
            up.decrementEnergy(1); // Cost 1 energy
            up.addXP(score); // XP = score
            maybeLevelUp(uid, up);
            userProgressDAO.save(uid, up);
            evaluateAchievements(uid, up);
        } catch (SQLException e) {
            throw new RuntimeException("DB error", e);
        }
    }

    public void awardChapterXP(String uid, int xpReward) {
        try {
            UserProgress up = userProgressDAO.findOrCreate(uid);
            up.addXP(xpReward);
            maybeLevelUp(uid, up);
            userProgressDAO.save(uid, up);
            evaluateAchievements(uid, up);
        } catch (SQLException e) {
            throw new RuntimeException("DB error", e);
        }
    }

    public void updateStreak(String uid) {
        try {
            UserProgress up = userProgressDAO.findOrCreate(uid);
            up.updateStreak();
            userProgressDAO.save(uid, up);
            evaluateAchievements(uid, up);
        } catch (SQLException e) {
            throw new RuntimeException("DB error", e);
        }
    }

    public void evaluateAchievements(String uid) {
        try {
            UserProgress up = userProgressDAO.findOrCreate(uid);
            evaluateAchievements(uid, up);
        } catch (SQLException e) {
            throw new RuntimeException("DB error", e);
        }
    }

    private void evaluateAchievements(String uid, UserProgress up) throws SQLException {
        if (!up.hasAchievement("first_steps") && !up.getCourseEnrollments().isEmpty()) {
            userAchievementDAO.award(uid, "first_steps");
            Achievement achievement = achievementDAO.findById("first_steps");
            if (achievement != null) {
                up.completeAchievement(achievement);
                notificationService.notifyAchievement(uid, achievement);
            }
        }
        if (!up.hasAchievement("quiz_master")) {
            boolean perfect = up.getQuizAttempts().values().stream().anyMatch(q -> q.score() == 100);
            if (perfect) {
                userAchievementDAO.award(uid, "quiz_master");
                Achievement achievement = achievementDAO.findById("quiz_master");
                if (achievement != null) {
                    up.completeAchievement(achievement);
                    notificationService.notifyAchievement(uid, achievement);
                }
            }
        }
        if (!up.hasAchievement("streak_3") && up.getCurrentStreak() >= 3) {
            userAchievementDAO.award(uid, "streak_3");
            Achievement achievement = achievementDAO.findById("streak_3");
            if (achievement != null) {
                up.completeAchievement(achievement);
                notificationService.notifyAchievement(uid, achievement);
            }
        }
        if (!up.hasAchievement("high_achiever") && up.getTotalXP() >= 1000) {
            userAchievementDAO.award(uid, "high_achiever");
            Achievement achievement = achievementDAO.findById("high_achiever");
            if (achievement != null) {
                up.completeAchievement(achievement);
                notificationService.notifyAchievement(uid, achievement);
            }
        }
    }

    private void maybeLevelUp(String uid, UserProgress up) {
        int oldLevel = up.getLevel();
        int newLevel = (up.getTotalXP() / 500) + 1;
        if (newLevel > oldLevel) {
            up.addLevel(newLevel - oldLevel);
            notificationService.notifyLevelUp(uid, newLevel);
        }
    }
}
