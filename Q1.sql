-- Ques-1
-- Create the employees table
CREATE TABLE EMPLOYEES (
	EMPLOYEE_ID SERIAL PRIMARY KEY,
	NAME VARCHAR(100),
	DEPARTMENT VARCHAR(50),
	SALARY DECIMAL(10, 2)
);

-- Insert records for three departments
INSERT INTO
	EMPLOYEES (NAME, DEPARTMENT, SALARY)
VALUES
	('John Doe', 'Engineering', 63000),
	('Jane Smith', 'Engineering', 55000),
	('Michael Johnson', 'Engineering', 64000),
	('Emily Davis', 'Marketing', 58000),
	('Chris Brown', 'Marketing', 56000),
	('Emma Wilson', 'Marketing', 59000),
	('Alex Lee', 'Sales', 58000),
	('Sarah Adams', 'Sales', 58000),
	('Ryan Clark', 'Sales', 61000);

SELECT
	*
FROM
	EMPLOYEES;

/*

Write the SQL query to find the second highest salary

*/
-- Solution
-- using window function
SELECT
	*
FROM
	(
		SELECT
			*,
			DENSE_RANK() OVER (
				ORDER BY
					SALARY DESC
			) DRN
		FROM
			EMPLOYEES
	) AS SUBQUERY
WHERE
	DRN = 2;