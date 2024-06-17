-- Create Tag table
CREATE TABLE tag (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    parent_id BIGINT,
    FOREIGN KEY (parent_id) REFERENCES tag(id)
);

-- Create Blog table
CREATE TABLE blog (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    body TEXT NOT NULL
);

-- Create BlogTag table to establish many-to-many relationship
CREATE TABLE blog_tags (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    blog_id BIGINT,
    tag_id BIGINT,
    FOREIGN KEY (blog_id) REFERENCES blog(id),
    FOREIGN KEY (tag_id) REFERENCES tag(id)
);

-- Create Closure Table for hierarchical relationships
CREATE TABLE tag_closure (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    ancestor_id BIGINT,
    descendant_id BIGINT,
    depth INT,
    FOREIGN KEY (ancestor_id) REFERENCES tag(id),
    FOREIGN KEY (descendant_id) REFERENCES tag(id)
);
