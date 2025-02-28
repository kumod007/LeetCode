# Write your MySQL query statement below

SELECT COALESCE(num, NULL) AS num 
FROM (
    SELECT num 
    FROM mynumbers 
    GROUP BY num 
    HAVING COUNT(*) = 1 
    ORDER BY num DESC 
    LIMIT 1
) AS table_1
UNION ALL
SELECT NULL
LIMIT 1;
