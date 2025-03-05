# Write your MySQL query statement below

select a.employee_id,a.name,
    count(b.employee_id) as reports_count, round(avg(b.age)) as average_age  
    from employees as a JOIN employees as b on b.reports_to=a.employee_id
    group by a.employee_id,a.name order by a.employee_id;