with cte as (
select distinct day, item_category, ifnull(sum(quantity) over (partition by item_category, day) ,0)as t from (
select order_id, customer_id, dayofweek(order_date) as day, O.item_id as z, quantity, I.item_id as x, item_name, item_category
from Orders O right join Items I
ON O.item_id=I.item_id) a
)
, 
cte2 as (
select item_category as Category, 
    sum(if(day=2, t, 0)) as Monday, 
    sum(if(day=3, t, 0)) as Tuesday, 
    sum(if(day=4, t, 0)) as Wednesday, 
    sum(if(day=5, t, 0)) as Thursday, 
    sum(if(day=6, t, 0)) as Friday, 
    sum(if(day=7, t, 0)) as Saturday, 
    sum(if(day=1, t, 0)) as Sunday
FROM cte
group by item_category)

select * from cte2