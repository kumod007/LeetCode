# Write your MySQL query statement below

SELECT 
    CONCAT(YEAR(trans_date),'-', case when length(month(trans_date))=1 then 
    concat('0',MONTH(trans_date)) else month(trans_date) end) AS month, Country,
    count(id) as trans_count,
    sum(case when state='Approved' then 1 else 0 end) as approved_count,
    sum(amount) as trans_total_amount,
    sum(case when state='Approved' then amount else 0 end) as approved_total_amount 
    FROM Transactions group by month,country;