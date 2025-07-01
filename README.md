# Library_Management
🗂️ Project Overview
This project demonstrates the design and implementation of a basic Library Management System using SQL. It simulates real-world library operations such as managing books, members, employees, issuing and returning books, and generating reports using SQL queries.

🛠️ Technologies Used
MySQL (Database)

SQL (DDL, DML, Joins, Aggregations, Subqueries)

🏢 Database Structure
The system contains the following tables:

branch — Stores branch details and manager information

employees — Employee details and their assigned branch

books — Book details such as title, author, price, and status

members — Library member information

issued_status — Records of issued books

return_status — Records of returned books

✅ Key Functionalities & Tasks
✔️ Database Creation & Table Setup
Created library database and structured all required tables with appropriate relationships using Primary and Foreign Keys.

✔️ Task 1: Insert a New Book Record
Added book "To Kill a Mockingbird" with relevant details to the books table.

✔️ Task 2: Update Member Address
Updated the address of an existing member.

✔️ Task 3: Delete Issued Record
Deleted a specific issued book record using issued_id.

✔️ Task 4: Retrieve Books Issued by a Specific Employee
Used WHERE clause to filter records for a given emp_id.

✔️ Task 5: List Members Who Issued More Than One Book
Implemented GROUP BY and HAVING clause for aggregation check.

✔️ Task 6: Create Summary Table for Book Issue Count
Used CTAS (Create Table As Select) to generate a new summary table showing issued counts per book.

✔️ Task 7: Retrieve Books by Specific Category
Filtered books belonging to the 'Classic' category.

✔️ Task 8: Calculate Total Rental Income by Category
Aggregated rental income and issued book count per category.

✔️ Task 9: List Recently Registered Members
Retrieved members registered within the last 180 days.

✔️ Task 10: List Employees with Branch Manager Details
Performed self-join to fetch employee details along with their branch manager's name.

✔️ Task 11: Create Table for Books with Rental Price > $7
Created a new table containing only books with rental price above $7.

✔️ Task 12: List Books Not Yet Returned
Used LEFT JOIN to find books that are still issued and not returned.

💡 Conclusion
This project covers key SQL concepts such as:

Database creation and table design

Relationships with foreign keys

Data manipulation (Insert, Update, Delete)

Aggregations, Joins, Filtering

Subqueries & Summary Tables

Real-world reporting scenarios

🙋‍♀️ Author
Jyoti Bawa
🎯 SQL Enthusiast | Data Analyst Aspirant
