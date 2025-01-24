# Write your MySQL query statement below

-- Method 1: Using Group By.
-- SELECT 
--     author_id AS id
-- FROM
--     views
-- WHERE
--     author_id = viewer_id
-- GROUP BY 1
-- HAVING COUNT(viewer_id) >= 1
-- ORDER BY 1;


-- -- Method 2: Using Conditions
-- SELECT DISTINCT
--     author_id AS id
-- FROM
--     views
-- WHERE
--     author_id = viewer_id
-- ORDER BY 1;


-- Method 3: Using Windows Function
SELECT DISTINCT author_id AS id
FROM (
    SELECT author_id, COUNT(*) OVER (PARTITION BY author_id) AS self_view_count
    FROM views
    WHERE author_id = viewer_id
) sub
WHERE self_view_count >= 1;

-- SELECT DISTINCT author_id AS id
-- FROM views v1
-- WHERE EXISTS (
--     SELECT 1
--     FROM views v2
--     WHERE v1.author_id = v2.author_id AND v2.author_id = v2.viewer_id
-- ) order by 1;
