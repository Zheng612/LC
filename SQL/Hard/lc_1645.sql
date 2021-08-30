with recursive cte(n) as(
select 1
union all
select n+1
from cte
where n<12
),

cte2 as(
select driver_id, case when join_date<'2020-01-01' then 1 else month(join_date) end as driver_month
from Drivers
where join_date<='2020-12-31'
),

cte3 as (
select distinct m, ifnull(sum(active_drivers) over (order by m),0) as active_drivers from (
select distinct n as m, count(driver_id) over (partition by n) as active_drivers
from cte c left join cte2 
on c.n=cte2.driver_month
where n < '2021-01-01') x
),
cte4 as (
select n as m, ifnull(drivers,0) as drivers from (
select distinct requested_month, count(distinct driver_id) as drivers from (
select A.ride_id, month(requested_at) as requested_month, driver_id
from AcceptedRides A join Rides R
on A.ride_id=R.ride_id
where year(requested_at)='2020')z
group by requested_month) a right join cte
on a.requested_month=cte.n
)
# select * from cte4

select distinct cte4.m as month, ifnull(round(drivers*100/active_drivers,2),0) as working_percentage
from cte3 join cte4
on cte3.m=cte4.m
order by month
