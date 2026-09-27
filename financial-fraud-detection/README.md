# Financial Fraud Detection — Anomaly Detection in Credit Card Transactions

End-to-end fraud analysis on 389,000+ credit card transactions, built across
Excel, SQL, Python, and Tableau to detect and explain anomalous
(fraudulent) transaction patterns.

## Tools
Excel · SQL · Python (Pandas, Matplotlib, Seaborn) · Tableau

## Dataset
389,002 transactions across 22 variables — transaction details, customer
info, merchant info, location, amount, time, and the fraud label (`is_fraud`).
Fraud rate: 0.58% (highly imbalanced).

## What I did

**Excel**
- Built statistical summaries, pivot reports, and correlation analysis to
  get an initial view of transaction patterns and fraud distribution.

**SQL**
- Created a schema and loaded transaction and location data into tables.
- Wrote 13+ queries covering: total transaction counts, top 10 most frequent
  merchants, average transaction amount by category, fraud count and fraud
  percentage, a join across transaction and location tables to map
  latitude/longitude, city with the highest population, and the average
  transaction amount by gender and by day of week.

**Python**
- Cleaned the dataset (checked and handled missing values, verified no
  duplicate transaction numbers).
- Ran summary statistics, skewness, histograms and boxplots on numerical
  variables — transaction amount was highly right-skewed.
- Used the IQR method to flag 20,377 outliers in transaction amount and
  72,813 outliers in city population.
- Found `amt` (transaction amount) had the strongest correlation with fraud
  (r ~ 0.21) — the single strongest numerical predictor in the dataset.
- Found fraudulent transactions averaged ~$518 vs. ~$68 for non-fraudulent
  ones — a large, meaningful gap.
- Identified higher fraud rates in specific categories (shopping_net,
  misc_net, grocery_pos) and analyzed monthly transaction trends.
- Wrote a full EDA report summarizing data quality, distributions, fraud
  patterns, and key predictive factors.

**Tableau**
- Built a 5-view interactive dashboard: a box-and-whisker view for
  transaction amount, a geographic fraud map, time-series fraud trends,
  and an inflation-adjusted calculated field.

## Key findings
- Fraud rate: 0.58% of all transactions.
- Transaction amount is the strongest fraud predictor (r ~ 0.21).
- Fraudulent transactions average ~7.6x higher amount than legitimate ones.
- 20,000+ outliers flagged in transaction amount via IQR analysis.

## Files
- `Excel (Task)_...pdf` — Excel analysis and pivot summary
- `SQL (Task)_...sql` — all SQL queries
- `Python (Task)_...ipynb` — full EDA notebook with charts and written report
- `Tableau (Task)_...twb` — Tableau workbook (5-view dashboard)
- `Financial Fraud Detection...(Presentation).pdf` — summary presentation
