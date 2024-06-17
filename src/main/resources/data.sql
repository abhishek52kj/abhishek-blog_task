-- Insert Tags
INSERT INTO tag (id, name) VALUES (1, 'Science');
INSERT INTO tag (id, name, parent_id) VALUES (2, 'Physics', 1);
INSERT INTO tag (id, name, parent_id) VALUES (3, 'Chemistry', 1);
INSERT INTO tag (id, name, parent_id) VALUES (4, 'Biology', 1);
INSERT INTO tag (id, name, parent_id) VALUES (5, 'Organic', 3);
INSERT INTO tag (id, name, parent_id) VALUES (6, 'Inorganic', 3);
INSERT INTO tag (id, name, parent_id) VALUES (7, 'Physical', 3);
INSERT INTO tag (id, name, parent_id) VALUES (8, 'Biochemistry', 4);
INSERT INTO tag (id, name, parent_id) VALUES (9, 'Genetics', 4);
INSERT INTO tag (id, name, parent_id) VALUES (10, 'Statics', 2);
INSERT INTO tag (id, name, parent_id) VALUES (11, 'Dynamics', 2);
INSERT INTO tag (id, name, parent_id) VALUES (12, 'Quantum Mechanics', 2);
INSERT INTO tag (id, name, parent_id) VALUES (13, 'Thermodynamics', 2);

-- Insert Tag Closure
-- Science
INSERT INTO tag_closure (ancestor_id, descendant_id, depth) VALUES (1, 1, 0); -- Self-reference
INSERT INTO tag_closure (ancestor_id, descendant_id, depth) VALUES (1, 2, 1);
INSERT INTO tag_closure (ancestor_id, descendant_id, depth) VALUES (1, 3, 1);
INSERT INTO tag_closure (ancestor_id, descendant_id, depth) VALUES (1, 4, 1);
INSERT INTO tag_closure (ancestor_id, descendant_id, depth) VALUES (1, 5, 2);
INSERT INTO tag_closure (ancestor_id, descendant_id, depth) VALUES (1, 6, 2);
INSERT INTO tag_closure (ancestor_id, descendant_id, depth) VALUES (1, 7, 2);
INSERT INTO tag_closure (ancestor_id, descendant_id, depth) VALUES (1, 8, 2);
INSERT INTO tag_closure (ancestor_id, descendant_id, depth) VALUES (1, 9, 2);
INSERT INTO tag_closure (ancestor_id, descendant_id, depth) VALUES (1, 10, 2);
INSERT INTO tag_closure (ancestor_id, descendant_id, depth) VALUES (1, 11, 2);
INSERT INTO tag_closure (ancestor_id, descendant_id, depth) VALUES (1, 12, 2);
INSERT INTO tag_closure (ancestor_id, descendant_id, depth) VALUES (1, 13, 2);

-- Physics
INSERT INTO tag_closure (ancestor_id, descendant_id, depth) VALUES (2, 2, 0); -- Self-reference
INSERT INTO tag_closure (ancestor_id, descendant_id, depth) VALUES (2, 10, 1);
INSERT INTO tag_closure (ancestor_id, descendant_id, depth) VALUES (2, 11, 1);
INSERT INTO tag_closure (ancestor_id, descendant_id, depth) VALUES (2, 12, 1);
INSERT INTO tag_closure (ancestor_id, descendant_id, depth) VALUES (2, 13, 1);

-- Chemistry
INSERT INTO tag_closure (ancestor_id, descendant_id, depth) VALUES (3, 3, 0); -- Self-reference
INSERT INTO tag_closure (ancestor_id, descendant_id, depth) VALUES (3, 5, 1);
INSERT INTO tag_closure (ancestor_id, descendant_id, depth) VALUES (3, 6, 1);
INSERT INTO tag_closure (ancestor_id, descendant_id, depth) VALUES (3, 7, 1);

-- Biology
INSERT INTO tag_closure (ancestor_id, descendant_id, depth) VALUES (4, 4, 0); -- Self-reference
INSERT INTO tag_closure (ancestor_id, descendant_id, depth) VALUES (4, 8, 1);
INSERT INTO tag_closure (ancestor_id, descendant_id, depth) VALUES (4, 9, 1);

-- Organic
INSERT INTO tag_closure (ancestor_id, descendant_id, depth) VALUES (5, 5, 0); -- Self-reference

-- Inorganic
INSERT INTO tag_closure (ancestor_id, descendant_id, depth) VALUES (6, 6, 0); -- Self-reference

-- Physical
INSERT INTO tag_closure (ancestor_id, descendant_id, depth) VALUES (7, 7, 0); -- Self-reference

-- Biochemistry
INSERT INTO tag_closure (ancestor_id, descendant_id, depth) VALUES (8, 8, 0); -- Self-reference

-- Genetics
INSERT INTO tag_closure (ancestor_id, descendant_id, depth) VALUES (9, 9, 0); -- Self-reference

-- Statics
INSERT INTO tag_closure (ancestor_id, descendant_id, depth) VALUES (10, 10, 0); -- Self-reference

-- Dynamics
INSERT INTO tag_closure (ancestor_id, descendant_id, depth) VALUES (11, 11, 0); -- Self-reference

-- Quantum Mechanics
INSERT INTO tag_closure (ancestor_id, descendant_id, depth) VALUES (12, 12, 0); -- Self-reference

-- Thermodynamics
INSERT INTO tag_closure (ancestor_id, descendant_id, depth) VALUES (13, 13, 0); -- Self-reference

-- Insert Blogs
INSERT INTO blog (title, body) VALUES ('The Wonders of Quantum Mechanics', 'Exploring the fundamental principles of quantum mechanics and their applications.');
INSERT INTO blog_tags (blog_id, tag_id) VALUES (1, 12);
INSERT INTO blog (title, body) VALUES ('Organic Chemistry Basics', 'An introduction to organic chemistry, focusing on carbon-based compounds.');
INSERT INTO blog_tags (blog_id, tag_id) VALUES (2, 5);
INSERT INTO blog (title, body) VALUES ('The Role of Statics in Engineering', 'Understanding how statics is used to analyze structures in engineering.');
INSERT INTO blog_tags (blog_id, tag_id) VALUES (3, 10);
INSERT INTO blog (title, body) VALUES ('Advancements in Genetics', 'Latest advancements in genetics and their implications in modern science.');
INSERT INTO blog_tags (blog_id, tag_id) VALUES (4, 9);
INSERT INTO blog (title, body) VALUES ('Inorganic Chemistry: An Overview', 'A comprehensive overview of inorganic chemistry and its significance.');
INSERT INTO blog_tags (blog_id, tag_id) VALUES (5, 6);
INSERT INTO blog (title, body) VALUES ('Thermodynamics in Daily Life', 'How thermodynamics principles affect everyday life and technology.');
INSERT INTO blog_tags (blog_id, tag_id) VALUES (6, 13);
INSERT INTO blog (title, body) VALUES ('Understanding Physical Chemistry', 'Exploring the relationship between physical chemistry and chemical processes.');
INSERT INTO blog_tags (blog_id, tag_id) VALUES (7, 7);
INSERT INTO blog (title, body) VALUES ('Dynamics and Motion Analysis', 'The study of dynamics and its application in motion analysis.');
INSERT INTO blog_tags (blog_id, tag_id) VALUES (8, 11);
INSERT INTO blog (title, body) VALUES ('Biochemistry: The Chemical Basis of Life', 'Investigating the chemical processes within living organisms.');
INSERT INTO blog_tags (blog_id, tag_id) VALUES (9, 8);
INSERT INTO blog (title, body) VALUES ('The Science of Physics', 'An exploration of the foundational concepts in physics.');
INSERT INTO blog_tags (blog_id, tag_id) VALUES (10, 2);
INSERT INTO blog (title, body) VALUES ('Applications of Inorganic Chemistry', 'Practical applications and innovations in inorganic chemistry.');
INSERT INTO blog_tags (blog_id, tag_id) VALUES (11, 6);
INSERT INTO blog (title, body) VALUES ('The Evolution of Organic Chemistry', 'The history and development of organic chemistry as a field.');
INSERT INTO blog_tags (blog_id, tag_id) VALUES (12, 5);
INSERT INTO blog (title, body) VALUES ('Cutting-Edge Research in Biochemistry', 'Recent breakthroughs in biochemistry research and their impacts.');
INSERT INTO blog_tags (blog_id, tag_id) VALUES (13, 8);
INSERT INTO blog (title, body) VALUES ('The Fundamentals of Statics', 'A deep dive into the fundamental concepts of statics.');
INSERT INTO blog_tags (blog_id, tag_id) VALUES (14, 10);
INSERT INTO blog (title, body) VALUES ('Genetic Engineering: Pros and Cons', 'An analysis of the benefits and ethical concerns of genetic engineering.');
INSERT INTO blog_tags (blog_id, tag_id) VALUES (15, 9);
INSERT INTO blog (title, body) VALUES ('Physical Chemistry in Industry', 'How physical chemistry principles are applied in various industries.');
INSERT INTO blog_tags (blog_id, tag_id) VALUES (16, 7);
INSERT INTO blog (title, body) VALUES ('The Laws of Thermodynamics', 'A detailed examination of the laws governing thermodynamics.');
INSERT INTO blog_tags (blog_id, tag_id) VALUES (17, 13);
INSERT INTO blog (title, body) VALUES ('Physics and Its Branches', 'An overview of different branches of physics and their interconnections.');
INSERT INTO blog_tags (blog_id, tag_id) VALUES (18, 2);
INSERT INTO blog (title, body) VALUES ('Innovations in Organic Chemistry', 'New innovations and research trends in organic chemistry.');
INSERT INTO blog_tags (blog_id, tag_id) VALUES (19, 5);
INSERT INTO blog (title, body) VALUES ('Exploring Dynamics in Physics', 'How dynamics principles are used to understand physical phenomena.');
INSERT INTO blog_tags (blog_id, tag_id) VALUES (20, 11);
INSERT INTO blog (title, body) VALUES ('The Chemistry of Life: Biochemistry', 'How biochemistry explains the chemical processes in living beings.');
INSERT INTO blog_tags (blog_id, tag_id) VALUES (21, 8);
INSERT INTO blog (title, body) VALUES ('Physics for Beginners', 'A guide to the basics of physics for newcomers to the field.');
INSERT INTO blog_tags (blog_id, tag_id) VALUES (22, 2);
INSERT INTO blog (title, body) VALUES ('Inorganic Chemistry in Modern Technology', 'The role of inorganic chemistry in the development of new technologies.');
INSERT INTO blog_tags (blog_id, tag_id) VALUES (23, 6);
INSERT INTO blog (title, body) VALUES ('Understanding Quantum Mechanics', 'Breaking down the complex concepts of quantum mechanics for easier understanding.');
INSERT INTO blog_tags (blog_id, tag_id) VALUES (24, 12);
INSERT INTO blog (title, body) VALUES ('Organic Chemistry in Pharmaceuticals', 'The importance of organic chemistry in the pharmaceutical industry.');
INSERT INTO blog_tags (blog_id, tag_id) VALUES (25, 5);
