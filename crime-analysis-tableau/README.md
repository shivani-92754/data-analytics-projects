# 🚔 Crime Analysis Dashboard (Tableau)

An interactive Tableau story that turns **six years of incident-level crime records** into insight for crime prevention and resource planning, designed for a police department's public communication website.

> **Tools:** Tableau Desktop · **Dataset:** Crime_data (247,797 incidents, 2017–2022) · **Type:** Course-end project

---

## 🎯 Project Overview

Crime analysis underpins law-and-order maintenance. By surfacing patterns in past criminal activity, it gives police departments and city agencies the evidence they need to plan prevention programs, allocate patrols and respond faster to emerging hotspots.

**Scenario:** As a data analyst in a police department's research wing, build an interactive Tableau dashboard/story for the department's communication website, covering *where* and *what* crime occurs, *when* it occurs, how it is *trending*, and how *outcomes* compare, all filterable by incident type and location.

### Crime data analysis supports

| Area | How |
|------|-----|
| Criminal investigation | Surfaces patterns pointing to likely times, places and methods |
| Apprehension and prosecution | Arrest-outcome data helps evaluate case-closure performance |
| Prevention strategy | Hotspot and time-block trends guide where programs are targeted |
| Resource planning | Patrol and staffing decisions grounded in when and where incidents cluster |

---

## 📊 Dataset Snapshot

| Total Incidents | Reporting Period | Primary Crime Types | Ended in Arrest | Linked Dashboards |
|:---:|:---:|:---:|:---:|:---:|
| 247,797 | 2017–2022 | 33 | 20% | 4 |

**Key fields:** Date and time, Primary Type / Description (UCR-linked crime category), Location Description, Arrest and Domestic flags, Beat / District / Ward / Community Area, and Latitude / Longitude.

---

## 🧱 What Was Built

Four linked dashboards, backed by **15 worksheets**, that tell one story.

| # | Dashboard | What it shows |
|---|-----------|---------------|
| 1 | **Overall Crime Statistics** | Total crimes reported, crime count by primary type, a live crime feed of recent incidents, and a geo-map of incidents |
| 2 | **Time Period Analysis** | Crime by hour, weekday, month and time block |
| 3 | **Trend Analysis** | Crime by year, plus year-over-year trend lines by month, hour and weekday |
| 4 | **Comparative Analysis** | Arrest vs no-arrest outcomes and domestic vs non-domestic incidents |

### Interactive filters (shared across all dashboards)

- **Primary Type:** isolate any of the 33 crime categories, from Theft to Homicide
- **Location Description:** narrow the view to a setting such as street, residence or airport
- **Year:** compare specific periods (2017–2022) on the trend views

### Calculated field: time blocks

A calculated field buckets each incident by hour of day:

| Time block | Hours |
|-----------|-------|
| Morning | 5 AM – 12 PM |
| Afternoon | 12 PM – 5 PM |
| Evening | 5 PM – 9 PM |
| Night | 9 PM – 5 AM |

### Design choices

- A **live feed and headline total** open the story, so visitors see the current picture in seconds
- **Geo-mapping** grounds abstract counts in real neighborhoods and blocks
- **Time and trend views** separate "when" from "how much" instead of using one overloaded chart
- **Consistent filters** let one selection carry through the whole story

---

## 📈 Key Findings

| Metric | Result |
|--------|--------|
| Total crimes reported | **247,797** |
| Most common incident | **Theft**, 58,434 cases |
| Theft + Battery share | ~**42%** of all reports |
| Arrest vs no arrest | **20% / 80%** |
| Domestic incidents | **17%** (83% non-domestic) |
| Peak reporting hours | **12 PM and 6–7 PM** |
| Quietest hour | ~5 AM (~3.7K incidents) |
| Incidents at night | **27%** |

### Insights

1. **Theft and Battery dominate.** Together they make up about 42% of all reports, the highest-leverage categories for prevention spend.
2. **Afternoons and nights peak.** Each block holds 27% of incidents, together over half of all reports. Volume dips to its lowest near 5 AM, climbs sharply from 8 AM and spikes at midday.
3. **Arrest resolution is low.** Only 20% of incidents end in an arrest, a starting point for reviewing investigative capacity.
4. **Domestic cases are a minority** at 17%, but likely warrant a dedicated response protocol.
5. **Weekly reporting is steady.** Weekday volumes vary little (Wednesday and Friday are slightly lower), and monthly volume is highest in January, dipping modestly through summer.
6. **Later-year data needs a caveat.** Annual counts hold near 102K in 2017–2018, then fall sharply from 2019. This tracks with reduced record coverage in the source extract, so it should be read as a **data-completeness effect**, not a confirmed real-world decline.

## ✅ Recommendations

1. **Weight afternoon and night patrol resourcing** toward the categories and blocks the dashboard flags as highest-volume.
2. **Review why 80% of incidents close without arrest**, starting with Theft and Battery.
3. **Confirm the 2019–2022 extract's completeness** before using the year-over-year trend for planning.
4. **Publish the dashboard** to the communication website with the shared Primary Type and Location filters live for public use.

---

## 🛠️ Skills Demonstrated

- Multi-dashboard Tableau storytelling
- Calculated fields and time-based grouping
- Geographic mapping
- Shared, cross-dashboard interactive filters
- Trend and comparative analysis
- Honest data storytelling, including flagging data-completeness caveats
- Turning analysis into operational recommendations

---

## 📁 Repository Structure

```
├── Crime Analysis (Tableau).twb                 # Tableau workbook (15 worksheets, 4 dashboards)
├── Crime Analysis (Tableau).pdf file.pdf        # Dashboard export
├── Crime_Analysis (Presentation).pdf            # Project presentation (11 slides)
└── README.md
```

## 🚀 How to Use

1. Clone or download this repository.
2. Open the `.twb` file in **Tableau Desktop**.
3. If prompted, re-point the data source (`Crime_data`) to your local copy of the dataset.
4. Explore the four dashboards and use the **Primary Type**, **Location Description** and **Year** filters to drill down.

> The `.twb` references the data by file path and the dataset is not included in this repository. Add it, or link to its source, so others can reproduce the dashboards.

---

## 👤 Author

**Shivani Sharma**: Data Analyst | Generative AI
📧 shivani92754@gmail.com · 🔗 [LinkedIn](https://linkedin.com/in/shivani-sharma-517636413) · 🌐 [Portfolio](https://shivani-sharma-portfilio-com.netlify.app)
