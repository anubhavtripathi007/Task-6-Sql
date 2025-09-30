# Task 6 - SQL Developer Internship

## Objective
Practice writing **subqueries** (scalar, correlated, nested) in SQL to filter and analyze data.

## Key Concepts Practiced
- Scalar subqueries → return a single value
- Subqueries with IN, EXISTS, =
- Correlated subqueries (row-by-row evaluation)
- Derived tables using subquery in FROM
- Nested subqueries

## Files Included
- **queries.sql** → Contains table creation, sample data, and subquery examples.
- **screenshots/** (optional) → Output screenshots from DB Browser / MySQL Workbench.

## Tools Used
- DB Browser for SQLite  
- MySQL Workbench  

## Example Queries
```sql
-- Employees earning above average salary
SELECT emp_name, salary
FROM Employees
WHERE salary > (SELECT AVG(salary) FROM Employees);

-- Correlated subquery: highest salary per department
SELECT emp_name, department, salary
FROM Employees e1
WHERE salary = (
    SELECT MAX(salary) FROM Employees e2
    WHERE e1.department = e2.department
);
```

## Outcome
By completing this task, I learned how to:
- Use subqueries in SELECT, WHERE, and FROM
- Differentiate between scalar and correlated subqueries
- Apply EXISTS for conditional filtering
- Create derived tables from subqueries
