
Use ADBMS;

CREATE TABLE TBL_Employee (
	EmpID integer primary key,
	Ename varchar(max) NOT NULL,
	Department varchar(max) NOT NULL,
	ManagerID integer NULL
	FOREIGN KEY (ManagerID) REFERENCES TBL_Employee(EmpID)
);

CREATE TABLE TBL_Department (
	EmployeeName varchar(max),
	EmployeeDept varchar(max),
	ManagerName varchar(max),
	ManagerDept varchar(max),
);

Insert into TBL_Employee (EmpID, EName, Department, ManagerID) values
(1, 'Alice', 'HR', NULL),        
(2, 'Bob', 'Finance', 1),
(3, 'Charlie', 'IT', 1),
(4, 'David', 'Finance', 2),
(5, 'Eve', 'IT', 3),
(6, 'Frank', 'HR', 1)

Insert into TBL_Department(EmployeeName, EmployeeDept, ManagerName, ManagerDept) values
('Alice', 'HR', NULL, NULL),
('Alice', 'HR', NULL, NULL),
('Alice', 'HR', NULL, NULL),
('Alice', 'HR', NULL, NULL),
('Alice', 'HR', NULL, NULL)

SELECT E1.EName AS [Employee Name], E2.EName AS [Manager Name],
	E1.Department AS [Employee Dept], E2.Department AS [Manager Dept]
FROM
TBL_Employee AS E1
LEFT OUTER JOIN
TBL_Employee AS E2
ON
E1.ManagerID = E2.EmpID;

  --------------(HARD LEVEL)--------------
  --(B) part
  -- Create Year_tbl (holds actual NPV values)
  CREATE TABLE Year_tbl (
      ID INT,
      YEAR INT,
      NPV INT
  );

  -- Create Queries table (requested values)
  CREATE TABLE Queries (
      ID INT,
      YEAR INT
  );

  -- Insert data into Year_tbl
  INSERT INTO Year_tbl (ID, YEAR, NPV)
  VALUES
  (1, 2018, 100),
  (7, 2020, 30),
  (13, 2019, 40),
  (1, 2019, 113),
  (2, 2008, 121),
  (3, 2009, 12),
  (11, 2020, 99),
  (7, 2019, 0);

  -- Insert data into Queries
  INSERT INTO Queries (ID, YEAR)
  VALUES
  (1, 2019),
  (2, 2008),
  (3, 2009),
  (7, 2018),
  (7, 2019),
  (7, 2020),
  (13, 2019);

 SELECT Q.ID, Q.YEAR, ISNULL(Y.NPV, 0) AS MPV
 FROM
 Queries AS Q
 LEFT OUTER JOIN
 Year_tbl AS Y
 ON
 Y.ID = Q.ID
 AND
 Y.YEAR = Q.YEAR;
