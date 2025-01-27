# Write your MySQL query statement below

-- Using Join.
SELECT p.product_name, s.year, s.price
    FROM sales AS s
    JOIN product AS p
    ON p.product_id = s.product_id;
