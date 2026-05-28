package com.mathify.model;

import java.util.ArrayList;
import java.util.List;

public class Chapter {
    private String chapterId;
    private String courseId;
    private String title;
    private String description;
    private int xpReward;
    private int orderIndex;

    private List<Chapter> prerequisite;
    private List<LearningModule> modules;
    private List<Quiz> quizzes;

    public Chapter() {
        this.prerequisite = new ArrayList<>();
        this.modules = new ArrayList<>();
        this.quizzes = new ArrayList<>();
    }

    public Chapter(String chapterId, String courseId, String title,
                   String description, int xpReward, int orderIndex) {
        this.chapterId = chapterId;
        this.courseId = courseId;
        this.title = title;
        this.description = description;
        this.xpReward = xpReward;
        this.orderIndex = orderIndex;
        this.prerequisite = new ArrayList<>();
        this.modules = new ArrayList<>();
        this.quizzes = new ArrayList<>();
    }

    public int calculateTotalXP() {
        return xpReward + (modules.size() * 10);
    }

    public String getChapterId() { return chapterId; }
    public void setChapterId(String chapterId) { this.chapterId = chapterId; }

    public String getCourseId() { return courseId; }
    public void setCourseId(String courseId) { this.courseId = courseId; }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public int getXpReward() { return xpReward; }
    public void setXpReward(int xpReward) { this.xpReward = xpReward; }

    public int getOrderIndex() { return orderIndex; }
    public void setOrderIndex(int orderIndex) { this.orderIndex = orderIndex; }

    public List<Chapter> getPrerequisite() { return prerequisite; }
    public void setPrerequisite(List<Chapter> prerequisite) { this.prerequisite = prerequisite; }

    public List<LearningModule> getModules() { return modules; }
    public void setModules(List<LearningModule> modules) { this.modules = modules; }

    public List<Quiz> getQuizzes() { return quizzes; }
    public void setQuizzes(List<Quiz> quizzes) { this.quizzes = quizzes; }
}