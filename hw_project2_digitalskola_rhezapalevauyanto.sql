//Notes homework yang perlu disertakan dalam Project 2:
//Dashboard:
//1. Gross revenue daily (line chart)
//2. Top 10 sold item category (bar chart)
//3. Top 10 sold item brands (bar chart)

//1. Gross revenue daily (line chart)
with grd as(
select order_id,sum((1-discount)*unit_price*quantity) as Gross_Revenue_Daily 
from order_details
group by 1)
select o.order_date, g.order_id, g.gross_revenue_daily from grd as g left join orders as o
on g.order_id = o.order_id
order by 1;

//2. Top 10 sold item category (bar chart)
//3. Top 10 sold item brands (bar chart)
// based on sale
with grd as(
select product_id, sum((1-discount)*unit_price*quantity) as Gross_Revenue_Daily 
from order_details
group by 1)
select g.product_id, p.category_id, g.gross_revenue_daily, p.product_name, c.category_name
from grd as g left join products as p on g.product_id = p.product_id
              left join categories as c on p.category_id = c.category_id
order by 3
limit 10;

//based on quantity
with grd as(
select product_id, sum(quantity) as quantity
from order_details
group by 1)
select g.product_id, p.category_id, g.quantity, p.product_name, c.category_name
from grd as g left join products as p on g.product_id = p.product_id
              left join categories as c on p.category_id = c.category_id
order by 3
limit 10;

select * from products
select * from order_details
select * from categories