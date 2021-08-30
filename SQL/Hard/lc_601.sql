# Write your MySQL query statement below
with cte as (
select lag(id) over (order by id) as lag_id, id, lead(id) over (order by id) as lead_id, visit_date from (
select id, visit_date, people
from Stadium
where people>=100)z ),

cte2 as (
select lead_id
from cte
where id-lag_id=1 and lead_id-id=1
union all
select lag_id
from cte
where id-lag_id=1 and lead_id-id=1
union all
select id
from cte
where id-lag_id=1 and lead_id-id=1
order by lead_id
)

select distinct lead_id as id, visit_date, people
from cte2 join Stadium S
on cte2.lead_id=S.id