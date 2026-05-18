/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mathify.model;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Akari
 */
public class Lesson {
    private String lessonId;
    private String title;
    private String description;
    private int xpReward;

    private List<Lesson> prerequisite;
    private List<Playable> modules;
    private List<Gradable> quizzes;

    public Lesson() {

        prerequisite = new ArrayList<>();
        modules = new ArrayList<>();
        quizzes = new ArrayList<>();
    }

    public Lesson(String lessonId,
                  String title,
                  String description,
                  int xpReward) {

        this.lessonId = lessonId;
        this.title = title;
        this.description = description;
        this.xpReward = xpReward;

        prerequisite = new ArrayList<>();
        modules = new ArrayList<>();
        quizzes = new ArrayList<>();
    }

    public String getTitle() {
        return title;
    }

    public String getDescription() {
        return description;
    }

    public int getXpReward() {
        return xpReward;
    }

    public List<Lesson> getPrerequisite() {
        return prerequisite;
    }

    public List<Playable> getModules() {
        return modules;
    }

    public List<Gradable> getQuizzes() {
        return quizzes;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setXpReward(int xpReward) {
        this.xpReward = xpReward;
    }

    public void setPrerequisite(List<Lesson> prerequisite) {
        this.prerequisite = prerequisite;
    }

    public void setModules(List<Playable> modules) {
        this.modules = modules;
    }

    public void setQuizzes(List<Gradable> quizzes) {
        this.quizzes = quizzes;
    }

    public String getLessonId() {
        return lessonId;
    }

    public void setLessonId(String lessonId) {
        this.lessonId = lessonId;
    }
}
