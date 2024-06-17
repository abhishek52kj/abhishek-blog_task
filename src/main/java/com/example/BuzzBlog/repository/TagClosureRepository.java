package com.example.BuzzBlog.repository;

import com.example.BuzzBlog.entity.TagClosure;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TagClosureRepository extends JpaRepository<TagClosure, Long> {
    List<TagClosure> findByDescendantId(Long descendantId);
    List<TagClosure> findByAncestorId(Long ancestorId);
}
