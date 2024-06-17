package com.example.BuzzBlog.config;

import org.modelmapper.ModelMapper;
import org.modelmapper.PropertyMap;
import org.modelmapper.convention.MatchingStrategies;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.example.BuzzBlog.dto.BlogDTO;
import com.example.BuzzBlog.entity.Blog;
import com.example.BuzzBlog.entity.Tag;

import java.util.stream.Collectors;

@Configuration
public class ModelMapperConfig {

    @Bean
    public ModelMapper modelMapper() {
        ModelMapper modelMapper = new ModelMapper();
        modelMapper.getConfiguration().setMatchingStrategy(MatchingStrategies.STRICT);
        modelMapper.addMappings(new PropertyMap<Blog, BlogDTO>() {
            @Override
            protected void configure() {
                map().setTags(source.getTags().stream().map(Tag::getName).collect(Collectors.toList()));
            }
        });
        return modelMapper;
    }
}
