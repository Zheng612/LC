# Write your MySQL query statement below

with cte as (
select round(sum(Frequency)/2,2) as median from Numbers
),

cte2 as (
select Number, Frequency, row_number() over () as r_n, tot, case when median > tot then 'yes' when median=tot then 'equal' else 'no' end as bd from (
select Number, Frequency, sum(Frequency) over (order by Number) as tot
from Numbers) z, cte
)

select case when bd='no' then 2*Number/2 else abs((Number-1)/2) end as 'median'
from (
select Number, Frequency, r_n, tot, bd
from cte2
where bd='no' or bd='equal'
order by r_n ASC limit 1
)z
