# Write your MySQL query statement below
select teacher_id,count(cnt_1) as cnt from(
select teacher_id,count(dept_id) as cnt_1 from teacher group by 1,subject_id) as table_1
group by 1;