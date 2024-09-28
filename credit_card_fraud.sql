-- Step 1: Enable local file loading (if required)
SET GLOBAL local_infile = 1;

-- Step 2: Create the database
CREATE DATABASE credit_card_fraud;

-- Step 3: Use the created database
USE credit_card_fraud;

-- Step 4: Create the transactions table
CREATE TABLE transactions (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,  -- Added a primary key
    distance_from_home FLOAT,
    distance_from_last_transaction FLOAT,
    ratio_to_median_purchase_price FLOAT,
    repeat_retailer TINYINT,      -- 0 or 1 for Yes/No
    used_chip TINYINT,            -- 0 or 1 for Yes/No
    used_pin_number TINYINT,      -- 0 or 1 for Yes/No
    online_order TINYINT,         -- 0 or 1 for Yes/No
    fraud TINYINT                 -- 0 or 1 for Yes/No
);

-- Step 5: Import the CSV data from the specified file path
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/card_transdata.csv'
INTO TABLE transactions
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 ROWS
(distance_from_home, distance_from_last_transaction, ratio_to_median_purchase_price, repeat_retailer, used_chip, used_pin_number, online_order, fraud);

-- Step 6: Verify the data import by checking the first 5 rows
SELECT * FROM transactions LIMIT 5;

-- Step 7: Exploring the Data
DESCRIBE transactions;
SELECT COUNT(*) AS total_transactions FROM transactions;
-- 1,000,000 total transactions

SELECT 
    SUM(CASE WHEN distance_from_home IS NULL THEN 1 ELSE 0 END) AS null_distance_from_home,
    SUM(CASE WHEN distance_from_last_transaction IS NULL THEN 1 ELSE 0 END) AS null_distance_from_last_transaction,
    SUM(CASE WHEN ratio_to_median_purchase_price IS NULL THEN 1 ELSE 0 END) AS null_ratio_to_median_purchase_price,
    SUM(CASE WHEN repeat_retailer IS NULL THEN 1 ELSE 0 END) AS null_repeat_retailer,
    SUM(CASE WHEN used_chip IS NULL THEN 1 ELSE 0 END) AS null_used_chip,
    SUM(CASE WHEN used_pin_number IS NULL THEN 1 ELSE 0 END) AS null_used_pin_number,
    SUM(CASE WHEN online_order IS NULL THEN 1 ELSE 0 END) AS null_online_order,
    SUM(CASE WHEN fraud IS NULL THEN 1 ELSE 0 END) AS null_fraud
FROM transactions;
-- no empty data

-- Step 8: Further exploration
SELECT fraud, COUNT(*) AS count
FROM transactions
GROUP BY fraud;

-- 0 = 912597 | 1 =	87403

-- Distance & Fraud
SELECT fraud, AVG(distance_from_home) AS avg_distance
FROM transactions
GROUP BY fraud;

-- 0 = 22.832976018875314 | 1 = 66.26187633589599

-- Chip or PIN
SELECT 
    used_chip, 
    COUNT(*) AS transaction_count, 
    SUM(fraud) AS fraudulent_count,
    (SUM(fraud) / COUNT(*)) * 100 AS fraud_percentage
FROM transactions
GROUP BY used_chip;

-- Identify patterns
SELECT 
    CASE 
        WHEN distance_from_home < 10 THEN 'Near Home'
        WHEN distance_from_home BETWEEN 10 AND 50 THEN 'Moderate Distance'
        ELSE 'Far Away'
    END AS distance_category,
    COUNT(*) AS transaction_count,
    SUM(fraud) AS fraudulent_count,
    (SUM(fraud) / COUNT(*)) * 100 AS fraud_percentage
FROM transactions
GROUP BY distance_category;


SELECT 
    repeat_retailer, 
    COUNT(*) AS transaction_count,
    SUM(fraud) AS fraudulent_count,
    (SUM(fraud) / COUNT(*)) * 100 AS fraud_percentage
FROM transactions
GROUP BY repeat_retailer;

SELECT 
    online_order, 
    COUNT(*) AS transaction_count,
    SUM(fraud) AS fraudulent_count,
    (SUM(fraud) / COUNT(*)) * 100 AS fraud_percentage
FROM transactions
GROUP BY online_order;

-- Flagging potential fraud with rules
CREATE TABLE flagged_transactions AS 
  SELECT *, 
    CASE 
      WHEN (distance_from_home > (SELECT AVG(distance_from_home) + 3 * STDDEV(distance_from_home) FROM transactions)
            OR ratio_to_median_purchase_price > (SELECT AVG(ratio_to_median_purchase_price) + 3 * STDDEV(ratio_to_median_purchase_price) FROM transactions))
           AND used_pin_number = 0 
           AND online_order = 1
      THEN 'High Fraud Risk' 
      WHEN (distance_from_home > (SELECT AVG(distance_from_home) + 3 * STDDEV(distance_from_home) FROM transactions)
            OR ratio_to_median_purchase_price > (SELECT AVG(ratio_to_median_purchase_price) + 3 * STDDEV(ratio_to_median_purchase_price) FROM transactions))
           AND (used_pin_number = 1 OR online_order = 0)
      THEN 'Moderate Fraud Risk'
      ELSE 'Low Fraud Risk'
    END AS fraud_flag
  FROM transactions;

SELECT * FROM flagged_transactions WHERE fraud_flag = 'High Fraud Risk';
