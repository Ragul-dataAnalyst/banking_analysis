
# 📘 Project: Banking Data Analysis with SQL & Python

## 📂 Project Structure

```
banking-analysis/
│── 1_create_insert_bank_data.sql      # SQL script to create tables & insert sample data
│── 2_python_eda_analysis.ipynb        # Exploratory Data Analysis using Python
│── 3_sql_python_connection.ipynb      # SQL Server connection & advanced visualizations
│── README.md                          # Documentation
```

---

## 📝 Project Overview

This project demonstrates how to build a **Banking Data Analysis System** using **SQL Server** for database management and **Python** for exploratory data analysis (EDA) & visualization.

We simulate real-world banking operations such as:

* **Customers** managing accounts
* **Transactions** (Credit/Debit)
* **Loans** with repayment schedules

---

## ⚙️ Files Description

### 1️⃣ `1_create_insert_bank_data.sql`

* Creates required tables:

  * `customers` → Customer information
  * `accounts` → Account details
  * `transactions` → Debit/Credit operations
  * `loans` → Loan records
* Adds **primary keys, foreign keys, constraints**
* Inserts **sample records** for testing

### 2️⃣ `2_python_eda_analysis.ipynb`

* Loads banking data into **Pandas DataFrames**
* Performs **EDA (Exploratory Data Analysis):**

  * Summary statistics
  * Loan distribution (type/status)
  * Transaction trends (daily, monthly)
  * Top customers by loan & transaction volume
* Visualizations with **Matplotlib, Seaborn, Plotly**

### 3️⃣ `3_sql_python_connection.ipynb`

* Connects **SQL Server** with Python using `pyodbc` / `sqlalchemy`
* Fetches data dynamically from the database
* Creates **interactive visualizations**:

  * Loan portfolio analysis
  * Customer transaction patterns
  * Risk/Default detection insights

---

## 📊 Example Visualizations

* 📈 **Daily & Monthly Transaction Trends**
* 📊 **Top 10 Customers by Loan Amount**
* 🏦 **Loan Repayment Duration Histogram**
* 🔍 **Active vs Closed Loans Analysis**

---

## 🚀 Technologies Used

* **Database**: SQL Server (T-SQL)
* **Python Libraries**:

  * `pandas`, `numpy` → Data manipulation
  * `matplotlib`, `seaborn` → Static visualizations
  * `plotly` → Interactive dashboards
  * `pyodbc` / `sqlalchemy` → Database connection

---

## 🔑 How to Run

1. Run `1_create_insert_bank_data.sql` in SQL Server to create and insert data.
2. Open `2_python_eda_analysis.ipynb` → run for offline EDA (CSV/DB export).
3. Open `3_sql_python_connection.ipynb` → connect directly to SQL Server, fetch data & visualize.

⚠️ Update **connection details** in Python before running:

```python
import pyodbc

conn = pyodbc.connect(
    "DRIVER={ODBC Driver 17 for SQL Server};"
    "SERVER=HARI\\SQLEXPRESS;"
    "DATABASE=BankDB;"
    "Trusted_Connection=yes;"
)
```

---

