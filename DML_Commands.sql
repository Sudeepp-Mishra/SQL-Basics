-- =================================================================
-- DML Commands
-- =================================================================

-- Step 1: Create a database
-- This will create a database named 'Practice'
CREATE DATABASE IF NOT EXISTS Practice;

-- Switch to the newly created db 
USE Practice;

-- Step 2: Create a table
-- This will create a table named 'Employee' i.e., the schema will be created
-- IF NOT EXISTS is a good practice to use so that in large dbs there won't be conflict
CREATE TABLE IF NOT EXISTS Emp(
    ID INT PRIMARY KEY,
    Name VARCHAR(30),
    Job VARCHAR(50),
    Salary INT
);

-- Step 3: Inserting Values
-- Inserting single record
INSERT INTO Emp VALUES
(1, 'Ram', 'Pilot', 100000);

-- Inseting Multiple Records
INSERT INTO Emp VALUES
(2, 'Sita', 'Engineer', 150000),
(3, 'Shankar', 'Engineer', 200000),
(4, 'Riteka', 'Architect', 50000),
(5, 'Hrutu', 'Doctor', 100000);

-- Step 4: Updating Records
-- Setting salary of all employees to 100000 who is working as 'Engineer'
UPDATE Emp
SET Salary = 100000
WHERE Job = 'Engineer';

-- Step 5: Displaying/Selecting all information from the 'Emp' table
-- Displays the records of the table 'Emp'
SELECT * FROM Emp;

-- Selecting certain column's information only
-- Display 'Name' and 'Job' from 'Emp' table
SELECT Name, Job FROM Emp;

-- Displaying only those who works as Architect
SELECT * FROM Emp WHERE Job = 'Architect';

-- Displaying only those whose salary is greater than 50000
SELECT * FROM Emp WHERE Salary>50000;

-- Step 6: Deleting Records
-- Deletes who is working as 'Pilot'
DELETE FROM Emp
WHERE Job = 'Pilot';

-- Step 7: Avoiding Duplicate values
-- Selectin all jobs from 'Emp' table without duplication
SELECT DISTINCT(Job) FROM Emp;

-- =================================================================
-- EOF
-- =================================================================

