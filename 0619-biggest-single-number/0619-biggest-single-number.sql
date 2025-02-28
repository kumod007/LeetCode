# Write your MySQL query statement below


WITH
  UniqueNumbers AS (
    SELECT num
    FROM MyNumbers
    GROUP BY 1
    HAVING COUNT(num) = 1
  )
SELECT MAX(num) AS num
FROM UniqueNumbers;


-- SELECT COALESCE(num, NULL) AS num FROM (SELECT num FROM mynumbers GROUP BY num 
--     HAVING COUNT(*) = 1 ORDER BY num DESC LIMIT 1) AS table_1
-- UNION ALL
-- SELECT NULL LIMIT 1;
