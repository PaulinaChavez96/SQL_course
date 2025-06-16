-- Connect to database (MySQL)
USE maven_advanced_sql;

-- 1. Basic joins
SELECT * FROM happiness_scores;
SELECT * FROM country_stats;

SELECT hs.year, hs.country, hs.happiness_score,
		cs.continent
FROM happiness_scores hs
		INNER JOIN country_stats cs
        ON hs.country = cs.country;


-- 2. Join types
SELECT hs.year, hs.country, hs.happiness_score,
		cs.country, cs.continent
FROM happiness_scores hs
		INNER JOIN country_stats cs
        ON hs.country = cs.country;

SELECT hs.year, hs.country, hs.happiness_score,
		cs.country, cs.continent
FROM happiness_scores hs
		LEFT JOIN country_stats cs
        ON hs.country = cs.country
WHERE cs.country IS NULL;        

SELECT hs.year, hs.country, hs.happiness_score,
		cs.country, cs.continent
FROM happiness_scores hs
		RIGHT JOIN country_stats cs
        ON hs.country = cs.country
WHERE hs.country IS NULL;

SELECT DISTINCT hs.country
FROM happiness_scores hs
		LEFT JOIN country_stats cs
        ON hs.country = cs.country
WHERE cs.country IS NULL;        

SELECT DISTINCT cs.country
FROM happiness_scores hs
		RIGHT JOIN country_stats cs
        ON hs.country = cs.country
WHERE hs.country IS NULL;


-- 3. Joining on multiple columns
SELECT * FROM happiness_scores;
SELECT * FROM inflation_rates;

SELECT 
    hs.year, hs.country, hs.happiness_score, ir.inflation_rate
FROM
    happiness_scores hs
        INNER JOIN
    inflation_rates ir ON hs.year = ir.year
        AND hs.country = ir.country_name;
        

-- 4. Joining multiple tables
SELECT * FROM happiness_scores;
SELECT * FROM country_stats;
SELECT * FROM inflation_rates;

SELECT 
    hs.year,
    hs.country,
    hs.happiness_score,
    cs.continent,
    ir.inflation_rate
FROM
    happiness_scores hs
        LEFT JOIN
    country_stats cs ON hs.country = cs.country
        LEFT JOIN
    inflation_rates ir ON hs.year = ir.year
        AND hs.country = ir.country_name;

-- 5. Self joins
CREATE TABLE IF NOT EXISTS employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    salary INT,
    manager_id INT
);

INSERT INTO employees (employee_id, employee_name, salary, manager_id) VALUES
	(1, 'Ava', 85000, NULL),
	(2, 'Bob', 72000, 1),
	(3, 'Cat', 59000, 1),
	(4, 'Dan', 85000, 2);
    
SELECT * FROM employees;

-- Employees with the same salary
SELECT e1.employee_id, e1.employee_name, e1.salary,
		e2.employee_id, e2.employee_name, e2.salary
FROM
	employees e1
    INNER JOIN 
    employees e2 ON e1.salary = e2.salary
WHERE 
e1.employee_id > e2.employee_id;
    

-- Employees that have a greater salary
SELECT e1.employee_id, e1.employee_name, e1.salary,
		e2.employee_id, e2.employee_name, e2.salary
FROM
	employees e1
    INNER JOIN 
    employees e2 ON e1.salary > e2.salary
ORDER BY e1.employee_id;

-- Employees and their managers
SELECT 
    e1.employee_id,
    e1.employee_name,
    e1.manager_id,
    e2.employee_name AS manager_name
FROM
    employees e1
        LEFT JOIN
    employees e2 ON e1.manager_id = e2.employee_id;
    
-- 6. Cross joins


-- View the tables


-- Cross join the tables


-- From the self join assignment:
-- Which products are within 25 cents of each other in terms of unit price?


-- Rewritten with a CROSS JOIN


-- 7. Union vs union all


-- Union


-- Union all


-- Union with different column names

