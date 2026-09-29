# Data Loading:
-- Create a schema named finance, set finance as the default schema, 
-- and create tables with cc_data.csv and location_data.csv.

CREATE SCHEMA finance;

USE finance;

# 4. Data Exploration with SQL:
-- Calculate the total number of transactions in the cc_data table
SELECT COUNT(*) AS total_transactions FROM cc_data;

-- Identify the top 10 most frequent merchants in the cc_data table
SELECT merchant, COUNT(*) AS transactions_count FROM cc_data
GROUP BY merchant
ORDER BY transactions_count DESC
LIMIT 10;

-- Find the average transaction amount for each category of transactions in the cc_data table
SELECT category, AVG(amt) AS average_transactions_amount FROM cc_data
GROUP BY category
ORDER BY average_transactions_amount DESC;

-- Determine the number of fraudulent transactions and the percentage of total transactions that they represent
SELECT SUM(is_fraud) AS fraud_transactions, ROUND((SUM(is_fraud) / COUNT(*)) * 100, 2) AS fraud_percentage FROM cc_data;

-- Join the cc_data and location_data tables to identify the latitude and longitude of each transaction
SELECT c.trans_date_trans_time, c.cc_num, c.merchant, l.lat, l.long FROM cc_data c
JOIN location_data l
ON c.cc_num = l.cc_num;

-- Identify the city with the highest population in the location_data table
SELECT city, MAX(city_pop) AS highest_population FROM cc_data
GROUP BY city
ORDER BY highest_population DESC
LIMIT 1;

-- Find the earliest and latest transaction dates in the cc_data table
SELECT
	MIN(trans_date_trans_time) AS earliest_date,
    MAX(trans_date_trans_time) AS latest_date
FROM cc_data;

# 5. Using Data Aggregation with SQL:
-- What is the total amount spent across all transactions in the cc_data table?
SELECT SUM(amt) AS total_amount_spent FROM cc_data;

-- How many transactions occurred in each category in the cc_data table?
SELECT category, COUNT(*) AS transactions_count FROM cc_data
GROUP BY category;

-- What is the average transaction amount for each gender in the cc_data table?
SELECT gender, AVG(amt) AS avg_transaction_amount FROM cc_data
GROUP BY gender;

-- Which day of the week has the highest average transaction amount in the cc_data table?
SELECT DAYNAME(STR_TO_DATE(trans_date_trans_time, '%D-%M-%Y %H:%i')) AS day_of_week, AVG(amt) AS avg_transaction_amount
FROM cc_data
GROUP BY day_of_week
ORDER BY avg_transaction_amount DESC
LIMIT 1;










