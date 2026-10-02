# 🛍️ Sales Analysis (Python)

A Python data analysis project that uncovers **quarterly sales trends for AAL**, a national clothing retailer, at the daily, monthly, state, customer-group and time-of-day level.

> **Tools:** Python · pandas · NumPy · matplotlib · seaborn · scikit-learn · Jupyter Notebook
> **Dataset:** `Sales.csv` (7,560 rows × 6 columns) · **Period:** October – December 2020 · **Type:** Course-end project

---

## 🎯 Project Overview

AAL is a household clothing brand in the U.S., serving kids, women, men and seniors from stores across many states. With the business in expansion mode, management wanted an in-depth read on sales performance to guide **investment, inventory and marketing decisions**.

**Task:** Compile, analyze and illustrate the data using charts and visual representations to derive meaningful insights.

### Dataset

| Column | Description |
|--------|-------------|
| `Date` | Date of sale (Oct – Dec 2020) |
| `Time` | Time of day: Morning, Afternoon or Evening |
| `State` | U.S. state (7 states) |
| `Group` | Customer group: Kids, Men, Women or Seniors |
| `Unit` | Number of units sold |
| `Sales` | Sales amount ($) |

---

## 🧱 How the Analysis Was Built

1. **Prepare and clean**: loaded the CSV, confirmed there are no missing values, and converted `Date` to a proper datetime.
2. **Normalize**: scaled `Unit` and `Sales` to a 0–1 range with `MinMaxScaler`.
3. **Visualize trends**: plotted daily Date vs Unit and Date vs Sales, then split the data into October, November and December sub-frames.
4. **Describe and group**: ran `describe()` overall and per month, drew boxplots of the distributions, and broke totals out by state, group and time of day.

### Techniques used

- Data cleaning and datetime handling
- Min-max normalization
- `groupby` aggregation
- Time-based slicing
- Descriptive statistics
- Line charts, boxplots and bar charts

---

## 📈 Results

### Quarterly snapshot

| Total Units Sold | Total Sales | Avg. Sale |
|-----------------:|------------:|----------:|
| 136,121 | $340,302,500 | $45,013.56 |

### Month by month

| Month | Units Sold | Sales | Share of Quarter Sales |
|-------|-----------:|------:|-----------------------:|
| October | 45,716 | $114,290,000 | 33.6% |
| November | 36,273 | $90,682,500 | 26.7% |
| December | 54,132 | $135,330,000 | 39.8% |

### Sales by state

| State | Sales |
|-------|------:|
| KY | $105.6M |
| NY | $75.0M |
| FL | $58.9M |
| CA | $33.4M |
| TX | $22.8M |
| AZ | $22.6M |
| WA | $22.2M |

### Sales by customer group and time of day

| Group | Sales | | Time of day | Sales |
|-------|------:|-|-------------|------:|
| Men | $85.75M | | Morning | $114.2M |
| Women | $85.44M | | Afternoon | $114.0M |
| Kids | $85.07M | | Evening | $112.1M |
| Seniors | $84.04M | | | |

---

## 💡 Key Insights

1. **December is the growth engine.** Daily sales jump from roughly $2.7M–$4.0M in October and November to a $4.3M–$4.8M plateau from Dec 1 onward, the holiday effect.
2. **November is the soft spot.** Both units (36,273) and sales ($90.68M) hit their quarter lows, with a sharp trough right after Nov 1.
3. **Kentucky is the anchor state.** KY alone drives $105.6M, more than the bottom four states (CA, TX, AZ, WA) combined.
4. **Groups and times of day are remarkably even.** Customer groups sit within about 2% of each other, and so do morning, afternoon and evening. Demand is driven by season, not by segment.

## ✅ Recommendations

1. Build **inventory and staffing plans around the December surge**, stocking up and staffing up well before Dec 1.
2. Investigate November's slump with **targeted promotions or bundles** to smooth the trough between the quarter's two peaks.
3. **Protect and reinvest in Kentucky and New York**, the two anchor states, while testing growth tactics in the smaller five.
4. Since groups and times of day are so evenly matched, prioritize **seasonal campaigns** over group- or time-targeted ones for the biggest lift.

---

## 📁 Repository Structure

```
├── Sales Analysis (Python).ipynb          # Full analysis notebook
├── Sales.csv                              # Dataset
├── Sales_Analysis (Presentation).pdf      # Project presentation (10 slides)
└── README.md
```

## 🚀 How to Run

1. Clone or download this repository.
2. Install the requirements:
   ```bash
   pip install pandas numpy matplotlib seaborn scikit-learn jupyter
   ```
3. Launch Jupyter and open `Sales Analysis (Python).ipynb`:
   ```bash
   jupyter notebook
   ```
4. Keep `Sales.csv` in the same folder as the notebook, then run all cells.

---

## 👤 Author

**Shivani Sharma**: Data Analyst | Generative AI
📧 shivani92754@gmail.com · 🔗 [LinkedIn](https://linkedin.com/in/shivani-sharma-517636413) · 🌐 [Portfolio](https://shivani-sharma-portfilio-com.netlify.app)
