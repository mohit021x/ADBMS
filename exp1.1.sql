create database ADBMS;
use ADBMS;

/*
Easy-Level Problem
Problem Title: Author-Book Relationship Using Joins and Basic SQL Operations
Procedure (Step-by-Step):
Design two tables — one for storing author details and the other for book details.

Ensure a foreign key relationship from the book to its respective author.

Insert at least three records in each table.

Perform an INNER JOIN to link each book with its author using the common author ID.

Select the book title, author name, and author’s country.

Sample Output Description:

When the join is performed, we get a list where each book title is shown along with its author’s name and their country.
*/

create table TBL_Author(
	AuthorId Int primary key, 
	AuthorName varchar(max), -- max keyword 255 is the size 
	Country varchar(max)
)

create table TBL_Books(
	BookId Int primary key, 
	BookTitle varchar(max),
	AuthorId Int 
	Foreign key (AuthorId) references TBL_Author(AuthorId), 
)

INSERT INTO TBL_Author (AuthorId, AuthorName, Country) VALUES
(1, 'George Orwell', 'United Kingdom'),
(2, 'Haruki Murakami', 'Japan'),
(3, 'Chinua Achebe', 'Nigeria'),
(4, 'J.K. Rowling', 'United Kingdom'),
(5, 'Gabriel García Márquez', 'Colombia'),
(6, 'Mark Twain', 'United States');

INSERT INTO TBL_Books (BookId, BookTitle, AuthorId) VALUES
(101, '1984', 1),
(102, 'Kafka on the Shore', 2),
(103, 'Things Fall Apart', 3),
(104, 'Harry Potter and the Sorcerer"s Stone', 4),
(105, 'One Hundred Years of Solitude', 5),
(106, 'Adventures of Huckleberry Finn', 6);

---- Query for Join ----
SELECT 
BookTitle AS "Book Name",
AuthorName AS "Author Name",
Country FROM
TBL_Author AS A INNER JOIN
TBL_Books AS B ON
A.AuthorId = B.AuthorId;

/*
Medium-Level Problem
Problem Title: Department-Course Subquery and Access Control
Procedure (Step-by-Step):

Design normalized tables for departments and the courses they offer, maintaining a foreign key relationship.

Insert five departments and at least ten courses across those departments.
z
Use a subquery to count the number of courses under each department.

Filter and retrieve only those departments that offer more than two courses.

Grant SELECT-only access on the courses table to a specific user.

Sample Output Description:

The result shows the names of departments which are associated with more than two courses in the system.
*/

-- Create Department Table
CREATE TABLE Department (
    DeptId INT PRIMARY KEY,
    DeptName VARCHAR(100)
);

-- Create Course Table
CREATE TABLE Course (
    CourseId INT PRIMARY KEY,
    CourseName VARCHAR(100),
    DeptId INT,
    FOREIGN KEY (DeptId) REFERENCES Department(DeptId)
);


-- Insert Departments
INSERT INTO Department VALUES
(1, 'Computer Science'),
(2, 'Physics'),
(3, 'Mathematics'),
(4, 'Chemistry'),
(5, 'Biology');

-- Insert Courses
INSERT INTO Course VALUES
(101, 'Data Structures', 1),
(102, 'Operating Systems', 1),
(103, 'Quantum Mechanics', 2),
(104, 'Electromagnetism', 2),
(105, 'Linear Algebra', 3),
(106, 'Calculus', 3),
(107, 'Organic Chemistry', 4),
(108, 'Physical Chemistry', 4),
(109, 'Genetics', 5),
(110, 'Computer Networks', 1),
(111, 'Linux/Unix systems', 1),
(112, 'Matrix', 3),
(113, 'Space Physics', 2);

---- Query to count number of courses under each department
SELECT 
    DeptID,
    DeptName,
    (SELECT COUNT(*) 
     FROM Course 
     WHERE Course.DeptId = Department.DeptId) AS CourseCount
FROM Department 
where (SELECT COUNT(*) 
     FROM Course 
     WHERE Course.DeptId = Department.DeptId) > 2;


-- query to create user and grant permission
create login test_login with password = 'Test@123';
create user test_user for login test_login; 
execute as user = 'test_user'; 
grant select on Course to test_user; 