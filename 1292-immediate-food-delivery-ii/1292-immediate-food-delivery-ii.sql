# Write your MySQL query statement below

select round((sum(case when min_order=min_pref_date then 1 else 0 end)*100)/(count(*)),2)
     as immediate_percentage from ( 
     select customer_id,min(order_date) as min_order,min(customer_pref_delivery_date) as    min_pref_date from delivery group by customer_id) as table_1;