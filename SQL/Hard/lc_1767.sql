
with recursive CTE as (
select task_id, subtasks_count
    from tasks
    union all
    select task_id, subtasks_count-1
    from CTE
    where subtasks_count>1
)

select task_id, subtasks_count as subtask_id from cte
where (task_id, subtasks_count) not in (select * from Executed)
order by task_id, subtasks_count ASC