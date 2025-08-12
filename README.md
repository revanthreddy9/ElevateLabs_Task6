# 📊 Task 6 – Sales Trend Analysis (Data Analyst Internship)

## 🎯 Objective
The goal of this task is to **analyze monthly revenue and order volume** from the provided `sales_data_sample.csv` dataset using **MySQL**.  
We will group sales data by **month and year**, calculate **total revenue** and **order volume**, and identify the **top 3 months by sales**.

---

## 📂 Dataset Information
- **File:** `sales_data_sample.csv`
- **Source:** Internship Task 6 Dataset
- **Key Columns:**
  - `ORDERDATE` → Date of order  
  - `SALES` → Revenue for the order line  
  - `ORDERNUMBER` → Unique order identifier  

---

## 🛠 Tools & Technologies
- **MySQL Community Server**
- **MySQL Workbench**
- **SQL Functions:** `SUM()`, `COUNT(DISTINCT)`, `GROUP BY`, `ORDER BY`, `YEAR()`, `MONTH()`, `MONTHNAME()`, `STR_TO_DATE()`

---

## 📝 Steps Followed

### 1️⃣ Create Database & Table
```sql
CREATE DATABASE sales_analysis;
USE sales_analysis;

CREATE TABLE sales_data (
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

2️⃣ Load Data
Used MySQL Workbench → Table Data Import Wizard

Verified with:

sql
Copy
Edit
SELECT COUNT(*) FROM sales_data;
SELECT * FROM sales_data LIMIT 5;
3️⃣ Monthly Revenue & Order Volume
sql
Copy
Edit
SELECT
    YEAR(STR_TO_DATE(ORDERDATE, '%m/%d/%Y %H:%i')) AS year,
    MONTH(STR_TO_DATE(ORDERDATE, '%m/%d/%Y %H:%i')) AS month,
    MONTHNAME(STR_TO_DATE(ORDERDATE, '%m/%d/%Y %H:%i')) AS month_name,
    SUM(SALES) AS total_revenue,
    COUNT(DISTINCT ORDERNUMBER) AS order_volume
FROM sales_data
GROUP BY year, month
ORDER BY year, month;
4️⃣ Top 3 Months by Sales
sql
Copy
Edit
SELECT
    YEAR(STR_TO_DATE(ORDERDATE, '%m/%d/%Y %H:%i')) AS year,
    MONTH(STR_TO_DATE(ORDERDATE, '%m/%d/%Y %H:%i')) AS month,
    MONTHNAME(STR_TO_DATE(ORDERDATE, '%m/%d/%Y %H:%i')) AS month_name,
    SUM(SALES) AS total_revenue
FROM sales_data
GROUP BY year, month
ORDER BY total_revenue DESC
LIMIT 3;
📈 Results
Generated monthly sales trend table with revenue and order volume

Found the top 3 sales months for business insights

📌 Key Learnings
Grouping and aggregating data using GROUP BY

Extracting month/year from string dates with STR_TO_DATE()

Using aggregate functions for trend analysis

Exporting results from MySQL Workbench for reporting