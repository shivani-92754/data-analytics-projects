# 👥 Employee Performance Mapping (SQL)

A MySQL case-study project that designs a relational employee database and answers **16 business questions** in pure SQL, covering employee performance, reporting structure, job-level standardization and compensation.

> **Tools:** MySQL · MySQL Workbench · **Type:** SQL case-study project

---

## 🎯 Project Overview

The goal was to build the **Employee** database from three CSV sources, then use SQL to:

- Profile employees and segment them by performance rating
- Map reporting lines and span of control
- Standardize job levels for the data science team
- Benchmark pay across roles, countries and continents
- Improve query performance with indexing

### Database tables

| Table | Description |
|-------|-------------|
| `emp_record_table` | Core employee master: role, department, experience, salary, rating, manager, project |
| `data_science_team` | Data science staff profiles, used for job-level standardization |
| `proj_table` | Project catalog: domain, timeline and delivery details |

---

## 🔍 What the Queries Cover

| # | Task | SQL concepts |
|---|------|--------------|
| 1–2 | Create the `Employee` database, import the CSVs, build the ER diagram | `CREATE DATABASE`, data modeling |
| 3 | List employees with their department details | `SELECT` |
| 4 | Segment employees by rating (< 2, 2–4, > 4) | `WHERE`, `BETWEEN` |
| 5 | Combine first and last name for Finance employees | `CONCAT`, alias |
| 6 | Identify leaders (Manager, President, CEO) and count each manager's reporters | `IN`, **self-join**, `GROUP BY` |
| 7 | List Healthcare and Finance employees together | `UNION` |
| 8 | Show each employee's rating next to the department maximum | **window function** `MAX() OVER (PARTITION BY)` |
| 9 | Minimum and maximum salary per role | `MIN`, `MAX`, `GROUP BY` |
| 10 | Rank employees by experience | `RANK() OVER` |
| 11 | View of employees earning more than 6,000 | `CREATE VIEW` |
| 12 | Employees with more than 10 years of experience | nested subquery |
| 13 | Check job titles against the experience standard | **stored function**, `CASE` |
| 14 | Speed up the search for employees named "Eric" | `CREATE INDEX`, execution plan |
| 15 | Calculate the bonus (5% of salary × rating) | calculated column |
| 16 | Average salary by continent and country | `AVG`, `GROUP BY` |

### Highlights

**Reporting lines with a self-join**
```sql
SELECT m.EMP_ID, m.FIRST_NAME AS Manager_Name, m.ROLE,
       COUNT(e.EMP_ID) AS No_of_Reporters
FROM emp_record_table m
JOIN emp_record_table e ON m.EMP_ID = e.MANAGER_ID
GROUP BY m.EMP_ID, m.FIRST_NAME, m.ROLE
ORDER BY No_of_Reporters DESC;
```

**Window functions for row-level benchmarking**
```sql
SELECT EMP_ID, FIRST_NAME, LAST_NAME, ROLE, DEPT, EMP_RATING,
       MAX(EMP_RATING) OVER (PARTITION BY DEPT) AS MAX_EMP_RATING
FROM emp_record_table;
```

**Job-level standard via a stored function**

| Experience | Assigned title |
|-----------|----------------|
| ≤ 2 years | Junior Data Scientist |
| 2–5 years | Associate Data Scientist |
| 5–10 years | Senior Data Scientist |
| 10–12 years | Lead Data Scientist |
| 12–16 years | Manager |

The `job_profile(exp_years)` function encodes this standard, and the query compares each employee's assigned role to the title their experience should carry.

**Index optimization**
```sql
CREATE INDEX idx_first_name ON emp_record_table (FIRST_NAME(50));
```
The execution plan was checked before and after adding the index to confirm the lookup cost dropped.

---

## 🛠️ Skills Demonstrated

- Database and schema design, ER modeling
- Filtering and conditional logic
- Joins and self-joins
- Set operations (`UNION`)
- Aggregate functions
- Window functions (`PARTITION BY`, `RANK`)
- Views and nested subqueries
- Stored functions
- Indexing and query optimization

---

## 📁 Repository Structure

```
├── Employee Performance Mapping (SQL).sql              # All 16 queries
├── Employee Performance Mapping (ER Diagram).mwb       # MySQL Workbench model
├── Employee Performance Mapping (ER Digram).png        # ER diagram image
├── Employee Performance Mapping (Presentation).pdf     # Project presentation
└── README.md
```

## 🚀 How to Run

1. Open **MySQL Workbench** and connect to your MySQL server.
2. Run the first lines of the `.sql` file to create the `Employee` database.
3. Import `emp_record_table.csv`, `data_science_team.csv` and `proj_table.csv` into the `Employee` database (Table Data Import Wizard).
4. Run the remaining queries in order.

> The source CSV files are not included in this repository. Add them to the repo if you want others to reproduce the results.

---

## 👤 Author

**Shivani Sharma**: Data Analyst | Generative AI
📧 shivani92754@gmail.com · 🔗 [LinkedIn](https://linkedin.com/in/shivani-sharma-517636413) · 🌐 [Portfolio](https://your-portfolio-link)
