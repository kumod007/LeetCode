# Write your MySQL query statement below

with table_1 as (select distinct salary from employee order by salary desc)
 
    select 
        case
            when count(*)>1 then (select salary from table_1 limit 1,1) 
            ELSE NULL END as SecondHighestSalary
    from table_1;
