-- =================================================================
-- Basic Conditional SQL Queries
-- =================================================================

-- Step 1: Create a database
-- This will create a database named 'Practice'
CREATE DATABASE Practice;

-- Switch to the newly created db 
USE Practice;

-- Step 2: Create a table
-- This will create a table named 'Employee'
-- IF NOT EXISTS is a good practice to use so that in large dbs there won't be conflict
CREATE TABLE IF NOT EXISTS Employee(
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(30) NOT NULL,
    Job VARCHAR(30),
    Country VARCHAR(35),
    City VARCHAR(35),
    Salary INT NOT NULL
);

-- Step 3: Inserting values 
-- Adding sample employees to the 'Employee' table
INSERT INTO Employee (EmployeeID, EmployeeName, Job, Country, City, Salary)
VALUES
    (1, 'Pawan', 'Manager', 'Nepal', 'Pokhara', 20000),
    (2, 'John', 'Programmer', 'Germany', 'Munich', 5000),
    (3, 'Biswas', 'Doctor', 'Germany', 'Berlin', 2500),
    (4, 'Pradip', 'Banker', 'Germany', 'Hamburg', 3400),
    (5, 'Ujjwal', 'Analyst', 'Nepal', 'Makawanpur', 1300),
    (6, 'Harry', 'Engineer', 'Nepal', 'Dhampus', 200),
    (7, 'Sabin', 'Army', 'India', 'Delhi', 2000),
    (8, 'Ron', 'Manager', 'UK', 'Manchester', 20000),
    (9, 'Binod', 'Lecturer', 'India', 'Bihar', 240),
    (10, 'Madhav', 'Pilot', 'Finland', 'London', 20000);

-- Step 4: Selecting all information from the 'Employee' table
-- Displaying all information from the table
SELECT * FROM Employee;

-- Step 5: Selecting specific information/attribute form the 'Employee' table
-- Displaying 'EmployeeName' and 'Job'
SELECT EmployeeName, Job FROM Employee;

-- Step 6: Selection with some filters
-- Selecting Employee with country 'Germany' and salary greater than 2000
SELECT * FROM Employee 
WHERE Country = 'Germany' AND Salary>2000;

-- Selecting EmployeeName, Country, Job and Salary from the table with either job 'programmer' or 'manager'
SELECT EmployeeName, Country, Job, Salary FROM Employee 
WHERE Job='Programmer' OR Job='Manager';
-- OR (Better Approach)
SELECT EmployeeName, Country, Job, Salary FROM Employee
WHERE Job IN('Programmer', 'Manager');

-- Displaying all information with country 'Germany' and city either 'Munich' or 'Berlin'
SELECT * FROM Employee
WHERE Country='Germany' AND City IN('Munich','Berlin');

-- Displaying all information sorted with descending order of name
SELECT * FROM Employee
ORDER BY EmployeeName DESC;

-- Step 7: Selecting information with certain patterns
-- Diplaying information about employee with name starting with letter 'j'
SELECT * FROM Employee
WHERE EmployeeName LIKE 'j%';

-- Displaying information about Employee with country ending with letter 'y'
SELECT * FROM Employee
WHERE Country LIKE '%y';

-- Displaying all employees with country containing the letter 'e'
SELECT * FROM Employee
WHERE Country LIKE '%e%';

-- Displaying all employees with country not containing pattern 'land'
SELECT * FROM Employee
WHERE Country NOT LIKE '%land%';

-- Displaying all employees with city starting with any character followed by 'erlin'
SELECT * FROM Employee
WHERE City LIKE '%erlin';

-- Displaying all employees with city starting with char 'l', then any character, then 'n', again any character and then 'on' (like l_n_on)
SELECT * FROM Employee
WHERE City LIKE 'l_n_on';

-- Displaying all employees with city starting with 'b', 'm' or 'd'
SELECT * FROM Employee
WHERE City LIKE 'b%' OR City LIKE 'm%' OR City LIKE 'd%';

-- Displaying all employees with city not starting with 'b', 'm' or 'd'
SELECT * FROM Employee
WHERE City NOT LIKE 'b%' AND City NOT LIKE 'm%' AND City NOT LIKE 'd%';

-- Step 8: Selection using BETWEEN operation
-- Selecting all employees with salary between 20000 to 350000
SELECT * FROM Employee
WHERE Salary BETWEEN 20000 AND 35000;

-- Selecting all employees with salary between 10000 and 40000, but employees with ID 1,2, or 3 should not be displayed
SELECT * FROM Employee
WHERE (Salary BETWEEN 10000 AND 40000)
AND (EmployeeID NOT BETWEEN 1 AND 3);

-- Selecting all employees with city containing any of the letter between 'b' and 'm'
SELECT * FROM Employee
WHERE City BETWEEN 'b' AND 'm';

-- Selecting all employees with city not containing any of the letter between 'b' and 'm'
SELECT * FROM Employee
WHERE City NOT BETWEEN 'b' AND 'm';

-- =================================================================
-- EOF
-- =================================================================