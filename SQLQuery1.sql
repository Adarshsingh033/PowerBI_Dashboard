select * from pizza_sales 

select SUM(total_price) AS Total_revenue from pizza_sales 

select SUM(total_price)/ COUNT(distinct order_id)    AS Average_Order_Value from pizza_sales

select SUM(quantity) AS Toatal_Pizzas_Sold from pizza_sales


select count (distinct order_id) AS Total_orders from pizza_sales

select cast(cast(sum(quantity) AS decimal(10,2))/ 
cast(count(distinct order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2)) 
AS Average_Pizzas_per_order from pizza_sales


select DATENAME(DW,order_date) AS order_Day , COUNT(distinct order_id) AS Total_order 
from pizza_sales
group BY DATENAME(DW,order_date)

select DATENAME(M,order_date) AS order_months , COUNT(distinct order_id) AS Total_order 
from pizza_sales
group BY DATENAME(M,order_date)
order by total_order desc

select pizza_category , SUM(total_price)*100 / 
(select SUM(total_price) from pizza_sales) AS PEC_Sales
from pizza_sales
group by pizza_category

select pizza_size ,sum(total_price)*100/
(select sum(total_price) from pizza_sales) AS per_size_sales
from pizza_sales
group by pizza_size
order by  per_size_sales desc

select pizza_category , sum(quantity) AS Total_Sales
from pizza_sales
group by pizza_category
order  by Total_Sales desc

select TOP 5 pizza_name, count(distinct order_id ) AS Top5_sallers
from pizza_sales
group by pizza_name
order  by Top5_sallers desc

select  TOP 5 pizza_name, count(distinct order_id) AS Bottom5_sallers
from pizza_sales
group by pizza_name
order  by Bottom5_sallers asc