# 1. Create a database named employee, then import data_science_team.csv proj_table.csv 
# and emp_record_table.csv into the employee database from the given resources.

CREATE DATABASE Employee;
USE Employee;

# Create an ER diagram for the given employee database : Completed

# 3. Write a query to fetch EMP_ID, FIRST_NAME, LAST_NAME, GENDER, and DEPARTMENT from the 
# employee record table, and make a list of employees and details of their department.

SELECT 
	EMP_ID,
    FIRST_NAME,
    LAST_NAME,
    GENDER,
    DEPT
FROM emp_record_table;

# 4. Write a query to fetch EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPARTMENT, and EMP_RATING if the EMP_RATING is:
# ● less than two

SELECT EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPT, EMP_RATING
FROM emp_record_table
WHERE EMP_RATING <2;

# ● greater than four

SELECT EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPT, EMP_RATING
FROM emp_record_table
WHERE EMP_RATING > 4;

# ● between two and four

SELECT EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPT, EMP_RATING
FROM emp_record_table
WHERE EMP_RATING BETWEEN 2 AND 4;

# 5. Write a query to concatenate the FIRST_NAME and the LAST_NAME of employees in the Finance 
# department from the employee table and then give the resultant column alias as NAME.

SELECT concat(FIRST_NAME, ' ', LAST_NAME) AS NAME
FROM emp_record_table
WHERE DEPT = 'FINANCE';

# 6 (A). Write a SQL query to retrieve the employee ID, first name, role, and department of employees 
# who hold leadership positions (Manager, President, or CEO).

SELECT 
	EMP_ID,
    FIRST_NAME,
    ROLE,
    DEPT
FROM emp_record_table
WHERE ROLE IN ('MANAGER', 'PRESIDENT', 'CEO');

# 6 (B). Write a query to list only those employee who have someone reporting to them. Also, show the number
# of reporters (including the Presedent).

SELECT
	m.EMP_ID,
    m.FIRST_NAME AS Manager_Name,
    m.ROLE,
    COUNT(e.EMP_ID) AS No_of_Reporters
FROM emp_record_table m
JOIN emp_record_table e
ON m.EMP_ID = e.MANAGER_ID
GROUP BY 
	m.EMP_ID,
    m.FIRST_NAME,
    m.ROLE
ORDER BY No_of_Reporters DESC;


# 7. Write a query to list all the employees from the healthcare and finance departments using the union. 
# Take data from the employee record table.

SELECT * FROM emp_record_table
WHERE DEPT = 'HEALTHCARE'

UNION

SELECT * FROM emp_record_table
WHERE DEPT = 'FINANCE';

# 8. Write a query to list employee details such as EMP_ID, FIRST_NAME, LAST_NAME, ROLE, DEPARTMENT, and EMP_RATING 
# grouped by dept. Also include the respective employee rating along with the max emp rating for the department.

SELECT 
	EMP_ID,  
    FIRST_NAME, 
    LAST_NAME, 
    ROLE, 
    DEPT, 
    EMP_RATING,
    MAX(EMP_RATING) OVER (PARTITION BY DEPT) AS MAX_EMP_RATING
FROM emp_record_table;

# 9. Write a query to calculate the minimum and the maximum salary of the employees in each role. 
# Take data from the employee record table.

SELECT
	ROLE,
    MIN(SALARY) AS MIN_SALARY,
    MAX(SALARY) AS MAX_SALARY
FROM emp_record_table
GROUP BY ROLE;

# 10. Write a query to assign ranks to each employee based on their experience. Take data from the employee record table.

SELECT 
	EMP_ID,
    FIRST_NAME,
    LAST_NAME,
    EXP,
    RANK() OVER (ORDER BY EXP DESC) AS EMP_RANK
FROM emp_record_table;

# 11. Write a query to create a view that displays employees in various countries whose salary is more than 6000. 
# Take data from the employee record table.

CREATE VIEW employee_salary_view AS
SELECT
	EMP_ID,
    FIRST_NAME,
    LAST_NAME,
    COUNTRY,
    SALARY
FROM emp_record_table
WHERE SALARY > 6000;

SELECT * FROM employee_salary_view;

# 12. Write a nested query to find employees with experience of more than ten years. 
# Take data from the employee record table.

SELECT * FROM emp_record_table
WHERE EMP_ID IN (
	SELECT EMP_ID
    FROM emp_record_table
	WHERE EXP > 10);

# 13. Write a query using stored functions in the project table to check whether the job profile assigned to each 
# employee in the data science team matches the organization’s set standard.
# The standard being:
# For an employee with experience less than or equal to 2 years assign 'JUNIOR DATA SCIENTIST',
# For an employee with the experience of 2 to 5 years assign 'ASSOCIATE DATA SCIENTIST',
# For an employee with the experience of 5 to 10 years assign 'SENIOR DATA SCIENTIST',
# For an employee with the experience of 10 to 12 years assign 'LEAD DATA SCIENTIST',
# For an employee with the experience of 12 to 16 years assign 'MANAGER'.

USE `employee`;
DROP function IF EXISTS `job_profile`;

DELIMITER $$
USE `employee`$$
CREATE FUNCTION job_profile (exp_years int)
RETURNS VARCHAR (100)
DETERMINISTIC
BEGIN
	DECLARE job VARCHAR (100);
    
IF exp_years <= 2 THEN 
	SET job = 'JUNIOR DATA SCIENTIST';

ELSEIF exp_years <= 5 THEN 
	SET job = 'ASSOCIATE DATA SCIENTIST';
    
ELSEIF exp_years <= 10 THEN 
	SET job = 'SENIOR DATA SCIENTIST';
    
ELSEIF exp_years <= 12 THEN 
	SET job = 'LEAD DATA SCIENTIST';

ELSEIF exp_years <= 16 THEN 
	SET job = 'MANAGER';
    
    ELSE SET job = 'UNKNOWN';
    
    END IF;

RETURN job;
END$$

DELIMITER ;


SELECT EMP_ID,
		FIRST_NAME,
        LAST_NAME,
        ROLE,
        EXP,
job_profile (EXP) AS STANDARD_ROLE,
CASE
	WHEN ROLE = job_profile (EXP)
THEN 'MATCH'
	END AS STATUS
FROM data_science_team;

# 14. Create an index to improve the cost and performance of the query to find the employee whose 
# FIRST_NAME is ‘Eric’ in the employee table after checking the execution plan.

SELECT * FROM emp_record_table
WHERE FIRST_NAME = 'Eric';


CREATE INDEX idx_first_name
ON emp_record_table (FIRST_NAME(50));

SELECT * FROM emp_record_table
WHERE FIRST_NAME = 'Eric';


# 15. Write a query to calculate the bonus for all the employees, based on their ratings and salaries 
# (Use the formula: 5% of salary * employee rating).

SELECT
	EMP_ID,
	FIRST_NAME,
	SALARY,
	EMP_RATING,
	(SALARY * 0.05 * EMP_RATING) AS
BONUS
FROM emp_record_table;

# 16. Write a query to calculate the average salary distribution based on the continent and country. 
# Take data from the employee record table.

SELECT
	CONTINENT,
    COUNTRY,
    AVG(SALARY) AS AVERAGE_SALARY
FROM emp_record_table
GROUP BY CONTINENT, COUNTRY;

















