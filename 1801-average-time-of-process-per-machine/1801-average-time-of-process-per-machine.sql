# Write your MySQL query statement below

-- Method 1: Using Inner Join and Conditions.
SELECT 
    s.machine_id,
    ROUND(AVG(e.timestamp - s.timestamp), 3) AS processing_time
FROM
    Activity s
        JOIN
    Activity e ON s.machine_id = e.machine_id
        AND s.process_id = e.process_id
        AND s.activity_type = 'start'
        AND e.activity_type = 'end'
GROUP BY s.machine_id;


-- Method 2: Using CTE and Inner Join.
with start as (select * from activity where activity_type='start'),
     end as (select * from activity where activity_type='end')

    select s.machine_id,round((sum(e.timestamp-s.timestamp)/count(s.process_id)),3) as processing_time
    from start as s JOIN end as e on s.machine_id=e.machine_id and s.process_id=e.process_id
    group by s.machine_id;
