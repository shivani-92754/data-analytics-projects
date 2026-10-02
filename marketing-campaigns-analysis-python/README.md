# 📣 Marketing Campaigns Analysis (Python)

An exploratory data analysis and hypothesis-testing project that examines the **marketing mix (product, price, place and promotion)** to understand what drives customer acquisition and campaign response.

> **Tools:** Python · pandas · NumPy · matplotlib · seaborn · SciPy · Jupyter Notebook
> **Dataset:** `marketing_data.csv` (2,240 customers × 28 columns) · **Type:** Course-end project

---

## 🎯 Project Overview

As a data analyst, the task was to examine variables such as birth year, education, income, product expenditure, sales channels and promotional outcomes, and to measure how each of the four Ps influences whether a customer is acquired and retained.

**Goal:** A data-driven report that helps optimize marketing strategy, refine product offerings and improve customer engagement.

### Dataset at a glance

| Customer records | Original columns | Missing incomes found | Columns engineered |
|:---:|:---:|:---:|:---:|
| 2,240 | 28 | 24 | 5 |

**Key fields:** `Year_Birth`, `Education`, `Marital_Status`, `Income`, `Kidhome` / `Teenhome`, `Dt_Customer`, `Recency`, six spending categories (`MntWines` … `MntGoldProds`), four purchase-channel counts, campaign-acceptance flags (`AcceptedCmp1–5`, `Response`) and `Country`.

---

## 🧱 How the Analysis Was Built

### 1. Data preparation
- Cleaned column names and converted `Income` from text (e.g. `$84,835.00`) to a numeric type
- Converted `Dt_Customer` to a proper datetime

### 2. Data quality
- Simplified categories: `2n Cycle` → Master, `Basic` → Undergraduate; `Together` → Married; `Divorced`, `Widow`, `Alone`, `YOLO`, `Absurd` → Single
- Filled the 24 missing incomes with the **group mean by education and marital status**, rather than one overall average

### 3. Feature engineering

| New variable | Definition |
|--------------|-----------|
| `Age` | 2014 − `Year_Birth` |
| `Spending` | Sum of the six product-spend categories |
| `Children_count` | `Kidhome` + `Teenhome` |
| `has_children` | 1 if `Children_count` > 0, else 0 |
| `total_purchases` | Deals + Web + Catalog + Store purchases |

### 4. Outlier treatment
Box plots and the 1.5 × IQR rule were used on Income, Spending, Age and Total Purchases. Extreme values were **capped**, not dropped, so no rows were lost.

| Variable | Lower bound | Upper bound |
|----------|------------:|------------:|
| Income | −13,588 | 117,416 |
| Spending | −1,396 | 2,511 |
| Age | 10 | 82 |
| Total purchases | −11.5 | 40.5 |

### 5. Encoding
- **Ordinal encoding** for `Education` (Undergraduate = 1, Graduation = 2, Master = 3, PhD = 4)
- **One-hot encoding** for `Marital_Status` and `Country` with `pd.get_dummies(drop_first=True)`

### 6. Analysis
- Correlation heatmap across six variables
- Welch's t-test on Spending for customers who did and did not accept Campaign 5
- Visualizations of product performance, campaign acceptance by age and country, family size vs spending, complaints by education, and income vs spending

---

## 📈 Results

### Correlation analysis

| Relationship | Correlation | Reading |
|--------------|:-----------:|---------|
| Income ↔ Spending | **+0.80** | Higher-income customers spend substantially more |
| Spending ↔ Total purchases | **+0.75** | Bigger spenders also transact more often |
| Children count ↔ Spending | **−0.50** | Households with more children spend less |
| Recency ↔ everything else | **≈ 0** | Days since last purchase has almost no linear relationship with other metrics |

### Hypothesis test

- **H₀:** Mean spending is the same for customers who accepted Campaign 5 and those who didn't.
- **H₁:** Mean spending differs between the two groups.
- **Method:** Welch's t-test (`stats.ttest_ind(equal_var=False)`)
- **Result:** t = **31.30**, p ≈ **2.1 × 10⁻⁸⁰**, so **H₀ is rejected**. Spending is a strong, statistically significant predictor of campaign acceptance.

### Total spending by product

| Product | Total spend |
|---------|------------:|
| Wines | 680,816 |
| Meat Products | 373,968 |
| Gold Products | 98,609 |
| Fish Products | 84,057 |
| Sweet Products | 60,621 |
| Fruits | 58,917 |

---

## 💡 Key Insights

1. **Spending predicts campaign response.** Target high-spend segments for future promotions.
2. **Income is the strongest driver of spend.** The +0.80 correlation comes with a break-point near $40K, so tiering offers around that threshold makes sense.
3. **Wine and meat lead product spend.** Together they make up roughly 78% of total product spending, so they are the priority for inventory and promotion.
4. **Children reduce discretionary spend.** Family-sized bundles may resonate more than premium upsells.
5. **Spain is the core acceptance market.** 89 customers accepted the last campaign, more than 4× the next-highest countries (Canada and South Africa at 21 each). Mexico recorded zero.
6. **Complaints skew toward Graduation-level customers.** They account for 14 of 21 complaints.

## ✅ Recommendations

- Focus promotions on **high-spend, high-income segments** for the best campaign response.
- Design **tiered offers around the ~$40K income break-point**.
- Prioritize **wine and meat** in inventory and promotion planning.
- Concentrate promotional budget in **Spain**, and test what is underperforming in Mexico and the other low-acceptance markets.
- Use **family bundles** for households with children.
- Run **re-engagement campaigns** for the high-income, low-spend outliers.

---

## 🛠️ Skills Demonstrated

- Data cleaning and type conversion
- Group-based missing-value imputation
- Feature engineering
- Outlier detection and treatment (IQR method)
- Categorical encoding (ordinal and one-hot)
- Correlation analysis
- Hypothesis testing (Welch's t-test)
- Data visualization with matplotlib and seaborn
- Turning analysis into business recommendations

---

## 📁 Repository Structure

```
├── Marketing Campaigns Analysis.ipynb                  # Full analysis notebook
├── Marketing_Campaigns_Analysis (Presentation).pdf     # Project presentation
├── marketing_data.csv                                  # Dataset (add this file)
└── README.md
```

## 🚀 How to Run

1. Clone or download this repository.
2. Install the requirements:
   ```bash
   pip install pandas numpy matplotlib seaborn scipy jupyter
   ```
3. Place `marketing_data.csv` in the same folder as the notebook.
4. Launch Jupyter, open `Marketing Campaigns Analysis.ipynb` and run all cells:
   ```bash
   jupyter notebook
   ```

---

## 👤 Author

**Shivani Sharma**: Data Analyst | Generative AI
📧 shivani92754@gmail.com · 🔗 [LinkedIn](https://linkedin.com/in/shivani-sharma-517636413) · 🌐 [Portfolio](https://shivani-sharma-portfilio-com.netlify.app)
