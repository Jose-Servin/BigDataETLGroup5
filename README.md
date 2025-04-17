# Big Data ELT Pipeline – Group 5

## 📘 Project Overview

This repository contains the work of Group 5 for the DEC (Data Engineering and Cloud) Big Data ELT Pipeline project. The main objective is to build a robust, cloud-native ELT pipeline that ingests raw operational data and transforms it into analytics-ready models using modern data engineering tools and practices.

---

## 🎯 Objective

To design and implement a scalable ELT pipeline that ingests raw data from an OLTP source (DVD Rental), models it using dimensional techniques, and transforms it into valuable insights for data consumers. The project leverages **Airbyte for ingestion**, **Snowflake for warehousing**, and **dbt for transformations and orchestration**.

---

## 🧑‍💻 Data Consumers

- **Data Analysts**: To create reports and dashboards.
- **Data Scientists**: To analyze customer behavior and operational trends.
- **Business Stakeholders**: To support decision-making with timely insights.

---

## 💾 Source Dataset

- **Name**: DVD Rental Database
- **URL**: [PostgreSQL Sample Database](https://www.postgresqltutorial.com/postgresql-getting-started/postgresql-sample-database/)
- **Description**: A simulated DVD rental store database, including information about customers, films, inventory, staff, payments, and rentals.

---

## 🔄 ELT Pipeline Architecture

### 🧬 Data Ingestion (Extract & Load)

- **Tool**: Airbyte
- **Process**:
  - Connects to the PostgreSQL DVD Rental database.
  - Performs full or incremental data syncs.
  - Loads raw data into staging tables in **Snowflake**.

### ⚙️ Data Transformation

- **Tool**: dbt (Data Build Tool)
- **Environment**: Snowflake
- **Approach**:
  - SQL transformations are defined using dbt models.
  - Data is transformed using **Dimensional Modeling** techniques.
  - DAGs are defined in dbt to ensure logical and dependency-aware transformations.

### ✅ Data Quality

- **Tools**: dbt Tests + Great Expectations
- **Tests Include**:
  - Primary key uniqueness
  - Non-null constraints
  - Foreign key relationships
  - Business rule validations

---

## 📊 Semantic Model

The final data model is built using **dbt's `marts` layer** and follows a **dimensional modeling** approach. It includes:

- **One Big Table** (e.g. `obt_rental_summary` )
- **Fact Tables** (e.g., `fact_rentals`, `fact_payments`)
- **Dimension Tables** (e.g., `dim_customers`, `dim_films`, `dim_stores`, `dim_time`)

These tables enable analytics on customer behavior, revenue trends, rental activity, and inventory performance.

---

## ☁️ Cloud Deployment

- **Data Warehouse**: Snowflake
- **Ingestion Tool**: Airbyte
- **Transformation Tool**: dbt Cloud
- **Scheduling**: dbt Cloud jobs and Airbyte sync schedules

---

## 🗺️ Project Plan

| Task                          | Description                                                             |
|-------------------------------|-------------------------------------------------------------------------|
| Data Ingestion                | Configure Airbyte to sync source tables into Snowflake staging          |
| Staging Layer                 | Create `stg_` models to clean and standardize raw data                  |
| Dimensional Modeling          | Build fact and dimension models in the `marts` layer                    |
| Data Quality                  | Add tests using dbt and Great Expectations                              |
| Documentation                | Generate dbt docs, ER diagrams, and project README                      |
| Deployment & Scheduling       | Configure scheduled runs in dbt Cloud and Airbyte                       |

---

## 🧱 Repository Structure

```plaintext
BigDataETLGroup5/
│
├── dbt/                       # dbt project
│   ├── models/
│   │   ├── staging/           # stg_* models (clean raw data)
│   │   ├── marts/             # fact_* and dim_* models
│   ├── snapshots/             # Optional: point-in-time tracking
│   ├── tests/                 # dbt and Great Expectations tests
│   └── dbt_project.yml        # dbt configuration
│
├── logs/                      # Logs from Airbyte/dbt (optional)
├── requirements.txt           # Python dependencies (if applicable)
└── README.md                  # Project documentation (this file)
