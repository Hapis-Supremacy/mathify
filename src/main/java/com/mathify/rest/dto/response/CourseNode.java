package com.mathify.rest.dto.response;

/** A single course node in the prerequisite graph / learning-path responses. */
public record CourseNode(String id, String title, String track, int levelNum, String color, String glyph) {}
