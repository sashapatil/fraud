# Credit Card Fraud Detection Using SQL



#### Overview



This project uses SQL to build a rule-based anomaly detection system for identifying high-risk transaction patterns in a dataset of 1,000,000 records.



The goal is to demonstrate how interpretable rules can be used to classify risk in large-scale datasets while maintaining transparency and clarity. Although applied to financial transactions, the approach is relevant to public-sector systems such as benefits screening, fraud detection, and administrative risk flagging.



\---



#### Objective



To identify anomalous transaction behavior using SQL-based analysis and classify transactions into risk levels based on observable behavioral patterns. This project prioritizes interpretability and transparency over predictive machine learning.



\---



#### Dataset



Kaggle dataset containing \~1M transaction records with behavioral features.



Key Features:

\- transaction\_id: Unique identifier  

\- distance\_from\_home: Distance from user’s home  

\- distance\_from\_last\_transaction: Distance from previous transaction  

\- ratio\_to\_median\_purchase\_price: Spending deviation metric  

\- repeat\_retailer: Prior merchant usage (0/1)  

\- used\_chip: Payment method indicator (0/1)  

\- used\_pin\_number: Authentication method (0/1)  

\- online\_order: Transaction channel (0/1)  

\- fraud: Ground truth label (0/1)  

\- fraud\_flag: Rule-based risk classification  



\---



#### Methodology



SQL Analysis:

\- Explored feature distributions and behavioral patterns

\- Identified relationships between transaction behavior and fraud likelihood



Rule-Based Classification:

Transactions were classified using interpretable rules based on:

\- Distance anomalies

\- Spending deviation

\- Payment method signals

\- Merchant familiarity



Output Classes:

\- Low Risk  

\- Moderate Risk  

\- High Risk  



\---



#### Key Findings



\- Spending deviation is strongly associated with higher risk classification  

\- Distance-based anomalies are key fraud indicators  

\- Combining multiple signals improves classification consistency  

\- Rule-based systems improve interpretability but may miss complex patterns  



\---



#### Policy Relevance



This approach is applicable to public-sector systems that rely on transparent decision rules, including:

\- Benefits eligibility screening  

\- Fraud detection systems  

\- Housing and service prioritization  

\- Administrative compliance monitoring  



It highlights the tradeoff between interpretability and predictive complexity in policy analytics.



\---



#### Tools Used



\- SQL (MySQL)

\- Exploratory Data Analysis

\- Rule-based classification design



\---



#### Files



\- `credit\_card\_fraud.sql`: SQL queries for data exploration and rule-based classification



