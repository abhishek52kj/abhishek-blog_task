package com.example.BuzzBlog.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "blog_tags")
public class BlogTag {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "blogId", nullable = false)
    private Blog blog;

    @ManyToOne
    @JoinColumn(name = "tagId", nullable = false)
    private Tag tag;

    // Getters and Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Blog getBlog() {
        return blog;
    }

    public void setBlog(Blog blog) {
        this.blog = blog;
    }

    public Tag getTag() {
        return tag;
    }

    public void setTag(Tag tag) {
        this.tag = tag;
    }
}
