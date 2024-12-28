-- =================================================================
-- Sub Queries and Join Queries
-- =================================================================

-- Creating Table 'Customer'
CREATE TABLE IF NOT EXISTS Customer(
    CustomerID INT,
    Name VARCHAR(30),
    Age INT,
    Address VARCHAR(50),
    Salary INT
);

-- Creating Table 'Order' 
-- Here we can't use Order only coz its a reserved keyword in SQL so use backtics (`) for handling it
CREATE TABLE IF NOT EXISTS `Order`(
    OrderID INT,
    OrderDate DATETIME,
    CustomerID INT,
    Amount INT
);

-- Creating Table 'Employee'
CREATE TABLE IF NOT EXISTS Employee(
    EmployeeID INT,
    EmployeeName VARCHAR(30),
    Job VARCHAR(40),
    DepartmentID INT,
    Salary INT
);

-- Creating Table 'Department'
CREATE TABLE IF NOT EXISTS Department(
    DepartmentID INT,
    DepartmentName VARCHAR(40),
    Location VARCHAR(50)
);

-- Inserting values into 'Customer'
INSERT INTO Customer VALUES
(1, 'Ram', 32, 'Kathmandu', 2000),
(2, 'Shyam', 25, 'Patan', 1500),
(3, 'Hari', 23, 'Dharan', 2000),
(4, 'Gopal', 25, 'Pokhara', 6500),
(5, 'Sita', 27, 'Bhaktapur', 8500),
(6, 'Gita', 22, 'Illam', 4500),
(7, 'Rita', 24, 'Banepa', 10000);

-- Inserting values into 'Order'
INSERT INTO `Order` VALUES
(102, '2015-10-08 00:00:00', 3, 3000),
(100, '2014-10-08 00:00:00', 3, 1500),
(101, '2014-11-20 00:00:00', 2, 1560),
(103, '2013-05-20 00:00:00', 4, 2060);

--Inserting values into 'Employee'
INSERT INTO Employee VALUES
(1, 'Arjun', 'AP', 1, 10000),
(2, 'Rabi', 'JP', 2, 12000),
(3, 'Rohan', 'AP', 2, 15000),
(4, 'Krishna', 'AP', 1, 20000);

-- Inserting values into 'Department'
INSERT INTO Department VALUES
(1, 'Accounting', 'Kathmandu'),
(2, 'Sales', 'Patan'),
(3, 'Research', 'Banepa'),
(4, 'Operations', 'Bhaktapur');

-- Selecting 'EmployeeName' and 'Salary' from 'Employee' table whose salary is greater than minimum salary and job title starts with 'J'
SELECT EmployeeName, Salary FROM Employee
WHERE Salary > (SELECT MIN(Salary) FROM Employee)
AND Job LIKE 'J%';

-- Selecting all employees who work in the same job as 'Arjun'
SELECT * FROM Employee
WHERE Job = (SELECT Job FROM Employee WHERE EmployeeName='Arjun');

-- Displaying information about employees who earn more than employee in DepartmentID=1
SELECT * FROM Employee
WHERE Salary > (SELECT MAX(Salary) FROM Employee WHERE DepartmentID=1);

-- Implementing JOIN Queries
-- INNER JOIN for tables 'Employee' and 'Department'
SELECT e.EmployeeName, d.DepartmentName
FROM Employee e
INNER JOIN Department d
ON e.DepartmentID=d.DepartmentID;

-- LEFT JOIN (or LEFT OUTER JOIN) for tables 'Employee' and 'Department'
SELECT e.EmployeeName, d.DepartmentName
FROM Employee e
LEFT JOIN Department d
ON e.DepartmentID=d.DepartmentID;

-- RIGHT JOIN (or RIGHT OUTER JOIN) for tables 'Employee' and 'Department'
SELECT e.EmployeeName, d.DepartmentName
FROM Employee e
RIGHT JOIN Department d
ON e.DepartmentID=d.DepartmentID;

-- INNER JOIN for tables 'Customer' and 'Order'
SELECT c.Name, o.OrderDate
FROM Customer c
INNER JOIN `Order` o
ON c.CustomerID=o.CustomerID;

-- LEFT JOIN (or LEFT OUTER JOIN) for tables 'Customer' and 'Order'
SELECT c.Name, o.OrderDate
FROM Customer c
LEFT JOIN `Order` o
ON c.CustomerID=o.CustomerID;

-- RIGHT JOIN (or RIGHT OUTER JOIN) for tables 'Customer' and 'Order'
SELECT c.Name, o.OrderDate
FROM Customer c
RIGHT JOIN `Order` o
ON c.CustomerID=o.CustomerID;

-- =================================================================
-- EOF
-- =================================================================