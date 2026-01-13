SELECT * FROM pizza_sales;

SELECT ROUND(SUM(total_price), 2) AS Total_Revenue
FROM pizza_sales;

SELECT ROUND (SUM(total_price)/COUNT(DISTINCT(order_id)), 2) AS Average_Order_value
FROM pizza_sales;

SELECT CAST (SUM(quantity) AS DECIMAL (10,2)) AS Total_pizza_sold
FROM pizza_sales;

SELECT COUNT(DISTINCT order_id) AS Total_orders
FROM pizza_sales;

SELECT CAST (CAST (SUM(quantity) AS DECIMAL (10,2))/ CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL (10,2)) AS Avg_pizza_per_order
FROM pizza_sales;

SELECT DATENAME(weekday,order_date) AS Week_day, COUNT(DISTINCT order_id) AS Total_orders
FROM pizza_sales
GROUP BY DATENAME(weekday,order_date);

SELECT DATENAME(MONTH,order_date) AS Month_name, COUNT(DISTINCT order_id) AS Total_orders
FROM pizza_sales
GROUP BY DATENAME(MONTH,order_date)
ORDER BY Total_orders DESC ;

-- SELECT DATENAME(MONTH,order_date) AS Month_name, COUNT(DISTINCT order_id) AS Total_orders
-- FROM pizza_sales
-- WHERE DATENAME(QUARTER,order_date)=1
-- GROUP BY DATENAME(MONTH,order_date);

SELECT pizza_category,SUM(total_price) AS Total_Revenue, SUM(total_price)*100/(SELECT SUM(total_price) FROM pizza_sales WHERE MONTH(order_date)=1) AS Percentage_sales
FROM pizza_sales
WHERE MONTH(order_date)=1
GROUP BY pizza_category;

SELECT 
	pizza_size, 
	CAST (SUM(total_price) AS DECIMAL (10,2)) AS Total_Revenue, 
	CAST(SUM(total_price)*100/(SELECT SUM(total_price) FROM pizza_sales) AS DECIMAL(10,2)) AS Percentage_sales
FROM 
	pizza_sales
-- where DATENAME(quarter, order_date)=1
GROUP BY 
	pizza_size;

SELECT TOP 5 pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC;

SELECT TOP 5 pizza_name, SUM(quantity) AS Total_quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_quantity DESC;

SELECT TOP 5 pizza_name, COUNT (DISTINCT order_id) AS Total_orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_orders DESC;

SELECT DATEPART(HOUR, order_time) AS order_hours, COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY DATEPART(HOUR, order_time)
ORDER BY DATEPART(HOUR, order_time);