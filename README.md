# Library Management Database System

## Project Description

The Library Management Database System is a SQL-based project developed using MySQL. It helps manage library books, categories, registered users, and book borrowing and returning transactions.

The project uses relational database concepts, SQL queries, joins, aggregate functions, and stored procedures to manage library operations efficiently.

## Features

- Create and manage library database tables.
- Store book details and categories.
- Maintain library user information.
- Issue books to registered users.
- Return previously issued books.
- Automatically update available book copies.
- Prevent issuing books when no copies are available.
- Prevent returning the same book more than once.
- Track borrowing and returning history.
- Generate library reports.

## Technologies Used

- MySQL
- MySQL Workbench
- SQL

## Database Structure

The project contains four tables:

### 1. Categories
Stores book categories such as Programming, Science, History, Mathematics, and Technology.

### 2. Books
Stores book details, including title, author, category, total copies, and available copies.

### 3. Users
Stores registered library users, including their names, email addresses, and phone numbers.

### 4. Transactions
Stores book issuing and returning details, including user ID, book ID, issue date, return date, and transaction status.

## Project Files

| File Name | Description |
|---|---|
| 01_create_database.sql | Creates the library database |
| 02_create_tables.sql | Creates all four database tables |
| 03_insert_sample_data.sql | Inserts sample categories, books, and users |
| 04_book_operations.sql | Creates IssueBook and ReturnBook procedures |
| 05_transaction_queries.sql | Contains transaction tracking queries |
| 06_library_reports.sql | Contains library report queries |

## How to Run the Project

### Requirements
- MySQL Server
- MySQL Workbench

### Step 1: Create the Database
Open MySQL Workbench and execute:

`01_create_database.sql`

### Step 2: Create the Tables
Execute:

`02_create_tables.sql`

### Step 3: Insert Sample Data
Execute:

`03_insert_sample_data.sql`

**Note:** Run this file only once on a newly created database. Running it again may create duplicate records or cause unique-key errors.

### Step 4: Create Stored Procedures
Execute:

`04_book_operations.sql`

### Step 5: Run Transaction Queries
Execute:

`05_transaction_queries.sql`

### Step 6: Generate Library Reports
Execute:

`06_library_reports.sql`

## Using Book Operations

### Issue a Book

Use the following procedure to issue a book:

```sql
CALL IssueBook(1, 1);
```

Here:
- `1` represents the book ID.
- `1` represents the user ID.

The procedure checks availability, reduces the available book count, and creates a transaction.

### Return a Book

First, find the transaction ID:

```sql
SELECT * FROM Transactions;
```

Then use the transaction ID to return the book:

```sql
CALL ReturnBook(1);
```

The procedure updates the transaction status and increases the available book count.

## Example Queries

Display all books:

```sql
SELECT * FROM Books;
```

Display currently issued books:

```sql
SELECT * FROM Transactions
WHERE status = 'Issued';
```

Display books with fewer than three available copies:

```sql
SELECT * FROM Books
WHERE available_copies < 3;
```

Display all registered users:

```sql
SELECT * FROM Users;
```

## Concepts Covered

- Database creation
- Table creation
- Primary keys and foreign keys
- Constraints
- Data insertion and manipulation
- SELECT queries
- WHERE and ORDER BY clauses
- INNER JOIN and LEFT JOIN
- Aggregate functions
- GROUP BY
- Stored procedures
- Transactions and error handling

## Author

Developed as a SQL Database Management project.