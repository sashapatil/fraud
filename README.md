# Credit Card Fraud Detection with SQL

This repository contains an SQL-based approach for analyzing credit card transactions and flagging potential fraud.
The analysis involves importing transaction data into MySQL, performing exploratory data analysis, and creating a rule-based system to flag
suspicious transactions based on various features.

## Project Overview

\# Rule-Based Anomaly Detection in Transaction Data Using SQL



\## Overview



This project uses SQL to build a rule-based anomaly detection system for identifying high-risk patterns in a large-scale transaction dataset (1,000,000 records). While applied to financial transactions, the methodology is relevant to public-sector systems that rely on transparent rule-based decision-making, such as benefits eligibility screening, fraud detection, and administrative risk flagging.



The objective is to demonstrate how interpretable rules can be used to classify risk in high-volume datasets while maintaining transparency and clarity.



\---



\## Project Objective



The goal of this project is to identify anomalous transaction behavior using SQL-based analysis and classify transactions into risk levels based on observable behavioral patterns. The focus is on interpretability and decision transparency rather than predictive machine learning.



\---



\## Dataset



The dataset (Kaggle) contains approximately 1,000,000 transaction records with behavioral and transactional features used for anomaly detection.



\### Key Features



\- \*\*transaction\_id\*\*: Unique identifier for each transaction  

\- \*\*distance\_from\_home\*\*: Distance from user’s home location  

\- \*\*distance\_from\_last\_transaction\*\*: Distance from prior transaction location  

\- \*\*ratio\_to\_median\_purchase\_price\*\*: Spending deviation metric  

\- \*\*repeat\_retailer\*\*: Prior merchant usage indicator (0/1)  

\- \*\*used\_chip\*\*: Payment method indicator (0/1)  

\- \*\*used\_pin\_number\*\*: Authentication method indicator (0/1)  

\- \*\*online\_order\*\*: Transaction channel indicator (0/1)  

\- \*\*fraud\*\*: Ground truth label (0/1)  

\- \*\*fraud\_flag\*\*: Rule-based risk classification (Low / Moderate / High)



\---



\## Methodology



\### 1. Data Exploration

SQL queries were used to explore feature distributions and identify relationships between transaction behavior and fraud likelihood.



\### 2. Rule-Based Classification System

A transparent rule-based system was developed to classify transactions into risk categories using:



\- Distance-based anomalies (home location and previous transaction distance)

\- Spending behavior deviation (ratio to median purchase price)

\- Transaction method indicators (online order, PIN, chip usage)

\- Merchant familiarity (repeat retailer usage)



\### Output Classes:

\- Low Risk  

\- Moderate Risk  

\- High Risk  



\---



\## Key Findings



\- Large deviations from typical spending behavior are strongly associated with higher risk classification.  

\- Distance-based anomalies are important indicators of unusual transaction activity.  

\- Combining multiple behavioral signals improves the clarity and consistency of risk classification.  

\- Rule-based systems prioritize interpretability but may miss complex patterns found in statistical or machine learning models.  



\---



\## Policy Relevance



Although developed using financial transaction data, this methodology is applicable to public-sector systems that rely on rule-based decision frameworks, including:



\- Public benefits fraud detection systems  

\- Eligibility screening processes  

\- Housing and service allocation prioritization  

\- Administrative audit and compliance review systems  



This project highlights a key tradeoff in policy analytics: \*\*interpretable rule-based systems provide transparency and accountability, while more complex models may improve predictive performance but reduce explainability.\*\*



\---



\## Limitations



\- Rule-based logic is heuristic and not statistically optimized  

\- Does not capture nonlinear or evolving behavioral patterns  

\- No machine learning baseline comparison included  

\- Potential for false positives due to rigid classification thresholds  



\---



\## Tools Used



\- SQL (MySQL)

\- Exploratory Data Analysis (EDA)

\- Rule-based classification logic



\---



\## Project Structure



\- `credit\_card\_fraud.sql`: SQL scripts for data exploration and rule-based classification



\---



\## Contribution



This is an independent applied data analysis project focused on building interpretable anomaly detection systems using SQL in large-scale datasets.



