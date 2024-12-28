-- =================================================================
-- VIEWS IN DATABASE
-- =================================================================

-- Creating a database
CREATE DATABASE IF NOT EXISTS Lab5;

-- Changing database
USE Lab5;

-- Creating tables and inserting values into them
CREATE TABLE IF NOT EXISTS Customer(
    CustomerID INT,
    Name VARCHAR(30),
    Age INT,
    Address VARCHAR(50),
    Salary INT
);

INSERT INTO Customer VALUES
(1, 'Ram', 32, 'Kathmandu', 2000),
(2, 'Shyam', 25, 'Patan', 1500),
(3, 'Hari', 23, 'Dharan', 2000),
(4, 'Gopal', 25, 'Pokhara', 6500),
(5, 'Sita', 27, 'Bhaktapur', 8500),
(6, 'Gita', 22, 'Illam', 4500),
(7, 'Rita', 24, 'Banepa', 10000);

CREATE TABLE IF NOT EXISTS `Order`(
    OrderID INT,
    OrderDate DATETIME,
    CustomerID INT,
    Amount INT
);

INSERT INTO `Order` VALUES
(102, '2015-10-08 00:00:00', 3, 3000),
(100, '2014-10-08 00:00:00', 3, 1500),
(101, '2014-11-20 00:00:00', 2, 1560),
(103, '2013-05-20 00:00:00', 4, 2060);

CREATE TABLE IF NOT EXISTS Employee(
    EmployeeID INT,
    EmployeeName VARCHAR(30),
    Job VARCHAR(40),
    DepartmentID INT,
    Salary INT
);

INSERT INTO Employee VALUES
(1, 'Arjun', 'AP', 1, 10000),
(2, 'Rabi', 'JP', 2, 12000),
(3, 'Rohan', 'AP', 2, 15000),
(4, 'Krishna', 'AP', 1, 20000);

CREATE TABLE IF NOT EXISTS Department(
    DepartmentID INT,
    DepartmentName VARCHAR(40),
    Location VARCHAR(50)
);

INSERT INTO Department VALUES
(1, 'Accounting', 'Kathmandu'),
(2, 'Sales', 'Patan'),
(3, 'Research', 'Banepa'),
(4, 'Operations', 'Bhaktapur');

-- Creating a new view and using the view to display only the details of employees whose job are 'AP'
CREATE VIEW Emp_AP AS 
SELECT * FROM Employee WHERE Job='AP';

SELECT 	* FROM Emp_AP;

-- Creating another view to display only name, salary and department of employee whos salary is greater than 10000
CREATE VIEW Emp_info AS
SELECT 
    E.EmployeeName, E.Salary, D.DepartmentName 
FROM
    Employee E
INNER JOIN 
    Department D ON E.DepartmentID = D.DepartmentID
WHERE
    E.Salary > 10000;
    
SELECT * FROM Emp_info;

-- Creating another view to display name, age of customer as well as order date and amount
CREATE VIEW Cus_info AS
SELECT
	Name, Age, OrderDate, Amount 
FROM
	Customer c
INNER JOIN
	`Order` o ON c.CustomerID = o.CustomerID;

SELECT * FROM Cus_info;

-- Updating view 'Cus_info' to also include address and salary of customer
ALTER VIEW Cus_info AS
SELECT
	c.Name, c.Age, o.OrderDate, o.Amount, c.Address, c.Salary
FROM
	Customer c
INNER JOIN
	`Order` o ON c.CustomerID = o.CustomerID;
    
SELECT * FROM Cus_info;

-- Again updating the updated 'Cus_info' view to include only salary greater than 5000
ALTER VIEW Cus_info AS
SELECT
	c.Name, c.Age, o.OrderDate, o.Amount, c.Address, c.Salary
FROM
	Customer c
INNER JOIN
	`Order` o ON c.CustomerID = o.CustomerID
WHERE
	c.Salary>5000;
    
SELECT * FROM Cus_info;

-- =================================================================
-- EOF
-- =================================================================
