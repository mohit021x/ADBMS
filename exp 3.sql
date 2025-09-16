USE UMANG;

-- MEDIUM LEVEL QUESTION

CREATE TABLE department (
    id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);
drop table employee;
-- Create Employee Table
CREATE TABLE employee (
    id INT,
    name VARCHAR(50),
    salary INT,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES department(id)
);


-- Insert into Department Table
INSERT INTO department (id, dept_name) VALUES
(1, 'IT'),
(2, 'SALES');

-- Insert into Employee Table
INSERT INTO employee (id, name, salary, department_id) VALUES
(1, 'JOE', 70000, 1),
(2, 'JIM', 90000, 1),
(3, 'HENRY', 80000, 2),
(4, 'SAM', 60000, 2),
(5, 'MAX', 90000, 1);

-- FINDING MAXIMUM SALARY FROM BOTH IT AND SALES

SELECT D.dept_name,E.NAME,E.SALARY
FROM 
employee AS E
INNER JOIN 
DEPARTMENT AS D
ON E.DEPARTMENT_ID = D.ID
WHERE SALARY IN
(
    SELECT MAX(E2.SALARY)
    FROM EMPLOYEE AS E2
    WHERE E2.department_id= E.department_id
)
ORDER BY D.dept_name



--HARD LEVEL QUESTION


CREATE TABLE A(EMPID INT PRIMARY KEY,ENAME VARCHAR(MAX), SALARY INT);
INSERT INTO A (EMPID,ENAME,SALARY) VALUES
(1,'AA',1000),
(2,'BB',300);


CREATE TABLE B(EMPID INT PRIMARY KEY,ENAME VARCHAR(MAX), SALARY INT);
INSERT INTO B (EMPID,ENAME,SALARY) VALUES
(1,'BB',400),
(2,'CC',100);


SELECT EMPID, ENAME, MIN(SALARY) AS SALARY
FROM
(
    SELECT * FROM A
    UNION ALL
    SELECT * FROM B
) AS INTERMEDIATE_RESULT
GROUP BY EMPID











