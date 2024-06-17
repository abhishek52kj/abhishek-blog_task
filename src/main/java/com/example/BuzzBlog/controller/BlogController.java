package com.example.BuzzBlog.controller;

import com.example.BuzzBlog.dto.BlogDTO;
import com.example.BuzzBlog.service.BlogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.concurrent.CompletableFuture;

@RestController
@Component 
@EnableAutoConfiguration 
public class BlogController {
    @Autowired
    private BlogService blogService;

    @GetMapping("/")
    public String home() {
        return "Welcome to BuzzBlog!";
    }

    @PostMapping("/blogs")
    public ResponseEntity<BlogDTO> createBlog(@RequestBody BlogDTO blogDTO) {
        BlogDTO createdBlog = blogService.createBlog(blogDTO);
        return ResponseEntity.ok(createdBlog);
    }

    @GetMapping("/blogs")
    public CompletableFuture<ResponseEntity<List<BlogDTO>>> getBlogs(@RequestParam String tag, 
                                                                     @RequestParam int page, 
                                                                     @RequestParam int size) {
        Pageable pageable = PageRequest.of(page, size);
        return blogService.getBlogsByTagAsync(tag, pageable)
                          .thenApply(ResponseEntity::ok);
    }
}
