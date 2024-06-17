package com.example.BuzzBlog.entity;

import jakarta.persistence.*;
import java.util.List;

@Entity
public class Tag {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, unique = true)
    private String name;

    @ManyToOne
    @JoinColumn(name = "parent_id")
    private Tag parent;

    @OneToMany(mappedBy = "parent", cascade = CascadeType.ALL)
    private List<Tag> children;

    @ManyToMany(mappedBy = "tags")
    private List<Blog> blogs;

    @OneToMany(mappedBy = "ancestor", cascade = CascadeType.ALL)
    private List<TagClosure> descendants;

    @OneToMany(mappedBy = "descendant", cascade = CascadeType.ALL)
    private List<TagClosure> ancestors;

    // Getters and Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Tag getParent() {
        return parent;
    }

    public void setParent(Tag parent) {
        this.parent = parent;
    }

    public List<Tag> getChildren() {
        return children;
    }

    public void setChildren(List<Tag> children) {
        this.children = children;
    }

    public List<Blog> getBlogs() {
        return blogs;
    }

    public void setBlogs(List<Blog> blogs) {
        this.blogs = blogs;
    }

    public List<TagClosure> getDescendants() {
        return descendants;
    }

    public void setDescendants(List<TagClosure> descendants) {
        this.descendants = descendants;
    }

    public List<TagClosure> getAncestors() {
        return ancestors;
    }

    public void setAncestors(List<TagClosure> ancestors) {
        this.ancestors = ancestors;
    }
}
