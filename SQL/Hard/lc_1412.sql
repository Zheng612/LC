with cte as (
select student_name, exam_id, E.student_id as student_id, score
from Student S right join Exam E
on S.student_id=E.student_id),

cte2 as (
select student_id, student_name from (
select student_name, exam_id, student_id, score, max(score) over (partition by exam_id) as ma, dense_rank() over (partition by exam_id order by score) as r
from cte) z
where r=1 or score=ma
)

select distinct c.student_id, c.student_name
from cte c 
where c.student_id not in (select student_id from cte2)
order by student_id