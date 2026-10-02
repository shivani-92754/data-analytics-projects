# 🛡️ Financial Fraud Detection: Anomaly Detection in Credit Card Transactions

An end-to-end fraud analysis of **389,002 credit card transactions**, built across **Excel, SQL, Python and Tableau** to detect and explain anomalous (fraudulent) transaction patterns.

> **Tools:** Excel · MySQL · Python (pandas, matplotlib, seaborn) · Tableau
> **Dataset:** `cc_data.csv` + `location_data.csv` · **Type:** Capstone project (SecureGuard Financial Solutions)

---

## 🎯 Project Overview

SecureGuard Financial Solutions builds real-time fraud detection systems for the financial industry. As online payments grow, so does the risk of unauthorized transactions, identity theft and unusual spending patterns.

**Problem statement:** Design a fraud detection approach that identifies fraudulent credit card transactions, including unauthorized use, unusual spending patterns and fraudulent card usage, to prevent financial loss for cardholders and institutions.

**Approach:** Analyze the transaction data with four tools, each covering a different layer of the problem.

| Tool | Role in the project |
|------|--------------------|
| **Excel** | Statistical summaries, pivot reports (fraud by gender and category), correlation checks |
| **SQL** | Schema design, table joins and aggregation queries to quantify fraud volume, merchants and spending |
| **Python** | Full EDA: distributions, missing values, outliers, correlation with the fraud target |
| **Tableau** | Interactive dashboard: box plots, geographic fraud map, time series, inflation-adjusted amounts |

---

## 📊 Dataset Snapshot

| Transactions | Variables | Merchant Categories | Unique Merchants | States | Missing Values |
|:---:|:---:|:---:|:---:|:---:|:---:|
| 389,002 | 22 | 14 | 693 | 51 | 0 |

| Fraud Cases | Fraud Rate | Non-Fraud Rate |
|:---:|:---:|:---:|
| 2,252 | **0.58%** | 99.42% |

The data covers transaction details, customer info, merchant info, location, amount, time, and the target label `is_fraud`. It is **highly imbalanced**, which any future model would need to handle.

---
## Problem Statement
- Credit card fraud is rare (under 1% of transactions) but costly, and manual review of every transaction isn't feasible at scale. This project analyzes 389K+ transactions to identify the strongest predictors of fraud, so a business could flag suspicious activity automatically instead of reviewing everything.
---

## 🔍 Analysis by Tool

### 1. Excel
- Pivot report of all transactions by **gender × category** (Female: 213,231 · Male: 175,771)
- **Top 3 states** by volume: TX (28,482), NY (25,034), PA (23,911)
- Correlation of transaction amount vs city population: **r = 0.0073**, so city size is not a useful predictor
- Average transaction amount across 492 job roles, most clustering around $70–$90

### 2. SQL
Created a `finance` schema and loaded `cc_data` and `location_data`, then wrote queries to:

| Task | SQL concepts |
|------|--------------|
| Total number of transactions | `COUNT` |
| Top 10 most frequent merchants | `GROUP BY`, `ORDER BY`, `LIMIT` |
| Average transaction amount by category | `AVG`, `GROUP BY` |
| Fraud count and fraud percentage | `SUM`, `ROUND` |
| Latitude/longitude of each transaction | `JOIN` on `cc_num` |
| City with the highest population | `MAX`, `GROUP BY` |
| Earliest and latest transaction dates | `MIN`, `MAX` |
| Total amount spent | `SUM` |
| Transactions per category | `COUNT`, `GROUP BY` |
| Average amount by gender | `AVG`, `GROUP BY` |
| Day of week with the highest average amount | `DAYNAME`, `STR_TO_DATE` |

### 3. Python (EDA)
- **Data quality:** zero missing values, no duplicate transaction numbers, and checks for invalid amounts, coordinates and ages
- **Distributions:** summary statistics, skewness, histograms and box plots. Transaction amount is heavily right-skewed (skewness ≈ 40.3)
- **Outliers (IQR method):** **20,377** in transaction amount and **72,813** in city population. These were **kept, not removed**, because in fraud detection the outliers are often the signal
- **Fraud drivers:** correlation with `is_fraud`, fraud rate by category and gender, and monthly transaction trends
- **Written EDA report** included at the end of the notebook

### 4. Tableau
An interactive dashboard built from `cc_data.csv`:
- **Box and whisker plot:** amount spent by gender across categories
- **Fraud map:** latitude/longitude plot colored by `is_fraud`
- **Time series:** monthly transaction count trend
- **Inflation-adjusted amounts:** calculated field applying a 2% annual inflation adjustment

---

## 📈 Key Findings

### Average transaction amount

| Non-Fraud | Fraud | Difference |
|:---:|:---:|:---:|
| ~$68 | ~$518 | **≈ 7.6× higher** |

### Fraud rate by category

| Category | Fraud rate | Fraud cases |
|----------|-----------:|------------:|
| Shopping (net) | 1.63% | 478 |
| Misc (net) | 1.50% | 287 |
| Grocery (pos) | 1.41% | 518 |
| Shopping (pos) | 0.72% | 253 |
| Gas / Transport | 0.49% | 193 |

Grocery (pos) has the most fraud *cases*, but Shopping (net) has the highest fraud *rate*.

### Insights

1. **Fraud is rare but severe.** Only 0.58% of transactions are fraudulent, yet they average 7.6× the size of genuine purchases.
2. **Transaction amount is the strongest numeric fraud signal** (r ≈ 0.21). Age, location and city population show near-zero correlation.
3. **Digital-first categories carry the highest fraud rates.** Online shopping and misc. net purchases are riskier than routine in-person spending.
4. **The data is clean but heavily skewed.** Tens of thousands of legitimate outliers should be learned from, not discarded.

## ✅ Recommendations

- Use **transaction-level features** (amount, category, timing) rather than demographic proxies like city size when building a fraud model.
- Apply **extra screening to online shopping and misc. net purchases** and to high-value transactions.
- Handle the **class imbalance** with resampling, class weights or precision/recall-focused metrics, since accuracy alone would be misleading at 99.42% non-fraud.
- **Keep outliers** in training data for any future machine-learning model.

---

## 📁 Repository Structure

```
├── Excel (Task)_ Financial Fraud Detection ... .pdf          # Excel analysis and pivot summary
├── SQL (Task)_ Financial Fraud Detection ... .sql            # SQL queries
├── Python (Task)_ Financial Fraud Detection ... .ipynb       # EDA notebook with written report
├── Tableau (Task)_ Financial Fraud Detection ... .twb        # Tableau workbook and dashboard
├── Financial Fraud Detection ... (Presentation).pdf          # Project presentation
└── README.md
```

## 🚀 How to Run

**Python:**
```bash
pip install pandas matplotlib seaborn jupyter
jupyter notebook
```
Place `cc_data.csv` in the same folder as the notebook and run all cells.

**SQL:** In MySQL Workbench, run the schema lines, import `cc_data.csv` and `location_data.csv` into the `finance` schema, then run the queries in order.

**Tableau:** Open the `.twb` in Tableau Desktop and re-point the data source to your local `cc_data.csv`.

> The source CSV files are not included in this repository. Add them if you want others to reproduce the results.

---

## 🛠️ Skills Demonstrated

- Multi-tool analytics workflow (Excel, SQL, Python, Tableau)
- Data cleaning and quality validation
- Exploratory data analysis and outlier detection
- Working with heavily imbalanced data
- SQL joins and aggregation
- Interactive dashboard design
- Communicating findings to a business audience

---

## 👤 Author

**Shivani Sharma**: Data Analyst | Generative AI
📧 shivani92754@gmail.com · 🔗 [LinkedIn](https://linkedin.com/in/shivani-sharma-517636413) · 🌐 [Portfolio](https://shivani-sharma-portfilio-com.netlify.app)
