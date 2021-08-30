# Write your MySQL query statement below
with cte as(
select distinct player, sum(score) over (partition by player) as tot
from (
select first_player as player, first_score as score
from Matches
union all
select second_player as player, second_score as score
from Matches)z
)

select distinct group_id, min(player_id) over (partition by group_id) as player_id from (
select group_id, player_id, rank() over (partition by group_id order by tot DESC) as r from (
select player_id, group_id, tot
from cte c left join Players P
on c.player=P.player_id)x)v
where r=1