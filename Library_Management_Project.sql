-- Library Management System

-- CREATING DATABASE
 create database library;
 use library;
 
-- CREATING TABLE BRANCH
CREATE TABLE branch (
    branch_id VARCHAR(10) PRIMARY KEY,
    manager_id VARCHAR(50),
    branch_address VARCHAR(55),
    contact_no VARCHAR(20)
);

-- CREATING TABLE EMPLOYEES
CREATE TABLE employees (
    emp_id VARCHAR(10) PRIMARY KEY,
    emp_name VARCHAR(20),
    position VARCHAR(50),
    salary INT,
    branch_id VARCHAR(20)
);

-- CREATING TABLE BOOKS
CREATE TABLE books (
    isbn VARCHAR(20) PRIMARY KEY,
    book_title VARCHAR(100),
    category VARCHAR(20),
    rental_price FLOAT,
    status VARCHAR(10),
    author VARCHAR(50),
    publisher VARCHAR(50)
);

-- CREATE TABLE MEMBERS
CREATE TABLE members (
    member_id VARCHAR(10) PRIMARY KEY,
    member_name VARCHAR(30),
    member_address VARCHAR(30),
    reg_date DATE
);


-- CREATE TABLE ISSUED STATUS

CREATE TABLE issued_status (
    issued_id VARCHAR(10) PRIMARY KEY,
    issued_member_id VARCHAR(30),
    issued_book_name VARCHAR(80),
    issued_date DATE,
    issued_book_isbn VARCHAR(50),
    issued_emp_id VARCHAR(10)
     FOREIGN KEY (issued_member_id)
        REFERENCES members (member_id),
    FOREIGN KEY (issued_emp_id)
        REFERENCES employees (emp_id),
    FOREIGN KEY (issued_book_isbn)
        REFERENCES books (isbn) 
);

-- CREATING TALE RETURN STATUS

CREATE TABLE return_status (
    return_id VARCHAR(10) PRIMARY KEY,
    issued_id VARCHAR(30),
    return_book_name VARCHAR(80),
    return_date DATE,
    return_book_isbn VARCHAR(50),
    FOREIGN KEY (return_book_isbn)
        REFERENCES books (isbn)
);

-- Task 1. Create a New Book Record -- "978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.')"

INSERT INTO books(isbn, book_title, category, rental_price, status, author, publisher)
VALUES
('978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.');
SELECT 
    *
FROM
    books;


-- Task 2: Update an Existing Member's Address

UPDATE members 
SET 
    member_address = '125 Main St'
WHERE
    member_id = 'C101';
SELECT 
    *
FROM
    members;


-- Task 3: Delete a Record from the Issued Status Table 
-- Objective: Delete the record with issued_id = 'IS121' from the issued_status table.

SELECT 
    *
FROM
    issued_status
WHERE
    issued_id = 'IS121';

DELETE FROM issued_status 
WHERE
    issued_id = 'IS121';



-- Task 4: Retrieve All Books Issued by a Specific Employee -- Objective: Select all books issued by the employee with emp_id = 'E101'.

SELECT 
    *
FROM
    issued_status
WHERE
    issued_emp_id = 'E101';


-- Task 5: List Members Who Have Issued More Than One Book -- Objective: Use GROUP BY to find members who have issued more than one book.



SELECT 
    ist.issued_emp_id, e.emp_name
FROM
    issued_status AS ist
        JOIN
    employees AS e ON e.emp_id = ist.issued_emp_id
GROUP BY 1 , 2
HAVING COUNT(ist.issued_id) > 1;


-- CTAS
-- Task 6: Create Summary Tables: Used CTAS to generate new tables based on query results - each book and total book_issued_cnt**

CREATE TABLE book_cnts
AS    
SELECT 
    b.isbn,
    b.book_title,
    COUNT(ist.issued_id) as no_issued
FROM books as b
JOIN
issued_status as ist
ON ist.issued_book_isbn = b.isbn
GROUP BY 1, 2;


SELECT * FROM
book_cnts;



-- Task 7. Retrieve All Books in a Specific Category:

SELECT * FROM books
WHERE category = 'Classic';

    
-- Task 8: Find Total Rental Income by Category:


SELECT 
    b.category, SUM(b.rental_price), COUNT(*)
FROM
    books AS b
        JOIN
    issued_status AS ist ON ist.issued_book_isbn = b.isbn
GROUP BY 1;


-- List Members Who Registered in the Last 180 Days:

SELECT * FROM members
WHERE reg_date >= CURRENT_DATE -
 INTERVAL 180 day;
    

INSERT INTO members(member_id, member_name, member_address, reg_date)
VALUES
('C118', 'sam', '145 Main St', '2024-06-01'),
('C119', 'john', '133 Main St', '2024-05-01');



-- task 10 List Employees with Their Branch Manager's Name and their branch details:

SELECT 
    e1.*, b.manager_id, e2.emp_name AS manager
FROM
    employees AS e1
        JOIN
    branch AS b ON b.branch_id = e1.branch_id
        JOIN
    employees AS e2 ON b.manager_id = e2.emp_id;


-- Task 11. Create a Table of Books with Rental Price Above a Certain Threshold 7USD:

CREATE TABLE books_price_greater_than_seven
AS   ( 
SELECT * FROM Books
WHERE rental_price > 7);

SELECT * FROM 
books_price_greater_than_seven;


-- Task 12: Retrieve the List of Books Not Yet Returned

SELECT DISTINCT
    ist.issued_book_name
FROM
    issued_status AS ist
        LEFT JOIN
    return_status AS rs ON ist.issued_id = rs.issued_id
WHERE
    rs.return_id IS NULL;

    
SELECT * FROM return_status;
