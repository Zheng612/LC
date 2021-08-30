# Write your MySQL query statement below
select Department, Name as Employee, Salary from (
select E.Id, E.Name,  Salary,  dense_rank() over (partition by E.DepartmentId order by Salary DESC) as r, D.Name as Department
from Employee E join Department D
on E.DepartmentId = D.Id)z
where r<=3
order by Department, Salary DESC, Employee DESC