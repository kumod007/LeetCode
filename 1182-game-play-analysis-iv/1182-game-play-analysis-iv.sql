# Write your MySQL query statement below

select round(sum(case when (datediff(a.event_date,b.first_event_date))=1 then 1 else 0 end)/
          (select count(distinct player_id) from activity),2) as fraction from 
(select player_id,min(event_date) as first_event_date from activity group by player_id) as b JOIN activity as a on a.player_id=b.player_id;
