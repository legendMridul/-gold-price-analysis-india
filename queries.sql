-- Gold Price Analysis — India (2020-2024)
-- Source: MCX & IBJA
-- Author: [Your Name]

-- ============================================
-- Q1. Sabse mehenga din kaunsa tha?
-- ============================================
SELECT Date, Price_24K_INR 
FROM gold_price_india 
ORDER BY Price_24K_INR DESC 
LIMIT 1;

-- ============================================
-- Q2. Har saal ka average price?
-- ============================================
SELECT Year, ROUND(AVG(Price_24K_INR), 2) AS Avg_Price_INR
FROM gold_price_india 
GROUP BY Year
ORDER BY Year;

-- ============================================
-- Q3. Festive season vs non-festive average price?
-- ============================================
SELECT Festive_Season, ROUND(AVG(Price_24K_INR), 2) AS Avg_Price_INR
FROM gold_price_india 
GROUP BY Festive_Season;

-- ============================================
-- Q4. Sabse sasta mahina kaunsa tha?
-- ============================================
SELECT Month_Name, ROUND(AVG(Price_24K_INR), 2) AS Avg_Price_INR
FROM gold_price_india 
GROUP BY Month_Name 
ORDER BY Avg_Price_INR ASC 
LIMIT 1;

-- ============================================
-- Q5. 2020 se 2024 kitni price growth hui?
-- ============================================
SELECT 
  ROUND(MAX(Price_24K_INR) - MIN(Price_24K_INR), 2) AS Total_Growth_INR
FROM gold_price_india;

-- ============================================
-- Q6. Har mahine ka average price?
-- ============================================
SELECT Month_Name, ROUND(AVG(Price_24K_INR), 2) AS Avg_Price_INR
FROM gold_price_india 
GROUP BY Month_Name
ORDER BY AVG(Price_24K_INR) DESC;

-- ============================================
-- Q7. 22K aur 24K ka average price difference?
-- ============================================
SELECT 
  ROUND(AVG(Price_24K_INR), 2) AS Avg_24K,
  ROUND(AVG(Price_22K_INR), 2) AS Avg_22K,
  ROUND(AVG(Price_Diff), 2) AS Avg_Difference
FROM gold_price_india;
