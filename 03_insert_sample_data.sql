-- Library Management Database System
-- Insert Sample Data

USE LibraryManagement;

-- 1. Insert Categories

INSERT INTO Categories (category_name)
VALUES
('Programming'),
('Science'),
('History'),
('Mathematics'),
('Technology');

-- 2. Insert Books

INSERT INTO Books
(title, author, category_id, total_copies, available_copies)
VALUES
('Java Programming', 'James Gosling', 1, 5, 5),
('Python Basics', 'Mark Lutz', 1, 4, 4),
('Physics Fundamentals', 'David Halliday', 2, 3, 3),
('World History', 'William McNeill', 3, 4, 4),
('Engineering Mathematics', 'B.S. Grewal', 4, 5, 5),
('Artificial Intelligence', 'Stuart Russell', 5, 3, 3),
('C Programming', 'Dennis Ritchie', 1, 4, 4),
('Computer Networks', 'Andrew Tanenbaum', 5, 2, 2);

-- 3. Insert Library Users

INSERT INTO Users (name, email, phone)
VALUES
('Rahul Kumar', 'rahul@gmail.com', '9876543210'),
('Arun Kumar', 'arun@gmail.com', '9876543211'),
('Priya Sharma', 'priya@gmail.com', '9876543212'),
('Vijay Raj', 'vijay@gmail.com', '9876543213'),
('Anitha Devi', 'anitha@gmail.com', '9876543214');