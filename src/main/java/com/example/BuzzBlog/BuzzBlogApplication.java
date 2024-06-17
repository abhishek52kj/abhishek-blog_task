package com.example.BuzzBlog;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@EntityScan(basePackages = "com.example.BuzzBlog.entity")
@EnableJpaRepositories(basePackages = "com.example.BuzzBlog.repository")
@ComponentScan(basePackages = "com.example.BuzzBlog")
public class BuzzBlogApplication {
    
    public static void main(String[] args) {
        SpringApplication.run(BuzzBlogApplication.class, args);
    }
}
