with recursive cte1 (n) as (
select 1
union all
select n+1
from cte1
where n<200
),

cte2 as (
select distinct user_id, transaction_date, count(amount) over (partition by user_id, transaction_date) as n_transactions
from Transactions
),
cte3 as (
select n_transactions, count(user_id) as visits_counts
from cte2
group by n_transactions),

cte4 as (
select 0 as "transactions_count", count(*) as visits_count from (
select T.user_id
from Visits V left join Transactions T
on V.user_id=T.user_id
and V.visit_date=T.transaction_date
where T.user_id is null)z)


select n as transactions_count, ifnull(visits_counts,0) as visits_count
from cte1 left join cte3
on cte1.n=cte3.n_transactions
where n<=(select max(n_transactions) as x from cte3)
union all
select * from cte4
order by transactions_count