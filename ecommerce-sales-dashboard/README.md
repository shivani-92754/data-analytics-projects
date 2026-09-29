# 🛒 E-Commerce Sales Dashboard (Excel)

An interactive Excel dashboard that lets stakeholders pick a **product category** and instantly see its **month-wise and region-wise sales trend**, along with profit, quantity and shipment-aging insights, built from 51,290 e-commerce orders.

> **Tools:** Microsoft Excel · Form Controls (combo box) · Data Analysis Add-in
> **Dataset:** Sales Data sheet (51,290 orders × 21 fields) · **Type:** Course-end project (Business Analytics with Excel)

---

## 🎯 Project Overview

**Scenario:** As a data analyst for an e-commerce company with a global customer network, management provided sales data and wanted actionable insights to improve business performance.

**Task:** Build a dashboard so stakeholders can select a product category and immediately see the month-wise and region-wise sales trend for it.

---

## 📊 Dataset Snapshot

| Orders | Fields | Product Categories | Regions | Countries | Period |
|:---:|:---:|:---:|:---:|:---:|:---:|
| 51,290 | 21 | 4 | 13 | 147 | Jan – Dec 2015 |

| Total Sales | Total Profit | Categories |
|:---:|:---:|:---|
| $8,023,381 | $3,729,903 | Fashion, Home & Furniture, Auto & Accessories, Electronic |

**Key fields:** Order ID, Order Date, Ship Date, **Aging** (days between order and shipment), Ship Mode, Product Category, Product, Sales, Quantity, Discount, Profit, Shipping Cost, Order Priority, Customer details, Segment, City, State, Country, Region and Months.

---

## 🧱 How the Dashboard Was Built

| Step | What I did |
|------|-----------|
| **1. Data preparation** | Loaded 51,290 orders into the *Sales Data* sheet as an Excel Table. The `Aging` field (ship lag in days) feeds a histogram |
| **2. Summary tables** | On the *Working Sheet*, built month-wise Sales and Profit tables and a region-wise Sales table using `SUMIFS`, all recalculating from the raw orders |
| **3. Combo box control** | Added a Form Control combo box to select the Product Category. Its linked cell drives every table and chart |
| **4. Charts and assembly** | Created month-wise and region-wise column charts, the aging histogram and KPI callouts, then combined them into one dashboard canvas |

### Sample formula pattern
```excel
=SUMIFS(Table1[Sales], Table1[Months], [@Months], Table1[Product Category], $I$23)
```
`$I$23` is the combo box's linked cell, so changing the category updates every table and chart at once.

### Excel skills used
- Excel Tables and structured references
- `SUMIFS` for dynamic, criteria-based aggregation
- Form Control combo box linked to a cell
- Data Analysis Add-in histogram with custom bins
- Column charts and KPI callouts
- Dashboard layout and design

---

## 📈 Results

### Dashboard view: Auto & Accessories

| Total Sales | Total Profit | Total Quantity |
|:---:|:---:|:---:|
| $1,097,139 | $484,278 | 22,395 |

**Top regions by sales:**

| Region | Sales |
|--------|------:|
| Central | $227,929 |
| South | $139,614 |
| EMEA | $102,947 |
| Africa | $102,156 |
| North | $100,025 |
| West | $75,109 |

The smallest regions are Caribbean ($32,493) and Canada ($10,382).

### Category benchmark (all orders)

| Category | Sales | Profit | Quantity |
|----------|------:|-------:|---------:|
| Fashion | $5.21M | $2.48M | 92,071 |
| Home & Furniture | $1.32M | $0.59M | 31,055 |
| Auto & Accessories | $1.10M | $0.48M | 22,395 |
| Electronic | $0.39M | $0.17M | 8,211 |

### Shipment aging (all orders)

| Ship time | Orders | Share |
|-----------|-------:|------:|
| 0–1 day | 7,467 | 14.6% |
| 2–5 days | 19,646 | 38.3% |
| 6–9 days | 19,286 | 37.6% |
| 10 days | 4,891 | 9.5% |

---

## 💡 Key Insights

1. **Central is the anchor market** for Auto & Accessories. Its $227,929 in sales is about 1.6× the next-closest region, South ($139,614).
2. **Sales are seasonally steady.** Monthly sales stay within an $85K–$97K band all year, with October, June, April and March the strongest months.
3. **Shipping is mostly fast.** About 90% of all orders ship within 9 days, and none take longer than 10.
4. **Category context matters.** Fashion drives 65% of all revenue and outsells Auto & Accessories nearly 5-to-1. Auto & Accessories is the #3 category.
5. **Auto & Accessories is healthy on margin,** with a profit margin of about 44%.

## ✅ Recommendations

1. **Double down on Central and South** for Auto & Accessories. Together they make up over a third (about 33.5%) of the category's revenue.
2. **Investigate the weakest regions.** Canada and the Caribbean trail far behind (under $33K each), so localized promotions or stock issues may be at play.
3. **Repeat the view for Fashion and Home & Furniture** using the combo box, since both outsell Auto & Accessories today.
4. **Keep monitoring the aging histogram.** Flag any month where the slowest-shipping bin grows.

---

## 📁 Repository Structure

```
├── Ecommerce Sales Dashboard.xlsx                    # Workbook: Sales Data + Working Sheet dashboard
├── Ecommerce_Sales_Dashboard (Presentation).pdf      # Project presentation
└── README.md
```

## 🚀 How to Use

1. Download `Ecommerce Sales Dashboard.xlsx` and open it in **Microsoft Excel** (desktop version, since Form Controls don't work in Excel for the web).
2. Go to the **Working Sheet**.
3. Use the **Product Category** combo box to switch between Auto & Accessories, Fashion, Home & Furniture and Electronic.
4. Watch the tables, charts and KPI totals update instantly.

---

## 👤 Author

**Shivani Sharma**: Data Analyst | Generative AI
📧 shivani92754@gmail.com · 🔗 [LinkedIn](https://linkedin.com/in/shivani-sharma-517636413) · 🌐 [Portfolio](https://your-portfolio-link)
