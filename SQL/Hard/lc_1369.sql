with cte as(
select username, activity, startDate, endDate from (
select username, activity, startDate, endDate, count(*) over (partition by username) as n
FROM UserActivity) z
where n=1
)

select USERNAME, ACTIVITY, STARTDATE, ENDDATE from (
select username as USERNAME, activity as ACTIVITY, startDate as STARTDATE, endDate as ENDDATE, rank() over (partition by username order by startDate DESC) as r
from UserActivity) d
where r=2
union select * from cte