package com.mathify.model;

public interface Question {

    QuestionInfo getInfo();

    QuestionType getType();

    boolean evaluate(Answer answer);

    // Default methods — tidak perlu di-override oleh implementasi
    default String getId() {
        return getInfo().id();
    }

    default String getPrompt() {
        return getInfo().prompt();
    }

    default int getPoints() {
        return getInfo().points();
    }
}
