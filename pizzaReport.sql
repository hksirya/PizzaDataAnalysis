-- Query 1: Calculate the total revenue from pizza sales
SELECT SUM(total_price) AS Total_Revenue from pizza_sales

-- Query 2: Calculate the average order value from pizza sales
SELECT SUM(total_price)/COUNT(DISTINCT order_id) AS Average_Order_value from pizza_sales

-- Query 3: Calculate the total quantity of pizzas sold
SELECT SUM(quantity) AS Total_Pizza_Sold from pizza_sales

-- Query 4: Count the total number of distinct orders
SELECT COUNT(DISTINCT order_id) AS Total_Orders from pizza_sales

-- Query 5: Calculate the average number of pizzas per order
SELECT CAST(CAST(SUM(quantity) AS decimal(10,2)) / CAST(COUNT(DISTINCT order_id) AS decimal(10,2)) AS DECIMAL(10,2)) AS Avg_Pizza_per_order from pizza_sales

-- Query 6: Count the total orders for each day of the week
SELECT DATENAME(DW, order_date) as Order_Day, COUNT(DISTINCT order_id) AS Total_orders
FROM pizza_sales
GROUP BY DATENAME(DW, order_date)

-- Query 7: Count the total orders for each month and order them by the total orders in descending order
SELECT DATENAME(MONTH, order_date) as Order_Month, COUNT(DISTINCT order_id) AS Total_orders
FROM pizza_sales
GROUP BY DATENAME(MONTH, order_date)
ORDER BY Total_orders DESC

-- Query 8: Calculate the total order price and percentage for each pizza category in a specific month (January)
SELECT pizza_category, SUM(total_price) AS Total_Order_Price, SUM(total_price) * 100 / (SELECT sum(total_price) from pizza_sales WHERE MONTH(order_date)=1) AS PCT
from pizza_sales 
WHERE MONTH(order_date)=1
GROUP BY pizza_category

-- Query 9: Calculate the total order price and percentage for each pizza size across all months
SELECT pizza_size, SUM(total_price) AS Total_Order_Price, SUM(total_price) * 100 / (SELECT sum(total_price) from pizza_sales) AS PCT
from pizza_sales 
GROUP BY pizza_size
ORDER BY PCT DESC

-- Query 10: Get the top 5 pizza names with the highest total revenue
SELECT TOP 5 pizza_name, SUM(total_price) AS Total_revenue FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_revenue DESC

-- Query 11: Get the top 5 pizza names with the lowest total revenue
SELECT TOP 5 pizza_name, SUM(total_price) AS Total_revenue FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_revenue 

-- Query 12: Get the top 5 pizza names with the highest total quantity sold
SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Quantity FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity DESC

-- Query 13: Get the top 5 pizza names with the lowest total quantity sold
SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Quantity FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity
