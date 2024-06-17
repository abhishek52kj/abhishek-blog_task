package com.example.BuzzBlog.service;

import com.example.BuzzBlog.dto.BlogDTO;
import com.example.BuzzBlog.entity.Blog;
import com.example.BuzzBlog.entity.Tag;
import com.example.BuzzBlog.entity.TagClosure;
import com.example.BuzzBlog.exception.ResourceNotFoundException;
import com.example.BuzzBlog.repository.BlogRepository;
import com.example.BuzzBlog.repository.TagClosureRepository;
import com.example.BuzzBlog.repository.TagRepository;
import org.modelmapper.ModelMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.CompletableFuture;
import java.util.stream.Collectors;

@Service
public class BlogService {
    private static final Logger logger = LoggerFactory.getLogger(BlogService.class);

    @Autowired
    private BlogRepository blogRepository;

    @Autowired
    private TagRepository tagRepository;

    @Autowired
    private TagClosureRepository tagClosureRepository;

    @Autowired
    private ModelMapper modelMapper;

    @Transactional
    public BlogDTO createBlog(BlogDTO blogDTO) {
        Blog blog = new Blog();
        blog.setTitle(blogDTO.getTitle());
        blog.setBody(blogDTO.getBody());

        List<Tag> tags = new ArrayList<>();
        for (String tagName : blogDTO.getTags()) {
            Tag tag = tagRepository.findByName(tagName).orElseGet(() -> {
                Tag newTag = new Tag();
                newTag.setName(tagName);
                return tagRepository.save(newTag);
            });
            tags.add(tag);
        }
        blog.setTags(tags);
        Blog savedBlog = blogRepository.save(blog);

        updateTagHierarchy(tags);

        BlogDTO savedBlogDTO = modelMapper.map(savedBlog, BlogDTO.class);
        savedBlogDTO.setTags(savedBlog.getTags().stream().map(Tag::getName).collect(Collectors.toList()));
        return savedBlogDTO;
    }

    @Async
    @Cacheable("blogsByTag")
    public CompletableFuture<List<BlogDTO>> getBlogsByTagAsync(String tagName, Pageable pageable) {
        logger.info("Fetching blogs for tag: {}", tagName);
        Tag tag = tagRepository.findByName(tagName).orElseThrow(() -> {
            logger.error("Tag not found: {}", tagName);
            return new ResourceNotFoundException("Tag not found");
        });
        Page<Blog> blogsPage = blogRepository.findByTagId(tag.getId(), pageable);
        List<BlogDTO> blogDTOs = blogsPage.stream()
                                          .map(blog -> {
                                              BlogDTO blogDTO = modelMapper.map(blog, BlogDTO.class);
                                              blogDTO.setTags(blog.getTags().stream().map(Tag::getName).collect(Collectors.toList()));
                                              return blogDTO;
                                          })
                                          .collect(Collectors.toList());
        return CompletableFuture.completedFuture(blogDTOs);
    }

    private void updateTagHierarchy(List<Tag> tags) {
        for (Tag tag : tags) {
            // Self-reference
            tagClosureRepository.save(new TagClosure(tag, tag, 0));

            // Parent-child relationships
            if (tag.getParent() != null) {
                tagClosureRepository.save(new TagClosure(tag.getParent(), tag, 1));

                // Transitive relationships
                List<TagClosure> parentAncestors = tagClosureRepository.findByDescendantId(tag.getParent().getId());
                for (TagClosure ancestor : parentAncestors) {
                    tagClosureRepository.save(new TagClosure(ancestor.getAncestor(), tag, ancestor.getDepth() + 1));
                }
            }
        }
    }
}
