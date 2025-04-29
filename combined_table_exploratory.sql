-- 1. combine the menu_items table and order_details table into a single table.
select * from menu_items;
select * from order_details;

select * from order_details od
left join menu_items mi
on od.item_id = mi.menu_item_id;



-- 2. what were the least and most ordered items? what categories were they in?
-- Most ordered items
select item_name, category, count(od.item_id) as num_purchases
from order_details od
left join menu_items mi
on od.item_id = mi.menu_item_id
group by item_name, category
order by num_purchases desc
limit 1;  

-- Least ordered items
select item_name, category, count(od.item_id) as num_purchases
from order_details od
left join menu_items mi
on od.item_id = mi.menu_item_id
group by item_name, category
order by num_purchases asc
limit 2;  




-- 3. what were the top 5 orders that spent the most money?

select order_id, sum(price) as total_spent
from order_details od
left join menu_items mi
on od.item_id = mi.menu_item_id
group by order_id
order by total_spent desc
limit 5;



-- 4. view the details of the highest spent order.
select order_id, sum(mi.price) as total_spent
from order_details od
join menu_items mi on od.item_id = mi.menu_item_id
group by order_id
order by total_spent desc
limit 1;



-- 5. view the details of top 5 highest spent orders.
select od.order_id, sum(mi.price) as total_spent
from order_details od
join menu_items mi on od.item_id = mi.menu_item_id
group by od.order_id
order by total_spent desc
limit 5;