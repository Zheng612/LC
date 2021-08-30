
with recursive cte(month) as(
select 1
    union all
    select month+1
    from cte
    where month<12
),

cte2 as (
select distinct m, count(ride_id) over (partition by m) as accepted_rides
from (
select A.ride_id, month(requested_at) as m
from Rides R join AcceptedRides A
on A.ride_id=R.ride_id
where year(requested_at)='2020') z
order by m),

cte3 as (
select month(join_date) as driver_month, count(driver_id) over (partition by driver_id) as n_driver
from (select * from Drivers where join_date<'2021-01-01' and join_date>'2019-12-31')z 
union all
(select 1 as driver_month, count(driver_id) as nu
from Drivers 
where join_date<'2020-01-01')
order by driver_month
),

cte4 as (
select distinct month as driver_month, sum(n_driver) over (order by month) as n from(
select month, ifnull(n_driver,0) as n_driver
from cte left join cte3
on cte.month=cte3.driver_month)z)

select driver_month as month, n as active_drivers, ifnull(accepted_rides,0) as accepted_rides
from cte4 left join cte2 
on cte4.driver_month=cte2.m