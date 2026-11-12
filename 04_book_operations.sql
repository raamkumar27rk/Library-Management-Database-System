-- Library Management Database System
-- Book Issuing and Returning Procedures

USE LibraryManagement;

-- Remove existing procedures before recreating them

DROP PROCEDURE IF EXISTS IssueBook;
DROP PROCEDURE IF EXISTS ReturnBook;

DELIMITER //

-- 1. Issue Book Procedure

CREATE PROCEDURE IssueBook(
    IN p_book_id INT,
    IN p_user_id INT
)
BEGIN
    DECLARE v_available INT;
    DECLARE v_found BOOLEAN DEFAULT TRUE;

    DECLARE CONTINUE HANDLER FOR NOT FOUND
        SET v_found = FALSE;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    START TRANSACTION;

    SELECT available_copies
    INTO v_available
    FROM Books
    WHERE book_id = p_book_id
    FOR UPDATE;

    IF v_found = FALSE THEN

        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Book not found';

    ELSEIF v_available > 0 THEN

        UPDATE Books
        SET available_copies = available_copies - 1
        WHERE book_id = p_book_id;

        INSERT INTO Transactions
        (book_id, user_id, issue_date, status)
        VALUES
        (p_book_id, p_user_id, CURDATE(), 'Issued');

    ELSE

        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Book is not available';

    END IF;

    COMMIT;

END //

-- 2. Return Book Procedure

CREATE PROCEDURE ReturnBook(
    IN p_transaction_id INT
)
BEGIN
    DECLARE v_book_id INT;
    DECLARE v_status VARCHAR(20);
    DECLARE v_found BOOLEAN DEFAULT TRUE;

    DECLARE CONTINUE HANDLER FOR NOT FOUND
        SET v_found = FALSE;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    START TRANSACTION;

    SELECT book_id, status
    INTO v_book_id, v_status
    FROM Transactions
    WHERE transaction_id = p_transaction_id
    FOR UPDATE;

    IF v_found = FALSE THEN

        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Transaction not found';

    ELSEIF v_status = 'Returned' THEN

        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Book has already been returned';

    ELSE

        UPDATE Transactions
        SET
            return_date = CURDATE(),
            status = 'Returned'
        WHERE transaction_id = p_transaction_id;

        UPDATE Books
        SET available_copies = available_copies + 1
        WHERE book_id = v_book_id
        AND available_copies < total_copies;

    END IF;

    COMMIT;

END //

DELIMITER ;