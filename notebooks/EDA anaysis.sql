-- 1. Overview: Total Sales, Profit, and Orders
SELECT 
    COUNT(DISTINCT Order_ID) AS Total_Orders,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM superstore_orders;

-- 2. Top 10 Products by Sales
SELECT 
    Product_Name,
    SUM(Sales) AS Total_Sales
FROM superstore_orders
GROUP BY Product_Name
ORDER BY Total_Sales DESC
LIMIT 10;

-- 3. Sales by Category and Sub-Category
SELECT 
    Category,
    Sub_Category,
    SUM(Sales) AS Total_Sales
FROM superstore_orders
GROUP BY Category, Sub_Category
ORDER BY Category, Total_Sales DESC;

-- 4. Monthly Sales Trend
SELECT 
    DATE_FORMAT(Order_Date, '%Y-%m') AS Month,
    SUM(Sales) AS Monthly_Sales
FROM superstore_orders
GROUP BY Month
ORDER BY Month;

-- 5. Profitability by Segment
SELECT 
    Segment,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    ROUND(SUM(Profit)/SUM(Sales)*100, 2) AS Profit_Margin
FROM superstore_orders
GROUP BY Segment
ORDER BY Total_Profit DESC;

-- 6.State-Level Performance
SELECT 
    State,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM superstore_orders
GROUP BY State
ORDER BY Total_Profit ASC
LIMIT 10;  -- shows the least profitable states

-- 7.Discount Impact on Profit
SELECT 
    ROUND(Discount, 2) AS Discount_Rate,
    COUNT(*) AS Transactions,
    ROUND(AVG(Profit), 2) AS Avg_Profit
FROM superstore_orders
GROUP BY Discount_Rate
ORDER BY Discount_Rate;

-- 8.Top Loss-Making Products
SELECT 
    Product_Name,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM superstore_orders
GROUP BY Product_Name
ORDER BY Total_Profit
LIMIT 10;
