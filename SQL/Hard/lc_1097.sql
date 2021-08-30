# Write your MySQL query statement below
with cte as (
select player_id, event_date, min(event_date) over (partition by player_id order by event_date) as m, lead(event_date) over (partition by player_id) as l
from Activity
),

cte2 as (
select m, count(player_id) over (partition by m) as r from (
select distinct player_id, m
from cte) z
),

cte3 as (
select player_id, event_date, count(player_id) over (partition by event_date) as retention from (
select player_id, event_date, l-m as g
from cte
having g=1)k
)

select distinct install_dt, installs, Day1_retention from (
select a.m as install_dt, r as installs, round(ifnull(retention/r,0),2) as Day1_retention
from cte2 a left join cte3 b
on a.m=b.event_date) h