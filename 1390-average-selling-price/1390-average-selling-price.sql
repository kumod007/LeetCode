# Write your MySQL query statement below. 

-- select product_id, case when average_price is null then 0 else average_price end as average_price from (
-- SELECT p.product_id, round((sum(p.price * u.units)/sum(u.units)),2) as average_price
-- FROM prices AS p LEFT JOIN UnitsSold AS u ON u.product_id = p.product_id 
-- AND u.purchase_date BETWEEN p.start_date AND p.end_date group by p.product_id) as table_1;

SELECT p.product_id, IFNULL(round((sum(p.price * u.units)/sum(u.units)),2),0) as average_price
FROM prices AS p LEFT JOIN UnitsSold AS u ON u.product_id = p.product_id 
AND u.purchase_date BETWEEN p.start_date AND p.end_date group by p.product_id;