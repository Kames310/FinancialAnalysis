-- =============================================
-- 1. CHECK TOTAL NUMBER OF ROWS
-- =============================================
SELECT count(*) as totalrows FROM dbo.financialsample 
-- =============================================
-- 2. LIST DATABASE TABLES
-- =============================================
SELECT TABLE_SCHEMA, TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE'
ORDER BY TABLE_NAME;
-- =============================================
-- 3. CHECK COLUMN NAMES AND DATA TYPES
-- =============================================
SELECT
    COLUMN_NAME,
    DATA_TYPE,
    IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'FinancialSample'
ORDER BY ORDINAL_POSITION;
-- =============================================
-- 4. PREVIEW SAMPLE DATA
-- =============================================
SELECT TOP 10 * FROM dbo.FinancialSample
-- =============================================
-- 5. LIST DISTINCT PRODUCTS
-- =============================================
SELECT DISTINCT PRODUCT
FROM dbo.FinancialSample
ORDER BY product;
-- =============================================
-- 6. CALCULATE OVERALL SALES, COGS AND PROFIT
-- =============================================
SELECT
    SUM(sales) AS TotalSales,
    SUM(cogs) AS TotalCOGS,
    SUM(profit) AS TotalProfit
FROM dbo.FinancialSample
-- =============================================
-- 7. ANALYSE SALES AND PROFIT BY COUNTRY
-- =============================================
SELECT
    country,
    SUM(sales) AS TotalSales,
    SUM(profit) AS TotalProfit
FROM dbo.FinancialSample
GROUP BY country
ORDER BY TotalSales DESC;
-- =============================================
-- 8. CALCULATE PROFIT MARGIN BY COUNTRY
-- Rank by total profit
-- =============================================
SELECT
    Country,
    SUM(sales) AS TotalSales,
    SUM(profit) AS TotalProfit,
   CAST(SUM(Profit) AS decimal(18,4))/Nullif(SUM(Sales),0) *100.0 as  ProfitMarginPercent 
FROM dbo.FinancialSample
GROUP BY Country
ORDER BY TotalProfit DESC
-- =============================================
-- 9. RANK COUNTRIES BY PROFIT MARGIN
-- Highest profit margin first
-- =============================================
SELECT
    Country,
    SUM(sales) AS TotalSales,
    SUM(profit) AS TotalProfit,
   CAST(SUM(Profit) AS decimal(18,4))/Nullif(SUM(Sales),0) *100.0 as  ProfitMarginPercent 
FROM dbo.FinancialSample
GROUP BY Country
ORDER BY ProfitMarginPercent DESC


