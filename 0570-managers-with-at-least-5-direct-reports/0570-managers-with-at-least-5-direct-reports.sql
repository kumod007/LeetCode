# Write your MySQL query statement below.

select name from employee where id in (
    select id from (
    select e1.id,count(e2.managerId)as report from employee as e1
    LEFT JOIN employee as e2 on e1.id=e2.managerid group by e1.id having report>=5) as z);