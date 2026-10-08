-- =====================================================
-- FINTECH PAYMENT TRANSACTION ANALYSIS
-- =====================================================
-- Dataset: 500 Synthetic Payment Transactions
-- Tools: MySQL + Excel
-- Purpose: Analyze payment transaction performance,
-- payment methods, banks, failures and customer trends.
-- =====================================================
-- =====================================================-- =====================================================
-- 10. PROJECT SUMMARY
-- =====================================================
-- Key findings:
-- 1. Total transactions: 500
-- 2. Total transaction value: INR 850,222.76
-- 3. Successful transactions: 422
-- 4. Overall success rate: 84.40%
-- 5. Failed transactions: 60
-- 6. UPI was the most-used payment method.
-- 7. HDFC Bank had the highest transaction volume.
-- 8. State Bank of India had the highest bank failure rate.
-- 9. Fraud Check was the most common failure reason.
--
-- Business recommendations:
-- 1. Investigate fraud-check related payment failures.
-- 2. Review SBI failure patterns and root causes.
-- 3. Monitor UPI performance because of its high transaction volume.
-- 4. Track failure reasons regularly to improve payment success.
-- =====================================================

-- 1. SELECT DATABASE
-- =====================================================

USE fintech_analysis;
-- =====================================================
-- 2. DATA OVERVIEW
-- =====================================================

-- Total number of transactions
SELECT COUNT(*) AS Total_Transactions
FROM transactions;
-- Check for duplicate Transaction IDs
SELECT
    Transaction_ID,
    COUNT(*) AS Duplicate_Count
FROM transactions
GROUP BY Transaction_ID
HAVING COUNT(*) > 1;

SELECT COUNT(*) AS Total_Transactions
FROM transactions;

-- =====================================================
-- 3. KPI ANALYSIS
-- =====================================================
-- Total transaction value
SELECT
    ROUND(SUM(Amount_INR), 2) AS Total_Transaction_Value
FROM transactions;
-- Successful transactions
SELECT
    COUNT(*) AS Successful_Transactions
FROM transactions
WHERE Status = 'Success';

-- Failed transactions
SELECT
    COUNT(*) AS Failed_Transactions
FROM transactions
WHERE Status = 'Failed';

-- Pending transactions
SELECT
    COUNT(*) AS Pending_Transactions
FROM transactions
WHERE Status = 'Pending';
-- Overall success rate
SELECT
    ROUND(
        100.0 * SUM(CASE WHEN Status = 'Success' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS Success_Rate_Percent
FROM transactions;
-- =====================================================
-- 4. PAYMENT METHOD ANALYSIS
-- =====================================================
-- Transaction volume by payment method
SELECT
    Payment_Method,
    COUNT(*) AS Transaction_Count
FROM transactions
GROUP BY Payment_Method
ORDER BY Transaction_Count DESC;

-- Transaction value by payment method
SELECT
    Payment_Method,
    ROUND(SUM(Amount_INR), 2) AS Total_Transaction_Value
FROM transactions
GROUP BY Payment_Method
ORDER BY Total_Transaction_Value DESC;

-- Success rate by payment method
SELECT
    Payment_Method,
    COUNT(*) AS Total_Transactions,
    SUM(CASE WHEN Status = 'Success' THEN 1 ELSE 0 END) AS Successful_Transactions,
    ROUND(
        100.0 * SUM(CASE WHEN Status = 'Success' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS Success_Rate_Percent
FROM transactions
GROUP BY Payment_Method
ORDER BY Success_Rate_Percent DESC;
-- =====================================================
-- 5. BANK PERFORMANCE ANALYSIS
-- =====================================================
-- Transaction volume by bank
SELECT
    Bank,
    COUNT(*) AS Total_Transactions
FROM transactions
GROUP BY Bank
ORDER BY Total_Transactions DESC;

-- Transaction value by bank
SELECT
    Bank,
    ROUND(SUM(Amount_INR), 2) AS Total_Transaction_Value
FROM transactions
GROUP BY Bank
ORDER BY Total_Transaction_Value DESC;

-- Failure rate by bank
SELECT
    Bank,
    COUNT(*) AS Total_Transactions,
    SUM(CASE WHEN Status = 'Failed' THEN 1 ELSE 0 END) AS Failed_Transactions,
    ROUND(
        100.0 * SUM(CASE WHEN Status = 'Failed' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS Failure_Rate_Percent
FROM transactions
GROUP BY Bank
ORDER BY Failure_Rate_Percent DESC;
-- =====================================================
-- 6. FAILURE ANALYSIS
-- =====================================================
-- Failed transactions by failure reason
SELECT
    Failure_Reason,
    COUNT(*) AS Failed_Transactions
FROM transactions
WHERE Status = 'Failed'
GROUP BY Failure_Reason
ORDER BY Failed_Transactions DESC;

-- Failure reason as a percentage of all failed transactions
SELECT
    Failure_Reason,
    COUNT(*) AS Failed_Transactions,
    ROUND(
        100.0 * COUNT(*) /
        (SELECT COUNT(*) FROM transactions WHERE Status = 'Failed'),
        2
    ) AS Percentage_of_Failures
FROM transactions
WHERE Status = 'Failed'
GROUP BY Failure_Reason
ORDER BY Failed_Transactions DESC;

-- Failure reasons by bank
SELECT
    Bank,
    Failure_Reason,
    COUNT(*) AS Failed_Transactions
FROM transactions
WHERE Status = 'Failed'
GROUP BY Bank, Failure_Reason
ORDER BY Bank, Failed_Transactions DESC;

-- =====================================================
-- 7. CITY ANALYSIS
-- =====================================================
-- Transaction performance by city
SELECT
    City,
    COUNT(*) AS Total_Transactions,
    ROUND(SUM(Amount_INR), 2) AS Total_Transaction_Value
FROM transactions
GROUP BY City
ORDER BY Total_Transaction_Value DESC;
-- =====================================================
-- 8. CUSTOMER TYPE ANALYSIS
-- =====================================================
-- Transaction performance by customer type
SELECT
    Customer_Type,
    COUNT(*) AS Total_Transactions,
    ROUND(SUM(Amount_INR), 2) AS Total_Transaction_Value
FROM transactions
GROUP BY Customer_Type
ORDER BY Total_Transactions DESC;

-- =====================================================
-- 9. MONTHLY TRANSACTION TREND
-- =====================================================
-- Monthly transaction trend
SELECT
    DATE_FORMAT(Transaction_Date, '%Y-%m') AS Transaction_Month,
    COUNT(*) AS Total_Transactions,
    ROUND(SUM(Amount_INR), 2) AS Total_Transaction_Value
FROM transactions
GROUP BY Transaction_Month
ORDER BY Transaction_Month;
