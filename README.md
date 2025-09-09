# Ebury Analytics Engineering Case

![Status Badge](https://img.shields.io/static/v1?label=STATUS&message=COMPLETE&color=008000)

## 📌 Description
Technical case study in Analytics Engineering using BigQuery, focusing on dimensional modeling and SQL queries for payment and client analysis.

## 🚀 Project structure
🔹 Part 1 – Modeling

* Creation of dimensions:

    * `dim_client` → consolidation of multiple client sources.

    * `dim_account` → account information.

    * `dim_product` → product registration.

    * `dim_date` → calendar between 2020 and 2030, including weekends and holidays (🇧🇷 🇪🇸 🇬🇧).

* Creation of the fact table:

    * `fact_payments` → centralizes payment information.

    * `fact_trades` → centralizes trade information.

    * `fact_payments_enriched` → consolidates payments with client information.

🔹 Part 2 – Analyses (SQL)

1. Trades MTD. When order_date is NULL use paid_date → [Query](queries/query1_trades_mtd.sql) & [result in CSV](results/query1_trades_mtd.csv)

2. Return only spanish accounts that the total amount is more than 300 → [Query](queries/query2_spanish_accounts.sql) & [result in CSV](results/query2_spanish_accounts.csv) 

3. Trades that are not external where a thread was bought → [Query](queries/query3_non_external_trade.sql) - There is no data to display.

4. All trades except the ones above → [Query](queries/query4_other_trades.sql) & [result in CSV](results/query4_other_trades.csv)

5. Find if there are any duplicates in the trades table → [Query](queries/query5_duplicates.sql) - There is no data to display.

6. All accounts with the number of trades done, even if they don’t have any trades → [Query](queries/query6_trades_per_account.sql) & [result in CSV](results/query6_trades_per_account.csv)

## ✅ Data quality findings

During data exploration and after creating the `fact_payments_enriched` table, the following issues were found:

* Duplicates in `fact_payments`

    * 100 duplicate rows were identified, in which the same `payment_id` was associated with two different payment amounts.

    * The data source for the `fact_payments` table needs to be reviewed to correct this inconsistency before future analyses.  
    
* Clients not associated with payments  

    * Some `payment_id` do not have a client associated with them in `dim_client`.  

    * Hypothesis: `dim_client` is incomplete, as there is no data for Argentina and Brazil.  

* Inconsistencies in `dim_client`  

    * Eight clients were found with two distinct records:  

        * The `ebury_country` column showed different countries.  

        * The `created_date` column had different timestamps, but with the same hour, minute, and second values.

    * This may indicate discrepancies in client consolidation between different sources.

## ⚙️ How to run it in BigQuery

1. Access the GCP project provided in the case study (`analytics-case-study`).

2. Create the schema, e.g.:
    ```
    CREATE SCHEMA `analytics-case-study.ae_case_study_pn`;
    ```

3. Run the scripts to create the dimensions (`dim_client`, `dim_account`, `dim_product`, `dim_date`).

4. Run the scripts to create the fact tables (`fact_payments` and `fact_trades`).

5. Run the analysis queries located in the `queries/` folder.

## 📂 Repository structure
```psql
📁 ebury_case
 ┣ 📂 data
 ┣ 📂 doc
 ┣ 📂 models
 ┃ ┣ dim_account.sql
 ┃ ┣ dim_client.sql
 ┃ ┣ dim_date.sql
 ┃ ┣ dim_product.sql
 ┃ ┣ fact_payments.sql
 ┃ ┣ fact_payments_enriched.sql
 ┃ ┗ fact_trades.sql
 ┣ 📂 queries
 ┃ ┣ query0_modelling.sql
 ┃ ┣ query1_trades_mtd.sql
 ┃ ┣ query2_spanish_accounts.sql
 ┃ ┣ query3_non_external_trade.sql
 ┃ ┣ query4_other_trades.sql
 ┃ ┣ query5_duplicates.sql
 ┃ ┗ query6_trades_per_account.sql
 ┣ 📂 results
 ┃ ┣ query1_trades_mtd.csv
 ┃ ┣ query2_spanish_accounts.csv
 ┃ ┣ query4_other_trades.csv
 ┃ ┗ query6_trades_per_account.csv
 ┣ LICENSE
 ┣ README.md
```

## 🛠️ Technologies used

![BigQuery SQL](https://img.shields.io/badge/-BigQuery_SQL-4285F4?style=flat&logo=google-bigquery&logoColor=white)

## 👩🏻‍💻 Author

[![Linkedin Badge](https://img.shields.io/badge/-Patrícia-blue?style=flat&logo=Linkedin&logoColor=white&link=https://www.linkedin.com/in/pathilink/)](https://www.linkedin.com/in/pathilink/)

## 🔓 License

[![License: MIT](https://img.shields.io/badge/License-MIT-750014.svg)](https://opensource.org/licenses/MIT)
