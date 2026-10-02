# 📊 Regional Sales Analysis Dashboard (Tableau)

An interactive Tableau dashboard that lets management compare **any two regions side by side** across five key sales KPIs, built on the Sample – Superstore dataset.

> **Tools:** Tableau Desktop · **Dataset:** Sample – Superstore (Orders, 9,994 rows) · **Type:** Course-end project (Data Visualization Using Tableau)

---

## 🎯 Project Overview

Sales performance analysis is central to strategic planning. The goal of this project was to build a dashboard that allows upper management and regional teams to:

- Compare two regions on demand, without rebuilding any charts
- Spot regional trends and identify areas for improvement
- Support data-driven sales strategy decisions

**Business scenario:** *As a data analyst, compare sales data from two regions and visualize it on a dashboard, highlighting regional trends and improvement areas.*

---

## 🧱 How It Was Built

| Step | What I did |
|------|-----------|
| **1. Region parameters** | Created two list parameters, **Primary Region** and **Secondary Region**, each with the values Central, East, South, West |
| **2. Calculated filters** | Built a *Primary Region Filter* and a *Secondary Region Filter* that compare `[Region]` to each parameter, isolating the selected data |
| **3. KPI worksheets** | Built 5 metrics × 2 regions = **10 worksheets** |
| **4. Unified dashboard** | Combined all worksheets into one dashboard using containers, split into Primary and Secondary sections with parameter controls |

### KPIs tracked

1. **Total Sales**: sum of Sales
2. **Average Sales per Order**: sales divided by distinct orders
3. **Total Orders**: distinct count of Order ID
4. **Unique Customers**: distinct count of Customer ID
5. **Distinct Products**: distinct count of Product ID

### Key Tableau concepts used

- List parameters for dynamic user input
- Calculated fields as parameter-driven filters
- Distinct count (`COUNTD`) aggregations
- Dashboard containers and layout design
- Reusable worksheet structure across two comparison panels

---

## 📈 Results

Default dashboard view: **Primary = South · Secondary = East**

| Metric | South (Primary) | East (Secondary) |
|--------|----------------:|-----------------:|
| Total Sales | $391,722 | $678,781 |
| Avg Sales / Order | $241.80 | $238.34 |
| Total Orders | 822 | 1,401 |
| Unique Customers | 512 | 674 |
| Distinct Products | 1,057 | 1,422 |

### All-region benchmark

| Region | Sales | Orders | Customers |
|--------|------:|-------:|----------:|
| West | $725,458 | 1,611 | 686 |
| East | $678,781 | 1,401 | 674 |
| Central | $501,240 | 1,175 | 629 |
| South | $391,722 | 822 | 512 |

---

## 💡 Key Insights

1. **West is the growth engine.** It has the highest sales ($725K), the most orders (1,611) and the widest product assortment (1,509 products).
2. **South is under-penetrated.** It has the lowest sales, orders and customer count of all four regions, despite the highest average order value.
3. **Order value doesn't track volume.** South's average sales per order ($241.80) edges out East ($238.34), even though East sells 73% more overall.
4. **Central lags on efficiency.** It is second in order count (1,175) but has the lowest average order value ($215.77).

## ✅ Recommendations

1. Prioritize **customer acquisition campaigns in South** to close the volume gap with East and West.
2. Study East and West's **product assortment strategy** and extend high-performing products into Central and South.
3. Investigate Central's lower average order value, since **bundling or upsell tactics** could lift ticket size.
4. Use the dashboard's parameter controls in **monthly reviews** to track any two regions against each other over time.

---

## 📁 Repository Structure

```
├── Regional Sales Analysis (Tableau).twb          # Tableau workbook
├── Regional_Sales_Analysis (Presentation).pdf     # Project presentation (10 slides)
├── Regional Sales Analysis (Tableau).pdf file.pdf # Dashboard & worksheet export
└── README.md
```

## 🚀 How to Use

1. Clone or download this repository.
2. Download the **Sample – Superstore** dataset (`Sample - Superstore.xls`), which is included with Tableau Desktop under *Connect → Saved Data Sources*.
3. Open the `.twb` file in Tableau Desktop. If prompted, re-point the data source to your local copy of the Superstore file.
4. Open the **Regional Sales Analysis Dashboard** and use the **Primary Region** and **Secondary Region** controls to compare any two regions.

> The `.twb` file references the data by file path, so it will need to be re-linked on your machine.

---

## 👤 Author

**Shivani Sharma**: Data Analyst | Generative AI
📧 shivani92754@gmail.com · 🔗 [LinkedIn](https://linkedin.com/in/shivani-sharma-517636413) · 🌐 [Portfolio](https://shivani-sharma-portfilio-com.netlify.app)
