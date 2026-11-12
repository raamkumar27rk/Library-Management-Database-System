-- Library Management Database System
-- Table Creation

USE LibraryManagement;

-- 1. Categories Table

CREATE TABLE IF NOT EXISTS Categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL UNIQUE
);

-- 2. Books Table

CREATE TABLE IF NOT EXISTS Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    author VARCHAR(100) NOT NULL,
    category_id INT,
    total_copies INT NOT NULL,
    available_copies INT NOT NULL,
    FOREIGN KEY (category_id) REFERENCES Categories(category_id),
    CHECK (total_copies >= 0),
    CHECK (available_copies >= 0),
    CHECK (available_copies <= total_copies)
);

-- 3. Users Table

CREATE TABLE IF NOT EXISTS Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(15)
);

-- 4. Transactions Table

CREATE TABLE IF NOT EXISTS Transactions (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT NOT NULL,
    user_id INT NOT NULL,
    issue_date DATE NOT NULL,
    return_date DATE,
    status VARCHAR(20) DEFAULT 'Issued',
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    CHECK (status IN ('Issued', 'Returned'))
);