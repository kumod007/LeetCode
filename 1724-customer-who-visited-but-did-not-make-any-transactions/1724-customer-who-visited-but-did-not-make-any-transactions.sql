# Write your MySQL query statement below

-- Method 1: Using Left Join.
-- SELECT 
--     customer_id,
--     (COUNT(v.visit_id) - COUNT(transaction_id)) AS count_no_trans
-- FROM
--     visits AS v
--         LEFT JOIN
--     Transactions AS t ON v.visit_id = t.visit_id
-- GROUP BY customer_id
-- HAVING count_no_trans > 0;


-- Method 2: Using Subquery.

SELECT 
    customer_id, COUNT(customer_id) AS count_no_trans
FROM
    visits
WHERE
    visit_id NOT IN (SELECT DISTINCT
            visit_id
        FROM
            transactions)
GROUP BY 1;
