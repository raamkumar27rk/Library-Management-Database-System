-- Library Management Database System
-- Library Reports

USE LibraryManagement;


-- 1. Find the Most Borrowed Books

SELECT
    Books.title,
    COUNT(Transactions.transaction_id) AS times_borrowed
FROM Books
LEFT JOIN Transactions
ON Books.book_id = Transactions.book_id
GROUP BY Books.book_id, Books.title
ORDER BY times_borrowed DESC;


-- 2. Display Books with Low Availability

SELECT
    title,
    author,
    total_copies,
    available_copies
FROM Books
WHERE available_copies < 3
ORDER BY available_copies ASC;


-- 3. Count Books in Each Category

SELECT
    Categories.category_name,
    COUNT(Books.book_id) AS total_books
FROM Categories
LEFT JOIN Books
ON Categories.category_id = Books.category_id
GROUP BY Categories.category_id, Categories.category_name
ORDER BY total_books DESC;


-- 4. Count Currently Issued Books

SELECT
    COUNT(*) AS currently_issued_books
FROM Transactions
WHERE status = 'Issued';


-- 5. Generate Complete Library Summary

SELECT
    COUNT(*) AS total_book_titles,
    SUM(total_copies) AS total_book_copies,
    SUM(available_copies) AS available_book_copies,
    SUM(total_copies - available_copies) AS borrowed_book_copies
FROM Books;