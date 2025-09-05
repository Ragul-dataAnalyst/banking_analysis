-- Create a new database
CREATE DATABASE banking_db;

-- Switch to this database
USE banking_db;


-- Customers Table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    dob DATE,
    city VARCHAR(50),
    contact_no VARCHAR(15)
);

WITH seq AS (
    SELECT 1 AS n
    UNION ALL
    SELECT n + 1 FROM seq
    WHERE n < 100
)
INSERT INTO customers (customer_id, name, dob, city, contact_no)
SELECT 
    1000 + n, 
    CONCAT('Customer_', n),
    DATEADD(DAY, CAST(RAND(CHECKSUM(NEWID())) * 15000 AS INT), '1970-01-01'),
    CASE ABS(CHECKSUM(NEWID())) % 5
        WHEN 0 THEN 'Mumbai'
        WHEN 1 THEN 'Delhi'
        WHEN 2 THEN 'Bangalore'
        WHEN 3 THEN 'Chennai'
        ELSE 'Ahmedabad'
    END,
    CONCAT('9', RIGHT('000000000' + CAST(ABS(CHECKSUM(NEWID())) % 1000000000 AS VARCHAR(10)), 9))
FROM seq
OPTION (MAXRECURSION 100);
-- Accounts Table
CREATE TABLE accounts (
    account_id INT PRIMARY KEY,
    customer_id INT,
    account_type VARCHAR(20),
    balance DECIMAL(12,2),
    opened_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

WITH seq AS (
    SELECT 1 AS n
    UNION ALL
    SELECT n + 1 FROM seq
    WHERE n < 100
)
INSERT INTO accounts (account_id, customer_id, account_type, balance)
SELECT 
    2000 + n,
    1000 + n, -- ? now matches exactly 1001–1100 in customers
    CASE ABS(CHECKSUM(NEWID())) % 3
        WHEN 0 THEN 'Savings'
        WHEN 1 THEN 'Current'
        ELSE 'Fixed Deposit'
    END,
    CAST(RAND(CHECKSUM(NEWID())) * 100000 AS DECIMAL(12,2))
FROM seq
OPTION (MAXRECURSION 100);

--transactions table
CREATE TABLE transactions (
    txn_id INT PRIMARY KEY,
    account_id INT,
    txn_date DATE,
    txn_type VARCHAR(10), -- Debit / Credit
    amount DECIMAL(12,2),
    channel VARCHAR(30),
    FOREIGN KEY (account_id) REFERENCES accounts(account_id)
);

WITH seq AS (
    SELECT 1 AS n
    UNION ALL
    SELECT n + 1 FROM seq
    WHERE n < 100
)
INSERT INTO transactions (txn_id, account_id, txn_date, txn_type, amount, channel)
SELECT
    3000 + n,  -- txn_id
    2000 + ((n - 1) % 100) + 1, -- account_id 
    DATEADD(DAY, CAST(RAND(CHECKSUM(NEWID())) * 3650 AS INT), '2015-01-01'), -- random date between 2015–2025
    CASE ABS(CHECKSUM(NEWID())) % 2
        WHEN 0 THEN 'Debit'
        ELSE 'Credit'
    END,
    CAST(RAND(CHECKSUM(NEWID())) * 50000 AS DECIMAL(12,2)), -- random amount up to 50k
    CASE ABS(CHECKSUM(NEWID())) % 4
        WHEN 0 THEN 'Online Banking'
        WHEN 1 THEN 'ATM'
        WHEN 2 THEN 'Branch'
        ELSE 'Mobile App'
    END
FROM seq
OPTION (MAXRECURSION 100);


-- Loans Table
CREATE TABLE loans (
    loan_id INT PRIMARY KEY,
    customer_id INT,
    loan_type VARCHAR(30),
    amount DECIMAL(12,2),
    start_date DATE,
    end_date DATE,
    status VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

WITH seq AS (
    SELECT 1 AS n
    UNION ALL
    SELECT n + 1 FROM seq
    WHERE n < 100
)
INSERT INTO loans (loan_id, customer_id, loan_type, amount, start_date, end_date, status)
SELECT
    4000 + n,  -- loan_id
    1000 + n,  -- customer_id
    CASE ABS(CHECKSUM(NEWID())) % 4
        WHEN 0 THEN 'Home Loan'
        WHEN 1 THEN 'Personal Loan'
        WHEN 2 THEN 'Car Loan'
        ELSE 'Education Loan'
    END,
    CAST(RAND(CHECKSUM(NEWID())) * 1000000 AS DECIMAL(12,2)), -- random loan amount up to 10L
    DATEADD(DAY, CAST(RAND(CHECKSUM(NEWID())) * 3650 AS INT), '2015-01-01'), -- random start date between 2015–2025
    DATEADD(DAY, CAST(RAND(CHECKSUM(NEWID())) * 3650 AS INT), '2025-01-01'), -- random end date after 2025
    CASE ABS(CHECKSUM(NEWID())) % 3
        WHEN 0 THEN 'Active'
        WHEN 1 THEN 'Closed'
        ELSE 'Defaulted'
    END
FROM seq
OPTION (MAXRECURSION 100);

WITH seq AS (
    SELECT 1 AS n
    UNION ALL
    SELECT n + 1 FROM seq
    WHERE n < 100
)
INSERT INTO loans (loan_id, customer_id, loan_type, amount, start_date, end_date, status)
SELECT
    4000 + n,  -- loan_id
    1000 + n,  -- ? ensures customer_id is 1001–1100
    CASE ABS(CHECKSUM(NEWID())) % 4
        WHEN 0 THEN 'Home Loan'
        WHEN 1 THEN 'Personal Loan'
        WHEN 2 THEN 'Car Loan'
        ELSE 'Education Loan'
    END,
    CAST(RAND(CHECKSUM(NEWID())) * 1000000 AS DECIMAL(12,2)), -- random loan amount up to 10L
    DATEADD(DAY, CAST(RAND(CHECKSUM(NEWID())) * 3650 AS INT), '2015-01-01'), -- random start date between 2015–2025
    DATEADD(DAY, CAST(RAND(CHECKSUM(NEWID())) * 3650 AS INT), '2025-01-01'), -- random end date after 2025
    CASE ABS(CHECKSUM(NEWID())) % 3
        WHEN 0 THEN 'Active'
        WHEN 1 THEN 'Closed'
        ELSE 'Defaulted'
    END
FROM seq
OPTION (MAXRECURSION 100);
