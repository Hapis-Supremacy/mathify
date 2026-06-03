package com.mathify.model;

/**
 * Elemen yang bisa di-drag oleh student.
 */
public record DragItem(String id, String label) {

    public DragItem {
        if (id == null || id.isBlank()) {
            throw new IllegalArgumentException("DragItem id must not be blank");
        }
        if (label == null || label.isBlank()) {
            throw new IllegalArgumentException("DragItem label must not be blank");
        }
    }
}
