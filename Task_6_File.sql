--  Create a new database to work in
CREATE DATABASE  sales_analysis;
USE sales_analysis;

--  Create a table to match the structure of your CSV file
CREATE TABLE IF NOT EXISTS sales_data (
  ORDERNUMBER INT,
  QUANTITYORDERED INT,
  PRICEEACH DECIMAL(10,2),
  ORDERLINENUMBER INT,
  SALES DECIMAL(10,2),
  ORDERDATE VARCHAR(50),
  STATUS VARCHAR(20),
  QTR_ID INT,
  MONTH_ID INT,
  YEAR_ID INT,
  PRODUCTLINE VARCHAR(50),
  MSRP DECIMAL(10,2),
  PRODUCTCODE VARCHAR(50),
  CUSTOMERNAME VARCHAR(100),
  PHONE VARCHAR(50),
  ADDRESSLINE1 VARCHAR(100),
  ADDRESSLINE2 VARCHAR(100),
  CITY VARCHAR(50),
  STATE VARCHAR(50),
  POSTALCODE VARCHAR(20),
  COUNTRY VARCHAR(50),
  TERRITORY VARCHAR(50),
  CONTACTLASTNAME VARCHAR(50),
  CONTACTFIRSTNAME VARCHAR(50),
  DEALSIZE VARCHAR(20)
);

--  Check if the table is empty (returns number of rows)
SELECT COUNT(*) AS total_rows FROM sales_data;

--  View first 5 rows to confirm data was loaded
SELECT * FROM sales_data LIMIT 5;

--  Aggregate total revenue and order volume by year and month
SELECT
    YEAR_ID AS year,
    MONTH_ID AS month,
    MONTHNAME(STR_TO_DATE(CAST(MONTH_ID AS CHAR), '%m')) AS month_name,  -- Converts numeric month to month name
    SUM(SALES) AS total_revenue,
    COUNT(DISTINCT ORDERNUMBER) AS order_volume
FROM sales_data
GROUP BY year, month
ORDER BY year, month;

-- Get top 3 highest revenue months
SELECT
    YEAR_ID AS year,
    MONTH_ID AS month,
    MONTHNAME(STR_TO_DATE(CAST(MONTH_ID AS CHAR), '%m')) AS month_name,
    SUM(SALES) AS total_revenue
FROM sales_data
GROUP BY year, month
ORDER BY total_revenue DESC
LIMIT 3;

--  Show column names and types in the table
SHOW COLUMNS FROM sales_data;

--  View selected columns to manually verify data
SELECT ORDERDATE, MONTH_ID, YEAR_ID, SALES, ORDERNUMBER
FROM sales_data
LIMIT 10;
