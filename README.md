# Citi Bike Rental – Data Engineering & Analytics Views Project

## 📌 Project Overview

This project demonstrates an **end‑to‑end data engineering workflow** using Citi Bike–NYC bike‑sharing data. The objective is **not exploratory analysis**, but to **clean, model, and publish analytics‑ready views** that an analytical or BI team can immediately consume without writing complex SQL.

The project follows real‑world data‑engineering principles:

* Schema‑driven ingestion
* Clean separation between raw data, transformations, and analytics
* Reusable, layered SQL views
* Exportable analytics outputs (CSV & Parquet)

Later phases of the project will extend this foundation with EDA and visualizations.

---

## 🎯 Project Goals

* Clean and normalize raw bike trip, station, and weather data
* Load structured data into a SQLite analytical database
* Build **ready‑made analytical views** aligned with business questions
* Export curated views for downstream analytics and reporting

---

## 🏗️ Project Structure

```text
citi-bike-rental/
│
├── citi-bike-rental.ipynb      # Data cleaning & loading pipeline
|
├── data/                     # Original, unmodified datasets
│   │   
│   │
|
├── data_dictionaries/       # Source documentation (PDFs)
│   
│
├── db/
│   ├── schema.sql                  # Database schema (tables)
│   └── views/
│       ├── 01_v_daily_trips.sql
│       ├── 02_v_hourly_trips.sql
│       ├── 03_v_station_usage.sql
│       ├── 04_v_station_imbalance.sql
│       ├── 05_v_user_behavior.sql
│       └── 06_v_weather_trip_demand.sql
│
├── exports/
│       ├── csv/
│       └── parquet/
|
|
├── scripts/
│   ├── setupdb.py                  # Database creation & schema execution
│   ├── build_views.py              # Executes SQL view files in order
│   └── export_views.py             # Exports views to CSV & Parquet
│
├── README.md
```

---

## 🗄️ Database Design

The database is implemented in **SQLite**, chosen for portability and simplicity.

### Core Tables

* **stations** – Station metadata and coordinates
* **trips** – Individual bike trips (time, duration, user attributes)
* **weather_station** – Weather station metadata
* **weather_data** – Daily weather observations

The schema is defined declaratively in `db/schema.sql` and executed programmatically.

---

## 📊 Analytical Views

The analytical layer is built entirely using **SQL views**, following a layered approach.

### 1️⃣ `v_daily_trips`

**Question:** How many trips occur per day?

* Daily trip count
* Average trip duration
* Normalized daily metrics

### 2️⃣ `v_hourly_trips`

**Question:** What are peak usage hours?

* Hourly distribution of trips

### 3️⃣ `v_station_usage`

**Question:** Which stations are most used?

* Start trips
* End trips
* Total station activity

### 4️⃣ `v_station_imbalance`

**Question:** Which stations tend to lose or gain bikes?

* Net station imbalance (starts vs ends)

### 5️⃣ `v_user_behavior`

**Question:** How do different user types behave?

* Trip volume by user type
* Average and capped trip durations
* Average daily usage

### 6️⃣ `v_weather_trip_demand`

**Question:** How does weather impact demand?

* Daily trip volume joined with weather conditions
* Temperature, precipitation, snowfall, wind

> Views are created in **dependency‑safe order** using prefixed filenames.

---

## 📤 Exported Outputs

All analytical views are exported for easy access:

* **CSV** – for spreadsheets and quick inspection
* **Parquet** – for analytics engines and data science workflows

Exports are generated via:

```python
from scripts.export_views import export_views
export_views()
```

Output location:

```
exports/
├── csv/
└── parquet/
```

---

## 🔧 Technologies Used

* Python
* Pandas
* SQLite
* SQL (analytical views)
* Parquet
* Pathlib

---

## Requirements

* pandas>=2.0
* pyarrow>=12.0

## 🧠 Design Principles

* **Single source of truth**: Aggregations are defined once and reused
* **Layered modeling**: Views built on top of views
* **No silent data filtering**: Outliers preserved, capped metrics explicit
* **Analytics‑first**: Views answer real business questions

---


## 🚀 Future Extensions

* Exploratory Data Analysis (EDA)
* Visual dashboards
* Data quality checks & tests
* dbt‑style refactor
* Time‑series forecasting

---

## 👤 Author

Jean Venaldo Louissaint

Data Engineering & Analytics Project

---

## 📎 Notes

This project intentionally prioritizes **data engineering clarity** over visualization. All analytical consumers are expected to work directly from the curated views.
