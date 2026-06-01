# Gold Price Analysis Dashboard — India (2020–2024)

A complete data analytics project analyzing gold price trends in India using **Excel**, **SQL**, and **Power BI**.

---

## Project Overview

This project analyzes daily gold prices in India from 2020 to 2024, identifying seasonal trends, festive season demand patterns, and year-wise price growth. The insights are presented through an interactive Power BI dashboard.

---

## Tools Used

| Tool | Purpose |
|---|---|
| **Excel** | Data cleaning, calculated columns, pivot table |
| **SQL** | Business questions and queries |
| **Power BI** | Interactive dashboard and visualization |

---

## Project Structure

```
gold-price-analysis/
├── data/
│   └── gold_price_india.csv        # Raw dataset
├── excel/
│   └── gold_price_india.xlsx       # Cleaned Excel file
├── sql/
│   └── queries.sql                 # SQL business queries
├── powerbi/
│   └── gold_dashboard.pbix         # Power BI dashboard
└── README.md
```

---

##  Dataset

- **Source:** MCX (Multi Commodity Exchange) & IBJA (India Bullion and Jewellers Association)
- **Duration:** January 2020 – December 2024
- **Rows:** 1,827 daily records

### Columns:
| Column | Description |
|---|---|
| Date | Daily date |
| Year | Year (2020–2024) |
| Month_Name | Month name (Jan–Dec) |
| Price_24K_INR | 24K gold price per 10g in INR |
| Price_22K_INR | 22K gold price per 10g in INR |
| Price_Diff | Difference between 24K and 22K |
| Premium_Percent | Premium % of 24K over 22K |
| Festive_Season | Yes/No — April, October, November |

---

##  Excel — Data Cleaning Steps

1. Opened raw CSV in Excel
2. Formatted Date column to proper date format
3. Added calculated columns:
   - `Price_Diff = Price_24K - Price_22K`
   - `Premium_Percent = ((Price_24K - Price_22K) / Price_22K) * 100`
   - `Festive_Season = IF(Month is Apr/Oct/Nov, "Yes", "No")`
4. Created Pivot Table for monthly average prices
5. Saved as `.xlsx` for Power BI import

---

##  SQL — Business Queries

```sql
-- 1. Highest gold price day
SELECT Date, Price_24K_INR 
FROM gold_price_india 
ORDER BY Price_24K_INR DESC 
LIMIT 1;

-- 2. Year-wise average price
SELECT Year, AVG(Price_24K_INR) AS Avg_Price
FROM gold_price_india 
GROUP BY Year;

-- 3. Festive vs Non-Festive average price
SELECT Festive_Season, AVG(Price_24K_INR) AS Avg_Price
FROM gold_price_india 
GROUP BY Festive_Season;

-- 4. Cheapest month to buy gold
SELECT Month_Name, AVG(Price_24K_INR) AS Avg_Price
FROM gold_price_india 
GROUP BY Month_Name 
ORDER BY Avg_Price ASC 
LIMIT 1;

-- 5. Total price growth 2020 to 2024
SELECT 
  MAX(Price_24K_INR) - MIN(Price_24K_INR) AS Total_Growth_INR
FROM gold_price_india;
```

---

## Power BI Dashboard

### KPI Cards:
-  **Highest Gold Price:** ₹69,810
-  **Lowest Gold Price:** ₹41,120
-  **Average Gold Price:** ₹55,270

### Visuals:
- **Line Chart** — Gold price trend from 2020 to 2024
- **Bar Chart** — Average price by month (seasonal pattern)
- **3 KPI Cards** — Highest, Lowest, Average price

---

##  Key Insights

1. **90% price growth** — Gold rose from ~₹38,000 in 2020 to ~₹72,000 in 2024
2. **October & November** are the most expensive months due to Dhanteras & Diwali demand
3. **April spike** is driven by Akshaya Tritiya buying
4. **Festive season prices** are significantly higher than non-festive months
5. **22K jewellery** dominates retail demand vs 24K bars/coins

---

##  How to Run

1. Download `gold_price_india.xlsx` from the `excel/` folder
2. Open `gold_dashboard.pbix` in Power BI Desktop
3. Refresh data source if needed
4. Run SQL queries in any SQL editor (SQLiteOnline.com works free)






