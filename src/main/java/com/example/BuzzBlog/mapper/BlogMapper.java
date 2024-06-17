package com.example.BuzzBlog.mapper;

import com.example.BuzzBlog.dto.BlogDTO;
import com.example.BuzzBlog.entity.Blog;
import com.example.BuzzBlog.entity.Tag;
import org.modelmapper.ModelMapper;
import org.modelmapper.TypeToken;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.stream.Collectors;

@Component
public class BlogMapper {

    private final ModelMapper modelMapper;

    public BlogMapper(ModelMapper modelMapper) {
        this.modelMapper = modelMapper;
        setupMapper();
    }

    private void setupMapper() {
        modelMapper.createTypeMap(Blog.class, BlogDTO.class)
            .addMappings(mapper -> mapper.skip(BlogDTO::setTags))
            .setPostConverter(context -> {
                Blog source = context.getSource();
                BlogDTO destination = context.getDestination();
                List<String> tagNames = source.getTags().stream().map(Tag::getName).collect(Collectors.toList());
                destination.setTags(tagNames);
                return context.getDestination();
            });

        modelMapper.createTypeMap(BlogDTO.class, Blog.class)
            .addMappings(mapper -> mapper.skip(Blog::setTags))
            .setPostConverter(context -> {
                BlogDTO source = context.getSource();
                Blog destination = context.getDestination();
                List<Tag> tags = source.getTags().stream().map(tagName -> {
                    Tag tag = new Tag();
                    tag.setName(tagName);
                    return tag;
                }).collect(Collectors.toList());
                destination.setTags(tags);
                return context.getDestination();
            });
    }

    public BlogDTO toDTO(Blog blog) {
        return modelMapper.map(blog, BlogDTO.class);
    }

    public Blog toEntity(BlogDTO blogDTO) {
        return modelMapper.map(blogDTO, Blog.class);
    }
}
