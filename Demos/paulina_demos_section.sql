-- Connect to database (MySQL)
USE maven_advanced_sql;

-- 1. View the students table
SELECT * FROM students;

-- 2. The big 6
SELECT grade_level, AVG(gpa) AS avg_gpa
FROM students
WHERE school_lunch = "Yes"
GROUP BY grade_level
HAVING avg_gpa < 3.3
ORDER BY grade_level;

-- 3. Common keywords

-- DISTINCT -- I want to see the distinct grade levels (values)
SELECT DISTINCT grade_level
FROM students;

-- COUNT -- I want to count the distinct grade levels
SELECT COUNT(DISTINCT grade_level) AS number_of_grade_levels
FROM students;

-- MAX and MIN -- I want the gpa range 
SELECT MAX(gpa) - MIN(gpa) AS gpa_range
FROM students;

-- AND -- I want to see the students that are lower than 12 grade and have school lunch
SELECT *
FROM students
WHERE grade_level < 12 AND school_lunch = "Yes";

-- IN -- I want to see the students in the grades 9, 10, 11
SELECT *
FROM students
WHERE grade_level IN (9, 10, 11);

-- IS NULL -- I want to see the student that don't have a value in the email column
SELECT *
FROM students
WHERE email IS NOT NULL;

-- LIKE -- I want to see the students with an email ending in .edu -- % means 'any text'
SELECT *
FROM students
WHERE email LIKE '%.edu'; 

-- ORDER BY -- I want the students ordered by their gpa in descending view
SELECT *
FROM students
ORDER BY gpa DESC;

-- LIMIT -- I want to see the first 5 students in the list
SELECT *
FROM students
LIMIT 5;

-- CASE statements -- I want to see the student's class as freshmen, sophomore, junior and senior ordered by grade level
SELECT STUDENT_NAME, GRADE_LEVEL,
	CASE WHEN GRADE_LEVEL = 9 THEN 'Freshmen'
		WHEN GRADE_LEVEL = 10 THEN 'Sophomore'
        WHEN GRADE_LEVEL = 11 THEN 'Junior'
        ELSE 'Senior' END AS STUDENT_CLASS
FROM STUDENTS
ORDER BY GRADE_LEVEL;
