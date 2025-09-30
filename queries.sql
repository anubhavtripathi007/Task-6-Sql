-- Task 6: SQL Developer Internship
-- Subqueries and Nested Queries

-- Sample tables
CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(10,2)
);

CREATE TABLE Departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

-- Insert sample data
INSERT INTO Employees VALUES (1, 'Alice', 'HR', 40000);
INSERT INTO Employees VALUES (2, 'Bob', 'Finance', 55000);
INSERT INTO Employees VALUES (3, 'Charlie', 'IT', 70000);
INSERT INTO Employees VALUES (4, 'David', 'Finance', 45000);
INSERT INTO Employees VALUES (5, 'Eve', 'IT', 80000);

INSERT INTO Departments VALUES (1, 'HR');
INSERT INTO Departments VALUES (2, 'Finance');
INSERT INTO Departments VALUES (3, 'IT');

-- 1. Scalar subquery (single value)
SELECT emp_name, salary
FROM Employees
WHERE salary > (SELECT AVG(salary) FROM Employees);

-- 2. Subquery with IN
SELECT emp_name, department
FROM Employees
WHERE department IN (SELECT dept_name FROM Departments);

-- 3. Subquery with EXISTS
SELECT emp_name, department
FROM Employees e
WHERE EXISTS (SELECT 1 FROM Departments d WHERE d.dept_name = e.department);

-- 4. Correlated subquery (highest salary per department)
SELECT emp_name, department, salary
FROM Employees e1
WHERE salary = (
    SELECT MAX(salary) FROM Employees e2
    WHERE e1.department = e2.department
);

-- 5. Subquery in FROM clause (derived table)
SELECT department, AVG(salary) AS avg_salary
FROM (
    SELECT department, salary FROM Employees
) AS dept_salaries
GROUP BY department;

-- 6. Subquery with =
SELECT emp_name, salary
FROM Employees
WHERE salary = (SELECT MAX(salary) FROM Employees);

-- 7. Nested subquery (employees earning more than min salary of IT dept)
SELECT emp_name, salary
FROM Employees
WHERE salary > (
    SELECT MIN(salary) FROM Employees WHERE department = 'IT'
);
