

with cte as (
select Id, Month, Salary from (
select Id, Month, Salary, max(Month) over (partition by Id) as recent_month
from Employee) z
where Month<recent_month
)

select Id, Month, sum(Salary) over (partition by Id order by Month rows between 2 preceding and current row) as Salary
from cte
order by Id, Month DESC
