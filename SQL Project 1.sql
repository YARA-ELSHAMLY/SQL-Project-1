create database UniversityDB;




CREATE TABLE Students (
    StudentID INT PRIMARY KEY ,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    EnrollmentDate DATE
);


CREATE TABLE Courses (
    CourseID INT PRIMARY KEY ,
    CourseName VARCHAR(100),
    Credits INT
);




INSERT INTO Students (StudentID, FirstName, LastName, EnrollmentDate) VALUES 
(1, 'John', 'Doe', '2023-08-20'),
(2, 'Jane', 'Smith', '2023-09-10'),
(3, 'Michael', 'Johnson', '2023-09-15');


INSERT INTO Courses (CourseID, CourseName, Credits) VALUES 
(1, 'Mathematics', 3),
(2, 'Physics', 3),
(3, 'Chemistry', 4);




SELECT * FROM Students;
SELECT * FROM Courses;


UPDATE Courses 
SET Credits = 4 
WHERE CourseName = 'Physics';



DELETE FROM Students 
WHERE FirstName = 'John' AND LastName = 'Doe';


SELECT * FROM Students 
WHERE EnrollmentDate > '2023-09-01';


SELECT * FROM Courses 
WHERE Credits > 3;


-- Total number of students
SELECT COUNT(*) AS TotalStudents FROM Students;

-- Average credits for courses
SELECT AVG(Credits) AS AverageCredits FROM Courses;



ALTER TABLE Courses
ADD CONSTRAINT chk_Credits CHECK (Credits >= 0);



CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY ,
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

INSERT INTO students (StudentID, FirstName, LastName, EnrollmentDate)
VALUES (1, 'Emily', 'Davis', '2024-10-24');


SELECT * FROM Students;
UPDATE Students
SET FirstName = 'Emily', LastName = 'Davis', EnrollmentDate = '2024-10-24'
WHERE StudentID = 1;
INSERT INTO Students (StudentID, FirstName, LastName, EnrollmentDate)
VALUES (4, 'Emily', 'Davis', '2024-10-24');



INSERT INTO Enrollments (EnrollmentID, StudentID, CourseID, EnrollmentDate) VALUES 
(1, 1, 1, '2023-09-01'),  -- Existing student enrolled in Mathematics
(2, 2, 2, '2023-09-02'),  -- Existing student enrolled in Physics
(3, 3, 3, '2023-09-03'),  -- Existing student enrolled in Chemistry
(4, 4, 1, '2023-09-04');  -- New student enrolled in Mathematics




-- Query to join Students and Courses
SELECT 
    Students.StudentID,
    Students.FirstName,
    Students.LastName,
    Courses.CourseName,
    Enrollments.EnrollmentDate
FROM 
    Enrollments
JOIN 
    Students ON Enrollments.StudentID = Students.StudentID
JOIN 
    Courses ON Enrollments.CourseID = Courses.CourseID;



SELECT 
    CourseName,
    LENGTH(CourseName) AS CourseNameLength 
FROM 
    Courses;



SELECT 
    StudentID,
    FirstName,
    LastName
FROM 
    Students
WHERE 
    StudentID IN (
        SELECT 
            Enrollments.StudentID
        FROM 
            Enrollments
        JOIN 
            Courses ON Enrollments.CourseID = Courses.CourseID
        WHERE 
            Courses.Credits > 3
    );



CREATE VIEW StudentCourseView AS
SELECT 
    Students.StudentID,
    Students.FirstName,
    Students.LastName,
    Courses.CourseName
FROM 
    Enrollments
JOIN 
    Students ON Enrollments.StudentID = Students.StudentID
JOIN 
    Courses ON Enrollments.CourseID = Courses.CourseID;



CREATE INDEX idx_LastName ON Students(LastName);


START TRANSACTION;

-- Insert a new student
INSERT INTO Students (StudentID, FirstName, LastName, EnrollmentDate) VALUES 
(5, 'Sarah', 'Connor', '2024-01-15');

-- Insert a new course
INSERT INTO Courses (CourseID, CourseName, Credits) VALUES 
(4, 'Biology', 3);

-- Commit the transaction
COMMIT;

-- If there is an error, roll back the transaction
ROLLBACK;




CREATE TABLE MixedDataTable (
    ID SERIAL PRIMARY KEY,
    Name VARCHAR(50),
    BirthDate DATE,
    Salary DECIMAL(10, 2),
    IsActive BOOLEAN
);


INSERT INTO MixedDataTable (Name, BirthDate, Salary, IsActive) VALUES 
('Alice', '1990-05-15', 50000.00, TRUE),
('Bob', '1985-10-20', 60000.50, FALSE),
('Carol', '1978-12-05', 70000.75, TRUE),
('Dave', '1992-07-25', 80000.00, TRUE);



SELECT 
    Name, 
    BirthDate, 
    CONCAT('Salary: $', TO_CHAR(Salary, 'FM9999999990.00')) AS SalaryFormatted, 
    CASE 
        WHEN IsActive THEN 'Active' 
        ELSE 'Inactive' 
    END AS Status
FROM 
    MixedDataTable;















