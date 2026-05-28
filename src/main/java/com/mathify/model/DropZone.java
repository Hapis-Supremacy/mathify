package com.mathify.model;

/**
 * Area tujuan tempat student menjatuhkan DragItem.
 */
public record DropZone(String id, String label) {

    public DropZone {
        if (id == null || id.isBlank()) {
            throw new IllegalArgumentException("DropZone id must not be blank");
        }
        if (label == null || label.isBlank()) {
            throw new IllegalArgumentException("DropZone label must not be blank");
        }
    }
}
