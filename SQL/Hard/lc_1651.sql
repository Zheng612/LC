# Write your MySQL query statement below
with recursive cte (month) as (
select 1
    union all
    select month+1
    from cte
    where month<12
)
,
cte2 as(
select R.ride_id, month(requested_at) as m, ride_distance, ride_duration
from Rides R join AcceptedRides A
ON R.ride_id=A.ride_id
where requested_at>='2020-01-01' and requested_at<='2020-12-31'),

cte3 as (
select r.month as month, ifnull(sum(ride_distance),0) as ride_distance, ifnull(sum(ride_duration),0) as ride_duration
from cte r left outer join cte2 c
ON r.month=c.m
group by month)

select month, round(avg(ride_distance) over (order by month rows between current row and 2 following),2) as average_ride_distance, round(avg(ride_duration) over (order by month rows between current row and 2 following),2) as average_ride_duration
from cte3
limit 10
