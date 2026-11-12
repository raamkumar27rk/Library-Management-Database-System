-- Library Management Database System
-- Transaction Tracking Queries

USE LibraryManagement;

-- 1. Display Complete Transaction Details

SELECT
    Transactions.transaction_id,
    Users.name AS user_name,
    Books.title AS book_title,
    Transactions.issue_date,
    Transactions.return_date,
    Transactions.status
FROM Transactions
INNER JOIN Users
ON Transactions.user_id = Users.user_id
INNER JOIN Books
ON Transactions.book_id = Books.book_id;


-- 2. Display Currently Issued Books

SELECT
    Users.name,
    Books.title,
    Transactions.issue_date,
    Transactions.status
FROM Transactions
INNER JOIN Users
ON Transactions.user_id = Users.user_id
INNER JOIN Books
ON Transactions.book_id = Books.book_id
WHERE Transactions.status = 'Issued';


-- 3. Display Borrowing History of a Particular User

SELECT
    Users.name,
    Books.title,
    Transactions.issue_date,
    Transactions.return_date,
    Transactions.status
FROM Transactions
INNER JOIN Users
ON Transactions.user_id = Users.user_id
INNER JOIN Books
ON Transactions.book_id = Books.book_id
WHERE Users.user_id = 1;


-- 4. Count Total Books Borrowed by Each User

SELECT
    Users.name,
    COUNT(Transactions.transaction_id) AS total_borrowed
FROM Users
LEFT JOIN Transactions
ON Users.user_id = Transactions.user_id
GROUP BY Users.user_id, Users.name;