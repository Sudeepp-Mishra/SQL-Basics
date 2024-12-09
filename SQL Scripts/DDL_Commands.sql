-- =================================================================
-- DDL Commands
-- =================================================================

-- Step 1: Create a database
-- This will create a database named 'Practice'
CREATE DATABASE IF NOT EXISTS Practice;

-- Switch to the newly created db 
USE Practice;

-- Step 2: Create a table
-- This will create a table named 'Employee' i.e., the schema will be created
-- IF NOT EXISTS is a good practice to use so that in large dbs there won't be conflict
CREATE TABLE Student(
    ID INT PRIMARY KEY,
    Name VARCHAR(30) NOT NULL,
    Department VARCHAR(50) NOT NULL,
    Credits INT
);

-- Creating another table
CREATE TABLE Department(
    DepartmentName VARCHAR(50) PRIMARY KEY,
    DepartmentID INT NOT NULL
);

-- Step 3: Alteration in the created tables
-- Adding a new attribute to previously created table
ALTER TABLE Student ADD Faculty VARCHAR(30);

-- Displaying the structure of the created table 'Student', including column names, types, attributes, keys, default values
DESCRIBE Student;
-- OR
DESC Student;

--Displaying structure of 'Department' table
DESCRIBE Department;

-- Modifying coloumn of Name to TINYTEXT datatype (Note: TINYTEXT datatype is for small text blocks up to 255 characters)
ALTER TABLE Student MODIFY Name TINYTEXT;

-- Change the name of the coloum 'Department' from the table 'Student' to 'DepartmentName'
ALTER TABLE Student 
CHANGE Department DepartmentName VARCHAR(50) NOT NULL;

-- Adding constraint to specify 'DepartmentName' as foreign key in 'Student' table
ALTER TABLE Student
ADD FOREIGN KEY (DepartmentName) REFERENCES Department(DepartmentName);

-- Step 4: Dropping the tables
-- DROP will delete the whole schema and the table from db
DROP TABLE IF EXISTS Student;
DROP TABLE IF EXISTS Department;

-- =================================================================
-- EOF
-- =================================================================