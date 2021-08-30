with cte as (
select date('2018-01-01') start_date, date('2018-12-31') end_date
union
select date('2019-01-01') start_date, date('2019-12-31') end_date
union
select date('2020-01-01') start_date, date('2020-12-31') end_date
),

cte2 as (
select product_id, cast(year(cte.start_date) as char) as report_year,
(case 
when period_start>=start_date and period_end<=end_date then datediff(period_end, period_start)+1
when period_start>=start_date and period_end>=end_date then datediff(end_date, period_start)+1
when period_start<=start_date and period_end>=end_date then datediff(end_date, start_date)+1
when period_start<=start_date and period_end<=end_date then datediff(period_end, start_date)+1
end) as days
from Sales cross join cte
)


select c.product_id as product_id, product_name, report_year, sum(days* average_daily_sales) over (partition by product_id, report_year) as total_amount
from cte2 c join product P
on c.product_id=p.product_id
join Sales S on c.product_id=S.product_id
where days>0
group by c.product_id, report_year
order by product_id, report_year