with cte as(
select distinct spend_date, user_id, count(platform) over (partition by user_id, spend_date) n_platform, platform, amount
from Spending),
cte2 as (
select spend_date, 'mobile' as platform
from Spending
union
select spend_date, 'desktop' as platform
from Spending
union
select spend_date, 'both' as platform
from Spending),

cte3 as(
select spend_date, 'both' as platform, sum(amount) as total_amount, count(distinct user_id) as total_users
from cte
where n_platform=2
group by spend_date
union all
select spend_date, 'mobile' as platform, sum(amount) as total_amount, count(distinct user_id) as total_users
from cte
where n_platform=1 and platform='mobile'
group by spend_date
union all
select spend_date, 'desktop' as platform, sum(amount) as total_amount, count(distinct user_id) as total_users
from cte
where n_platform=1 and platform='desktop'
group by spend_date)

select cte2.spend_date, cte2.platform, ifnull(total_amount,0) as total_amount, ifnull(total_users, 0) as total_users
from cte2 left join cte3
on cte2.spend_date=cte3.spend_date
and cte2.platform=cte3.platform