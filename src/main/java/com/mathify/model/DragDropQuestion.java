package com.mathify.model;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DragDropQuestion implements Question {

    private final QuestionInfo info;
    private final List<DragItem> draggables;
    private final List<DropZone> dropZones;

    /**
     * Pasangan benar: Map<draggableId, dropZoneId>.
     */
    private final Map<String, String> correctPairings;

    public DragDropQuestion(
            QuestionInfo info,
            List<DragItem> draggables,
            List<DropZone> dropZones,
            Map<String, String> correctPairings) {

        if (info == null) {
            throw new IllegalArgumentException("info must not be null");
        }
        if (draggables == null || draggables.isEmpty()) {
            throw new IllegalArgumentException("draggables must not be empty");
        }
        if (dropZones == null || dropZones.isEmpty()) {
            throw new IllegalArgumentException("dropZones must not be empty");
        }
        if (correctPairings == null || correctPairings.isEmpty()) {
            throw new IllegalArgumentException("correctPairings must not be empty");
        }

        this.info = info;
        this.draggables = Collections.unmodifiableList(new ArrayList<>(draggables));
        this.dropZones = Collections.unmodifiableList(new ArrayList<>(dropZones));
        this.correctPairings = Collections.unmodifiableMap(new HashMap<>(correctPairings));
    }

    @Override
    public QuestionInfo getInfo() {
        return info;
    }

    @Override
    public QuestionType getType() {
        return QuestionType.DRAG_AND_DROP;
    }

    public List<DragItem> getDraggables() {
        return draggables;
    }

    public List<DropZone> getDropZones() {
        return dropZones;
    }

    public Map<String, String> getCorrectPairings() {
        return correctPairings;
    }

    /**
     * Evaluasi jawaban student. Benar jika semua pasangan draggableId →
     * dropZoneId sama dengan correctPairings.
     */
    @Override
    public boolean evaluate(Answer answer) {
        if (!(answer instanceof Answer.DragAndDropAnswer dda)) {
            return false;
        }
        return correctPairings.equals(dda.pairings());
    }

    @Override
    public String toString() {
        return "DragDropQuestion{id='" + info.id() + "', draggables=" + draggables.size()
                + ", dropZones=" + dropZones.size() + '}';
    }
}
