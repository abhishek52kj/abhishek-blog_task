package com.example.BuzzBlog.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "tag_closure")
public class TagClosure {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "ancestorId", nullable = false)
    private Tag ancestor;

    @ManyToOne
    @JoinColumn(name = "descendantId", nullable = false)
    private Tag descendant;

    @Column(nullable = false)
    private int depth;

    // Constructor
    public TagClosure() {
    }

    public TagClosure(Tag ancestor, Tag descendant, int depth) {
        this.ancestor = ancestor;
        this.descendant = descendant;
        this.depth = depth;
    }

    // Getters and Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Tag getAncestor() {
        return ancestor;
    }

    public void setAncestor(Tag ancestor) {
        this.ancestor = ancestor;
    }

    public Tag getDescendant() {
        return descendant;
    }

    public void setDescendant(Tag descendant) {
        this.descendant = descendant;
    }

    public int getDepth() {
        return depth;
    }

    public void setDepth(int depth) {
        this.depth = depth;
    }
}
