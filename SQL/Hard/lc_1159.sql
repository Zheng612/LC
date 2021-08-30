# Write your MySQL query statement below
with cte1 as(
select order_id, order_date, O.item_id, seller_id, item_brand
from Orders O join Items I 
on O.item_id=I.item_id),

cte2 as (
select order_id, order_date, item_brand, seller_id from (
select order_id, order_date, item_brand, item_id, seller_id, rank() over (partition by seller_id order by order_date) as r
from cte1)z
where r=2)

select seller_id, case when favorite_brand=item_brand then 'yes' else 'no' end as 2nd_item_fav_brand from (
select U.user_id as seller_id, favorite_brand, item_brand
from Users U left join cte2 B
on U.user_id=B.seller_id) n