# Credit Card Fraud Detection with SQL
This repository contains an SQL-based approach for analyzing credit card transactions and flagging potential fraud. 
The analysis involves importing transaction data into MySQL, performing exploratory data analysis, and creating a rule-based system to flag 
suspicious transactions based on various features.

## Project Overview
The main objective of this project is to detect potential fraudulent transactions based on historical transaction data. We use MySQL to manage and query the data, and perform rule-based flagging to identify high-risk transactions.

## Dataset
The dataset is from Kaggle and it contains 1,000,000 transactions with the following fields:

- transaction_id: Unique identifier for each transaction
- distance_from_home: Distance from the cardholder's home to the transaction location
- distance_from_last_transaction: Distance from the location of the last transaction
- ratio_to_median_purchase_price: Ratio of the transaction amount to the cardholder's median purchase price
- repeat_retailer: Binary value indicating whether the retailer has been used before (0 or 1)
- used_chip: Binary value indicating whether the chip was used for the transaction (0 or 1)
- used_pin_number: Binary value indicating whether a PIN was used (0 or 1)
- online_order: Binary value indicating whether the transaction was an online order (0 or 1)
- fraud: Binary value indicating whether the transaction was labeled as fraudulent (0 or 1)
- fraud_flag: The fraud risk category (Low Fraud Risk, Moderate Fraud Risk, or High Fraud Risk) determined by the rule-based fraud detection system.
