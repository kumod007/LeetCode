# Write your MySQL query statement below

-- Method 1: Using Left Join.
-- select unique_id,name from employees as e1 LEFT JOIN EmployeeUNI as e2 on e1.id=e2.id; 


-- Method 2: Using Condistions.

SELECT 
    unique_id,
    (SELECT 
            name
        FROM
            employees
        WHERE
            employees.id = EmployeeUNI.id) AS name
FROM
    employeeuni
WHERE
    employeeuni.id IN (SELECT DISTINCT
            id
        FROM
            employees) 
UNION ALL SELECT 
    NULL, name
FROM
    employees
WHERE
    id NOT IN (SELECT DISTINCT
            id
        FROM
            EmployeeUNI);
