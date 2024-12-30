-- Creating a database
CREATE DATABASE Lab6;
USE Lab6;

-- Creating table named 'StudentMarks'
CREATE TABLE StudentMarks(
stu_id INT PRIMARY KEY,
total_marks INT,
grade VARCHAR(20));

-- Inserting values into the created table
INSERT INTO StudentMarks VALUES
(1, 460, 'A+'),
(2, 490, 'A++'),
(3, 440, 'B'),
(4, 380, 'C'),
(5, 150, 'D'),
(6, 100, 'F');

-- Creating a stored procedure that finds the marks of all students
DELIMITER //

CREATE PROCEDURE SelectAll()
BEGIN
	SELECT * FROM StudentMarks;
END //

DELIMITER ;

-- Calling the procedure SelectAll()
CALL SelectAll();

-- Creating a stored procedure that selects students who obtained marks 200
DELIMITER //

CREATE PROCEDURE SpecificStudents()
BEGIN
	SELECT * FROM StudentMarks
    WHERE total_marks>200;
END //

DELIMITER ;

-- Calling the procedure SpecificStudents()
CALL SpecificStudents();

-- Creating Stored procedure and invocation and that takes grade as a parameter
DELIMITER //

CREATE PROCEDURE SpecificGradeCall(IN grade_input VARCHAR(20))
BEGIN
    SELECT * FROM StudentMarks WHERE grade = grade_input;
END //

DELIMITER ;

-- Calling the procedure GradeCall()
CALL SpecificGradeCall('A++');

-- Altering the procedure 'SelectAll()' to change it to dispaly only grade of students
DELIMITER //

-- Drop the existing procedure if it exists
DROP PROCEDURE IF EXISTS SelectAll;

-- Create the updated procedure
CREATE PROCEDURE SelectAll()
BEGIN
    SELECT grade FROM StudentMarks;
END //

DELIMITER ;

-- Calling the new modified SelectAll() procedure
CALL SelectAll();

-- Procedure to count grades of students
DELIMITER //

CREATE PROCEDURE GetGradeCounts()
BEGIN
    SELECT grade, COUNT(*) AS total_students
    FROM StudentMarks
    GROUP BY grade;
END //

DELIMITER ;

-- Calling the created procedure
CALL GetGradeCounts();

-- Dropping porcedure SpecificStudents()
DROP PROCEDURE IF EXISTS SpecificStudents;