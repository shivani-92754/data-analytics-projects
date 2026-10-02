# ✈️ Air Cargo Analysis (SQL)

A MySQL project that builds a relational **AirCargo** database from four linked datasets and answers **18 business questions** about airline operations, ticketing and revenue using SQL.

> **Tools:** MySQL · MySQL Workbench · **Type:** SQL case-study project

---

## 🎯 Project Overview

The project covers four areas:

| Area | What was done |
|------|---------------|
| **Database design** | Created the `AirCargo` database and an ER diagram linking all four tables |
| **Core queries** | Filtering, joins, subqueries and string functions to profile customers and travel |
| **Advanced SQL** | Window functions, `ROLLUP`, indexing, views and a stored procedure |
| **Administration** | User creation, privilege grants and execution-plan analysis |

### Datasets

| Table | Description |
|-------|-------------|
| `customer` | 50 customer records (name, date of birth, gender) |
| `ticket_details` | 50 bookings across 4 travel classes and 5 airline brands |
| `passengers_on_flights` | 50 flight-passenger records (route, seat, class, travel date) |
| `routes` | Origin, destination and distance for 32 flight routes |

---

## 📊 Dataset Snapshot

| Customers | Tickets Booked | Total Ticket Revenue | Travel Classes | Airline Brands | Flight Routes |
|:---:|:---:|:---:|:---:|:---:|:---:|
| 50 | 50 | $15,369 | 4 | 5 | 32 |

---

## 🔍 What the Queries Cover

| # | Task | SQL concepts |
|---|------|--------------|
| 1–2 | Create the `AirCargo` database, import the CSVs, build the ER diagram | `CREATE DATABASE`, data modeling |
| 3 | Passengers who traveled on routes 1 to 25 | `BETWEEN` |
| 4 | Number of passengers and total revenue in Business class | `SUM`, `WHERE` |
| 5 | Full name of each customer | `CONCAT` |
| 6 | Customers who registered and booked a ticket | `INNER JOIN` |
| 7 | Customers who flew with Emirates | `JOIN`, filter |
| 8 | Customers who traveled Economy Plus | subquery with `IN` |
| 9 | Whether revenue has crossed 10,000 | `IF()` |
| 10 | Create a user and grant access | `CREATE USER`, `GRANT` |
| 11 | Maximum ticket price per class | window function `MAX() OVER (PARTITION BY)` |
| 12 | Passengers on route 4, sped up with an index | `CREATE INDEX` |
| 13 | Execution plan for route 4 | `EXPLAIN` |
| 14 | Total ticket price per customer and aircraft, with subtotals | `GROUP BY ... WITH ROLLUP` |
| 15 | View of Business class customers and brand | `CREATE VIEW` |
| 16 | Routes longer than 2,000 miles | stored procedure |
| 17 | Total tickets and total price paid per customer | `GROUP BY` |
| 18 | Average passengers per flight route | `COUNT DISTINCT`, `ROUND` |

### Highlights

**Window function: highest ticket price within each class**
```sql
SELECT class_id, price_per_ticket,
       MAX(price_per_ticket) OVER (PARTITION BY class_id) AS max_ticket_price
FROM ticket_details;
```

**ROLLUP: per-customer subtotals and a grand total in one query**
```sql
SELECT customer_id, aircraft_id,
       SUM(no_of_tickets * price_per_ticket) AS total_price
FROM ticket_details
GROUP BY customer_id, aircraft_id WITH ROLLUP;
```

**Performance and reusability**
```sql
CREATE INDEX idx_route_id ON passengers_on_flights(route_id);   -- faster route lookups
EXPLAIN SELECT * FROM passengers_on_flights WHERE route_id = 4; -- confirm index use

CREATE VIEW business_class_customers AS ...;                    -- reusable filtered view
CALL Get_Long_Distance_Routes();                                -- stored procedure (> 2,000 miles)
```

---

## 📈 Key Insights

1. **Business and First class drive most revenue.** They bring in $10,919 of the $15,369 total (71%) from just 26 of 50 tickets.
2. **Emirates is the top-earning brand** at $5,634, ahead of Qatar Airways at $4,270.
3. **Every registered customer has also booked a ticket**, so the customer base in the sample is fully matched.
4. **Route-level demand is thin**, at about 1.6 passengers per route on average. There is scope to consolidate or promote low-traffic routes.

### Revenue by travel class

| Class | Revenue |
|-------|--------:|
| Business | $6,034 |
| First Class | $4,885 |
| Economy Plus | $2,460 |
| Economy | $1,990 |

### Revenue by airline brand

| Brand | Revenue |
|-------|--------:|
| Emirates | $5,634 |
| Qatar Airways | $4,270 |
| British Airways* | $3,440 |
| Jet Airways | $2,025 |

*\*Combines two spelling variants of British Airways found in the source data.*

---

## 🛠️ Skills Demonstrated

- Database and schema design, ER modeling
- Filtering, joins and subqueries
- Aggregation and `GROUP BY ... WITH ROLLUP`
- Window functions
- Conditional logic (`IF`)
- Indexing and execution-plan analysis
- Views and stored procedures
- User management and privileges

---

## 📁 Repository Structure

```
├── Air Cargo Analysis (SQL).sql               # All 18 queries
├── ER Digram _Air Cargo Analysis.mwb          # MySQL Workbench model
├── ER Digram _Air Cargo Analysis..png         # ER diagram image
├── Air Cargo Analysis (Presentation).pdf      # Project presentation
└── README.md
```

## 🚀 How to Run

1. Open **MySQL Workbench** and connect to your MySQL server.
2. Run the first lines of the `.sql` file to create the `AirCargo` database.
3. Import `customer.csv`, `ticket_details.csv`, `passengers_on_flights.csv` and `routes.csv` into it (Table Data Import Wizard).
4. Run the remaining queries in order.
5. For Task 10, replace the placeholder password with your own before running.

> The source CSV files are not included in this repository. Add them to the repo if you want others to reproduce the results.

---

## 👤 Author

**Shivani Sharma**: Data Analyst | Generative AI
📧 shivani92754@gmail.com · 🔗 [LinkedIn](https://linkedin.com/in/shivani-sharma-517636413) · 🌐 [Portfolio](https://shivani-sharma-portfilio-com.netlify.app)
