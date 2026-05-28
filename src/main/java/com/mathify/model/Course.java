package com.mathify.model;

import java.util.ArrayList;
import java.util.List;

public class Course {
    private String courseId;
    private String title;
    private String description;
    private String category;
    private List<Course> prerequisite;
    private List<Chapter> chapters;

    public Course() {
        this.prerequisite = new ArrayList<>();
        this.chapters = new ArrayList<>();
    }

    public Course(String courseId, String title, String description, String category) {
        this.courseId = courseId;
        this.title = title;
        this.description = description;
        this.category = category;
        this.prerequisite = new ArrayList<>();
        this.chapters = new ArrayList<>();
    }

    public String getCourseId() { return courseId; }
    public void setCourseId(String courseId) { this.courseId = courseId; }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public String getCategory() { return category; }
    public void setCategory(String category) { this.category = category; }

    public List<Course> getPrerequisite() { return prerequisite; }
    public void setPrerequisite(List<Course> prerequisite) { this.prerequisite = prerequisite; }

    public List<Chapter> getChapters() { return chapters; }
    public void setChapters(List<Chapter> chapters) { this.chapters = chapters; }
}