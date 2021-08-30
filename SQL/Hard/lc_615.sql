# Write your MySQL query statement below
with cte as (
select m, round(avg(amount),0) as company_avg from (
select employee_id, amount, DATE_FORMAT(pay_date,"%Y-%m") as m
from Salary) z
group by m
),

cte2 as (
select distinct mo, department_id, round(avg(amount) over (partition by mo, department_id),0) as department_avg from (
select S.employee_id, amount, DATE_FORMAT(pay_date,"%Y-%m") as mo, department_id
from Salary S join Employee E
on S.employee_id=E.employee_id
)z
)

select mo as pay_month, department_id, case when department_avg<company_avg then 'lower' when department_avg=company_avg then 'same' else 'higher' end as comparison from (
select mo, department_id, company_avg, department_avg
from cte2 left join cte 
on cte2.mo=cte.m
    )a
order by pay_month desc, department_id