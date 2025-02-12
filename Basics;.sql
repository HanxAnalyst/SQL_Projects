USE [Maven];

/*
The big 6 clauses
SELECT FROM WHERE GROUP BY HAVING ORDER BY
this is the default order you must always follow
*/

/*
SELECT = Columns to pick
FROM = Tables or non table or others e.g subquery etc
WHERE = Row criterea
ORDER BY = Sort end columns
*/

/*
Aggregated queries

SELECT SUM/AVG
FROM
WHERE
GROUP by Aggregation of Rows criterea
HAVING by Filter Agg rows
ORDER by end sorts
*/

/*
-- This gave use the grade levels as it removed the repeating ones
SELECT
    DISTINCT(grade_level)
FROM
    [dbo].[students];

-- This gave us the agg of the grade levels
SELECT
    COUNT(
        DISTINCT(grade_level)
    )
FROM
    [dbo].[students];

SELECT
	MAX(gpa) - MIN(gpa) AS 'gpa_range'
FROM
	students;
*/

-- Comparison clause : AND,OR, IN, LIKE found in WHERE clause
-- Sort : DESC, ASC in Order by

-- LIMIT in  Postgres, TOP in SMSS which comes in SELECT
/*
SELECT
	TOP 10
	*
FROM
	students;
*/

-- CASE Statements =else if in sql

-- the demo file, not heading the comments

/*
SELECT
	*
FROM
	students;
*/

-- the big 6

/*
SELECT
	grade_level,
	AVG(gpa)	AS 'Average GPA'
FROM
	students
WHERE
	school_lunch = 'Yes'
GROUP BY
	grade_level
HAVING
	AVG(gpa) > 3		--for having, do not use alias
ORDER BY
	grade_level DESC;
*/

-- keywords/functions

/*
SELECT
	COUNT(
		DISTINCT(grade_level)
	)
FROM
	students
*/

-- Range of GPAs
/*
SELECT
	(
		MAX(gpa) - MIN(gpa)
	)
	AS 'GPA Range'
FROM
	students;
*/

-- AND
/*
SELECT
	*
FROM
	students
WHERE
	grade_level < 12
	AND
	gpa > 3.0;
*/

-- IN
/*
SELECT
	*
FROM
	students
WHERE
	grade_level IN (10,11,12)
	AND
	gpa > 3.0;
*/

-- IS NULL
/*
SELECT
	*
FROM
	students
WHERE
	email IS NOT NULL;
*/


-- LIKE

/*
SELECT
	*
FROM
	students
WHERE
	email LIKE '%.edu';
*/

-- ORDER BY
/*
SELECT
	*
FROM
	students
ORDER BY
	gpa
	DESC;
*/

-- LIMIT (TOP IS THE DEFAULT IN SMSS)
/*
SELECT
	TOP 10
	*
FROM
	students
ORDER BY
	gpa
	DESC;
*/

-- CASE STATEMENTS

SELECT
	student_name,
	grade_level,
	
	--START CASE STATEMENT
	
	CASE
		WHEN grade_level = 9 THEN 'FRESHMAN'
		WHEN grade_level = 10 THEN 'SOPHOMORE'
		WHEN grade_level = 11 THEN 'JUNIOR'
		WHEN grade_level = 12 THEN 'SENIOR'
	ELSE
		'OTHER'
	END
	AS	'Student Class'
FROM
	students
ORDER BY
	grade_level DESC;
