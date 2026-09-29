# Financial Fraud Detection — Anomaly Detection in Credit Card Transactions

A multi-tool analysis of credit card transaction data to identify fraud patterns, built for **SecureGuard Financial Solutions** (case-study context). The project uses **Excel, SQL, Python, and Tableau** to explore the same dataset from four different angles — statistical summaries, database querying, exploratory data analysis, and interactive visualization.

## Problem Statement

Design a fraud detection system to identify fraudulent credit card transactions in real time — detecting unauthorized transactions, unusual spending patterns, and fraudulent card usage to prevent financial losses for cardholders and institutions.

## Dataset

- **389,002** transactions
- **22** variables (transaction amount, category, merchant, location, timestamp, cardholder demographics, fraud label, etc.)
- **14** merchant categories, **693** unique merchants, **51** states
- **0** missing values
- **2,252** transactions flagged as fraudulent (**0.58%** fraud rate)

## Tools & What Each One Did

### 📊 Excel
- Statistical summaries (mean, std dev, skewness) on transaction amount and city population
- Pivot table: transactions by gender × category
- Top 3 states by transaction volume (TX, NY, PA)
- Correlation check: transaction amount vs. city population (r = 0.0073 — no relationship)
- Average transaction amount by job role (492 roles compared)

### 🗄️ SQL
- Schema design joining transaction and location data
- Fraud volume & percentage query
- Peak spending day analysis (`GROUP BY` day of week)
- Fraud counts by merchant category

### 🐍 Python
- Full EDA: distributions, missing-value checks, outlier detection (IQR method)
- Skewness analysis (amount field is heavily right-skewed, skewness ≈ 40.3)
- Correlation of all numeric features against the fraud target — transaction amount is the strongest predictor (r = 0.21)
- Fraud rate by category (as a % of category volume, not just raw counts)

### 📈 Tableau
- **Box & Whisker Plot** — transaction amount spread by gender, with outliers
- **Fraud Map** — geographic clustering of fraudulent transactions
- **Time Series** — monthly transaction volume trend
- **Inflation-Adjusted Amounts** — weekly transaction totals adjusted for purchasing power

## Key Findings

1. **Fraud is rare but severe** — just 0.58% of transactions are fraudulent, yet they average **$518** vs. **$68** for genuine transactions (7.6× higher).
2. **Transaction amount is the strongest numeric predictor of fraud** (r = 0.21) — far ahead of location, age, or city population, all of which show near-zero correlation.
3. **Digital-first categories carry the highest fraud rates** — `shopping_net` (1.63%), `misc_net` (1.50%), and `grocery_pos` (1.41%) — while routine in-person spending is comparatively safe.
4. **The dataset is clean but heavily skewed** — zero missing values, but tens of thousands of legitimate outliers that a fraud model should learn from rather than discard.

## Files in This Folder

- `Financial Fraud Detection (Problem Statement).pdf` — case brief
- `Excel (Task)...` — Excel workbook / exported PDF
- `SQL (Task)...sql` — SQL schema and queries
- `Python (Task)...ipynb` — Jupyter notebook with full EDA
- `Tableau (Task)...twb` — Tableau workbook
- `Financial_Fraud_Detection.pptx` — summary presentation

## Presentation

A full slide deck summarizing this project (problem, methodology, findings, and dashboard visuals) is included in this folder.
