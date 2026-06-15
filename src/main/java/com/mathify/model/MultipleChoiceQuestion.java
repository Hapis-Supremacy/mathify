package com.mathify.model;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class MultipleChoiceQuestion implements Question {

    /**
     * Nested record — setiap pilihan punya id unik dan teks yang ditampilkan.
     */
    public record Option(String id, String text) {

        public Option {
            if (id == null || id.isBlank()) {
                throw new IllegalArgumentException("Option id must not be blank");
            }
            if (text == null || text.isBlank()) {
                throw new IllegalArgumentException("Option text must not be blank");
            }
        }
    }

    private final QuestionInfo info;
    private final List<Option> options;

    /**
     * Id dari option yang benar — Set karena bisa multi-answer.
     */
    private final Set<String> correctOptionIds;

    public MultipleChoiceQuestion(QuestionInfo info, List<Option> options, Set<String> correctOptionIds) {
        if (info == null) {
            throw new IllegalArgumentException("info must not be null");
        }
        if (options == null || options.size() < 2) {
            throw new IllegalArgumentException("options must have at least 2 entries");
        }
        if (correctOptionIds == null || correctOptionIds.isEmpty()) {
            throw new IllegalArgumentException("correctOptionIds must not be empty");
        }

        this.info = info;
        this.options = Collections.unmodifiableList(new ArrayList<>(options));
        this.correctOptionIds = Collections.unmodifiableSet(new HashSet<>(correctOptionIds));
    }

    @Override
    public QuestionInfo getInfo() {
        return info;
    }

    @Override
    public QuestionType getType() {
        return QuestionType.MULTIPLE_CHOICE;
    }

    public List<Option> getOptions() {
        return options;
    }

    /** Ids of the option(s) that count as correct. */
    public Set<String> getCorrectOptionIds() {
        return correctOptionIds;
    }

    /**
     * Evaluasi jawaban student. Benar jika selectedOptionIds sama persis dengan
     * correctOptionIds.
     */
    @Override
    public boolean evaluate(Answer answer) {
        if (!(answer instanceof Answer.MultipleChoiceAnswer mca)) {
            return false;
        }
        return correctOptionIds.equals(mca.selectedOptionIds());
    }

    @Override
    public String toString() {
        return "MultipleChoiceQuestion{id='" + info.id() + "', options=" + options.size()
                + ", correctOptionIds=" + correctOptionIds + '}';
    }
}
