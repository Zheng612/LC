# Write your MySQL query statement below

select min(America) as America,min(Asia) as Asia, min(Europe) as Europe from (
select (case when continent='America' then name end ) as America,
(case when continent='Europe' then name end) as Europe,
(case when continent='Asia' then name end) as Asia,
row_number() over (partition by continent order by name) as R
from student)z
group by R