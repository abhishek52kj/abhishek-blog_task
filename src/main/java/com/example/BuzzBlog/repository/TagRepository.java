package com.example.BuzzBlog.repository;

import com.example.BuzzBlog.entity.Tag;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface TagRepository extends JpaRepository<Tag, Long> {
    List<Tag> findByParent(Tag parent);
    Optional<Tag> findByName(String name);
}
