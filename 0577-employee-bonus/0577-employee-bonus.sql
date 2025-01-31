# Write your MySQL query statement below

-- Method 1: Left Join and Condition.
-- SELECT 
--     e.name, b.bonus
-- FROM
--     employee e
--         LEFT JOIN
--     Bonus b USING (empid)
-- WHERE
--     b.bonus < 1000 OR b.bonus IS NULL;


-- -- Method 2:

-- SELECT 
--     Employee.name, Bonus.bonus
-- FROM
--     Employee
--         LEFT JOIN
--     Bonus USING (empId)
-- WHERE
--     IFNULL(Bonus.bonus, 0) < 1000;


-- Method 3: Without using Left Join.

SELECT 
    e.name,
    (SELECT 
            b.bonus
        FROM
            Bonus b
        WHERE
            b.empid = e.empid) AS bonus
FROM
    employee e
WHERE
    NOT EXISTS( SELECT 
            empid
        FROM
            Bonus b
        WHERE
            b.empid = e.empid)
        OR (SELECT 
            b.bonus
        FROM
            Bonus b
        WHERE
            b.empid = e.empid) < 1000;

