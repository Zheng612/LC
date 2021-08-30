# Write your MySQL query statement below
with cte as (
select distinct company, round(c,0) c, round(mod(c, 1),0) as m from (
select distinct id, Company, count(Salary) over (partition by Company)/2 as c
from Employee) z
),

cte2 as(
select id, company, salary, row_number() over (partition by Company order by Salary) as r
from Employee),

cte3 as (
select company, c
from cte
union
select company, (case when m=0 then c+1 else c end) as c
from cte)

select Id, Company, Salary from (
select a.Id Id, a.Company Company, salary, a.r
from cte2 a join cte3 b
on a.company=b.company and a.r=b.c) z