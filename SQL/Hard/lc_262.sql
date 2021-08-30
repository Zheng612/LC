with cte1 as (
select T.Id, Client_id, Driver_Id, City_Id, Status, Request_at, Banned
from Trips T join Users U
on T.Client_Id=U.Users_Id
),

cte2 as (
select T.Id, Client_id, Driver_Id, City_Id, Status, Request_at, Banned
from Trips T join Users U
on T.Driver_Id=U.Users_Id
),

cte3 as (
select * from (
select cte1.Id, cte1.Client_id, cte1.Driver_Id, cte1.Status, cte1.Request_at, cte1.Banned as Client_banned, cte2.Banned as Driver_banned
from cte1 join cte2 on cte1.id=cte2.id
) x
where Client_banned='No' and Driver_banned='No'
),

cte4 as (
select distinct Request_at, count(Id) over (partition by Request_at) as tot
from cte3
),

cte5 as (
select distinct Request_at, count(Id) over(partition by Request_at) as cancelled from (
select Id, Status, Request_at
from cte3
where Status='cancelled_by_driver' or Status='cancelled_by_client')z
)

select Request_at Day, round(cancelled/tot,2) as 'Cancellation Rate' from ( 
select cte4.Request_at, ifnull(cancelled, 0) as cancelled, tot
from cte4 left join cte5
on cte4.Request_at=cte5.Request_at)z
where Request_at between '2013-10-01' and '2013-10-03'