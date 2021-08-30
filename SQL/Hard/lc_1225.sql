with cte1 as (
select 'start' as state, a_s as start_date, row_number() over( order by a_s) as r1 from (
select a.success_date as a_s, datediff(a.success_date, lag(a.success_date) over ()) as x
from (select * from Succeeded where year(success_date)='2019' order by success_date) a
) z
where x!=1 or x is null
order by start_date),

cte2 as (
(select 'end' as state, b_s as end_date, row_number() over (order by b_s) as r2 from (
select b.success_date as b_s, datediff(b.success_date, lead(b.success_date) over ()) as y
from (select * from Succeeded where year(success_date)='2019' order by success_date) b
) z
where y!=-1 or y is null
order by end_date
)),

cte3 as (
select 'start' as state, a_s as start_date, row_number() over( order by a_s) as r1 from (
select a.fail_date as a_s, datediff(a.fail_date, lag(a.fail_date) over ()) as x
from (select * from Failed where year(fail_date)='2019' order by fail_date) a
) z
where x!=1 or x is null
order by start_date),

cte4 as (
(select 'end' as state, b_s as end_date, row_number() over (order by b_s) as r2 from (
select b.fail_date as b_s, datediff(b.fail_date, lead(b.fail_date) over ()) as y
from (select * from Failed where year(fail_date)='2019' order by fail_date) b
) z
where y!=-1 or y is null
order by end_date
))

select * from (
select 'succeeded' as period_state, a.start_date, b.end_date
from cte1 a join cte2 b
on a.r1=b.r2
union
select 'failed' as period_state, c.start_date, d.end_date
from cte3 c join cte4 d
on c.r1=d.r2) v
order by start_date