package com.example.BuzzBlog.repository;

import com.example.BuzzBlog.entity.Blog;
import com.example.BuzzBlog.entity.Tag;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BlogRepository extends JpaRepository<Blog, Long> {

    @Query("SELECT b FROM Blog b JOIN b.tags t JOIN TagClosure tc ON t.id = tc.descendant.id WHERE tc.ancestor.id = :tagId")
    Page<Blog> findByTagId(@Param("tagId") Long tagId, Pageable pageable);
    
    List<Blog> findByTagsIn(List<Tag> tags);
}
