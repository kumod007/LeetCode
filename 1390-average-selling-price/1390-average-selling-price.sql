# Write your MySQL query statement below. 

-- Method 1:
  SELECT 
    product_id,
    CASE
        WHEN average_price IS NULL THEN 0
        ELSE average_price
    END AS average_price
FROM
    (SELECT 
        p.product_id,
            ROUND((SUM(p.price * u.units) / SUM(u.units)), 2) AS average_price
    FROM
        prices AS p
    LEFT JOIN UnitsSold AS u ON u.product_id = p.product_id
        AND u.purchase_date BETWEEN p.start_date AND p.end_date
    GROUP BY p.product_id) AS table_1;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Method 2:
SELECT 
    p.product_id,
    IFNULL(ROUND((SUM(p.price * u.units) / SUM(u.units)),
                    2),
            0) AS average_price
FROM
    prices AS p
        LEFT JOIN
    UnitsSold AS u ON u.product_id = p.product_id
        AND u.purchase_date BETWEEN p.start_date AND p.end_date
GROUP BY p.product_id;
