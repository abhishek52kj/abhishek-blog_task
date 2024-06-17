-- Insert Tags
INSERT INTO tag (name) VALUES ('Science');
INSERT INTO tag (name, parent_id) VALUES ('Physics', 1);
INSERT INTO tag (name, parent_id) VALUES ('Chemistry', 1);
INSERT INTO tag (name, parent_id) VALUES ('Organic Chemistry', 3);
INSERT INTO tag (name, parent_id) VALUES ('Inorganic Chemistry', 3);
INSERT INTO tag (name, parent_id) VALUES ('Physical Chemistry', 3);
INSERT INTO tag (name, parent_id) VALUES ('Statics', 2);
INSERT INTO tag (name, parent_id) VALUES ('Dynamics', 2);

-- Insert Tag Closure
-- Science
INSERT INTO tag_closure (ancestor_id, descendant_id, depth) VALUES (1, 1, 0); -- Self-reference
INSERT INTO tag_closure (ancestor_id, descendant_id, depth) VALUES (1, 2, 1);
INSERT INTO tag_closure (ancestor_id, descendant_id, depth) VALUES (1, 3, 1);
INSERT INTO tag_closure (ancestor_id, descendant_id, depth) VALUES (1, 4, 2);
INSERT INTO tag_closure (ancestor_id, descendant_id, depth) VALUES (1, 5, 2);
INSERT INTO tag_closure (ancestor_id, descendant_id, depth) VALUES (1, 6, 2);
INSERT INTO tag_closure (ancestor_id, descendant_id, depth) VALUES (1, 7, 2);
INSERT INTO tag_closure (ancestor_id, descendant_id, depth) VALUES (1, 8, 2);

-- Physics
INSERT INTO tag_closure (ancestor_id, descendant_id, depth) VALUES (2, 2, 0); -- Self-reference
INSERT INTO tag_closure (ancestor_id, descendant_id, depth) VALUES (2, 7, 1);
INSERT INTO tag_closure (ancestor_id, descendant_id, depth) VALUES (2, 8, 1);

-- Chemistry
INSERT INTO tag_closure (ancestor_id, descendant_id, depth) VALUES (3, 3, 0); -- Self-reference
INSERT INTO tag_closure (ancestor_id, descendant_id, depth) VALUES (3, 4, 1);
INSERT INTO tag_closure (ancestor_id, descendant_id, depth) VALUES (3, 5, 1);
INSERT INTO tag_closure (ancestor_id, descendant_id, depth) VALUES (3, 6, 1);

-- Organic Chemistry
INSERT INTO tag_closure (ancestor_id, descendant_id, depth) VALUES (4, 4, 0); -- Self-reference

-- Inorganic Chemistry
INSERT INTO tag_closure (ancestor_id, descendant_id, depth) VALUES (5, 5, 0); -- Self-reference

-- Physical Chemistry
INSERT INTO tag_closure (ancestor_id, descendant_id, depth) VALUES (6, 6, 0); -- Self-reference

-- Statics
INSERT INTO tag_closure (ancestor_id, descendant_id, depth) VALUES (7, 7, 0); -- Self-reference

-- Dynamics
INSERT INTO tag_closure (ancestor_id, descendant_id, depth) VALUES (8, 8, 0); -- Self-reference

-- Insert Blogs
INSERT INTO blog (title, body) VALUES ('Introduction to Physics', 'Content about Physics');
INSERT INTO blog (title, body) VALUES ('Introduction to Chemistry', 'Content about Chemistry');
INSERT INTO blog (title, body) VALUES ('Organic Chemistry Basics', 'Content about Organic Chemistry');

-- Insert Blog-Tag Relations
INSERT INTO blog_tags (blog_id, tag_id) VALUES (1, 2); -- Blog 1 tagged with Physics
INSERT INTO blog_tags (blog_id, tag_id) VALUES (2, 3); -- Blog 2 tagged with Chemistry
INSERT INTO blog_tags (blog_id, tag_id) VALUES (3, 4); -- Blog 3 tagged with Organic Chemistry
