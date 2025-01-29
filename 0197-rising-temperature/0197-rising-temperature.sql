# Write your MySQL query statement below


-- Method 1: Using Datediff and Condition.
-- SELECT 
--     w1.id AS Id
-- FROM
--     weather w1,
--     weather w2
-- WHERE
--     DATEDIFF(w1.recordDate, w2.recordDate) = 1
--         AND w1.temperature > w2.temperature;



-- Method 2: Using Interval an Condition.
SELECT 
    w2.id AS Id
FROM
    weather AS w1
        JOIN
    weather AS w2 ON w2.recorddate = w1.recorddate + INTERVAL + 1 DAY
        AND w2.temperature > w1.temperature;