## Key Concepts Practiced
- Scalar subqueries → return a single value
- Subqueries with IN, EXISTS, =
- Correlated subqueries (row-by-row evaluation)
- Derived tables using subquery in FROM
- Nested subqueries

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

