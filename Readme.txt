# FinTech Payment Transaction Analysis

## Project Overview

This project analyzes 500 synthetic payment transactions to understand payment performance, transaction trends, payment-method usage, bank performance, and transaction failure patterns.

The project was created as a Data Analyst portfolio project using Excel and MySQL.

## Business Questions

- What is the overall payment success rate?
- Which payment method is used most frequently?
- Which bank has the highest transaction volume?
- Which bank has the highest failure rate?
- What are the most common reasons for failed transactions?
- Which customer type generates the most transactions?
- How does transaction activity change over time?

## Dataset

The dataset contains 500 synthetic payment transactions.

Key fields include:

- Transaction ID
- Transaction Date
- Customer ID
- Bank
- Payment Method
- Transaction Amount
- Status
- Failure Reason
- City
- Customer Type
- Device

> **Note:** The dataset is synthetic and was created for learning and portfolio purposes.
## Tools & Skills Used

### Excel

- Data cleaning and validation
- KPI calculations
- Pivot Tables
- Transaction analysis
- Charts and dashboard creation

### MySQL

- Data loading and transformation
- `SELECT`
- `WHERE`
- `GROUP BY`
- `ORDER BY`
- Aggregate functions such as `COUNT()`, `SUM()`, and `AVG()`
- `CASE` statements
- Date-based analysis
- Failure-rate and success-rate calculations

## Analysis Performed

### 1. KPI Analysis

Calculated:

- Total transactions
- Total transaction value
- Successful transactions
- Failed transactions
- Pending transactions
- Overall success rate
- Overall failure rate

### 2. Payment Method Analysis

Compared payment methods based on:

- Transaction volume
- Transaction value
- Success rate

### 3. Bank Performance Analysis

Compared banks based on:

- Transaction volume
- Transaction value
- Failure rate

### 4. Failure Analysis

Analyzed:

- Failure reasons
- Percentage of total failures
- Failure patterns by bank

### 5. Customer & City Analysis

Compared transaction activity and transaction value across:

- Customer types
- Cities

### 6. Monthly Trend Analysis

Analyzed transaction volume and transaction value over time.
## Key Findings

- The dataset contains 500 payment transactions with a total transaction value of ₹850,222.76.
- 422 transactions were successful, resulting in an overall success rate of 84.4%.
- 60 transactions failed, representing a failure rate of 12%.
- UPI was the most frequently used payment method, with 267 transactions (53.4% of all transactions).
- HDFC Bank had the highest transaction volume, with 110 transactions.
- State Bank of India had the highest failure rate at 15%.
- Fraud Check was the most common reason for failed transactions, accounting for 14 failures.

## Business Recommendations

- Investigate fraud-check failures to identify potential false positives and improve successful payment completion.
- Review the transaction failure patterns for State Bank of India and investigate the underlying causes.
- Monitor UPI performance because it represents the largest share of transactions.
- Track payment success and failure trends regularly to identify operational issues early.

## Project Structure

```text
FinTech_Payment_Transaction_Analysis/
│
├── Dataset/
│   └── FinTech_Payment_Transactions_500.csv
│
├── Excel/
│   └── FinTech_Payment_Transactions_Analysis.xlsx
│
├── SQL/
│   └── FinTech_Payment_Analysis.sql
│
├── Dashboard/
│   └── Fintech_payment_Dashboard.png
│
└── README.md


### One important correction

Your README currently says **“Percentage of total failures”** under Failure Analysis. If your SQL file actually calculates that percentage, keep it. If it doesn't, remove that bullet.

Also, because your dashboard currently has **four visualizations**, don't claim that the dashboard contains a monthly trend chart unless it is actually there.

Once you upload your **whole project ZIP**, I can check the README against the actual Excel, CSV, SQL and dashboard and give you a final **“ready for GitHub / needs fixing”** verdict.
