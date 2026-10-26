--1.
SELECT count(*) as totalrows FROM dbo.financialsample 
--2.
SELECT TABLE_SCHEMA, TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE'
ORDER BY TABLE_NAME;
--3
SELECT
    COLUMN_NAME,
    DATA_TYPE,
    IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'FinancialSample'
ORDER BY ORDINAL_POSITION;
--4
SELECT TOP 10 * FROM dbo.FinancialSample
SELECT DISTINCT PRODUCT
FROM dbo.FinancialSample
ORDER BY product;
--5
SELECT
    SUM(sales) AS TotalSales,
    SUM(cogs) AS TotalCOGS,
    SUM(profit) AS TotalProfit
FROM dbo.FinancialSample
--6
SELECT
    country,
    SUM(sales) AS TotalSales,
    SUM(profit) AS TotalProfit
FROM dbo.FinancialSample
GROUP BY country
ORDER BY TotalSales DESC;
--7
SELECT
    Country,
    SUM(sales) AS TotalSales,
    SUM(profit) AS TotalProfit,
   CAST(SUM(Profit) AS decimal(18,4))/Nullif(SUM(Sales),0) *100.0 as  ProfitMarginPercent 
FROM dbo.FinancialSample
GROUP BY Country
ORDER BY TotalProfit DESC

SELECT
    Country,
    SUM(sales) AS TotalSales,
    SUM(profit) AS TotalProfit,
   CAST(SUM(Profit) AS decimal(18,4))/Nullif(SUM(Sales),0) *100.0 as  ProfitMarginPercent 
FROM dbo.FinancialSample
GROUP BY Country
ORDER BY ProfitMarginPercent DESC


