# Ebury Analytics Engineering Case

![Status Badge](https://img.shields.io/static/v1?label=STATUS&message=INCOMPLETE&color=FFCC00)

## 📌 Description
Technical case study in Analytics Engineering using BigQuery, focusing on dimensional modeling and SQL queries for payment and customer analysis.

## 🚀 Project structure
🔹 Part 1 – Modeling

* Creation of dimensions:

    * `dim_client` → consolidation of multiple customer sources with history (SCD Type 2).

    * `dim_account` → account information.

    * `dim_product` → product registration.

    * `dim_date` → calendar between 2020 and 2030, including weekends and holidays (🇧🇷 🇪🇸 🇬🇧).

* Creation of the fact table:

    * `fact_payments` → centralizes payment information, referencing the dimensions.

    * `fact_trades` → centralizes trade information, referencing the dimensions.

🔹 Part 2 – Analyses (SQL)

1. Trades MTD. When order_date is NULL use paid_date. 

2. Return only spanish accounts that the total amount is more than 300.

3. Trades that are not external where a thread was bought.

4. All trades except the ones above.

5. Find if there are any duplicates in the trades table.

6. All accounts with the number of trades done, even if they don’t have any trades.

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
 ┃ ┗ fact_trades.sql
 ┣ 📂 queries
 ┃ ┣ query1_trades_mtd.sql
 ┃ ┣ query2_spanish_accounts.sql
 ┃ ┣ query3_non_external_trade.sql
 ┃ ┣ query4_other_trades.sql
 ┃ ┣ query5_duplicates.sql
 ┃ ┗ query6_trades_per_account.sql
 ┣ LICENSE
 ┣ README.md
```

## 🛠️ Technologies used

![BigQuery SQL](https://img.shields.io/badge/-BigQuery_SQL-4285F4?style=flat&logo=google-bigquery&logoColor=white)

## 👩🏻‍💻 Author

[![Linkedin Badge](https://img.shields.io/badge/-Patrícia-blue?style=flat&logo=Linkedin&logoColor=white&link=https://www.linkedin.com/in/pathilink/)](https://www.linkedin.com/in/pathilink/)

## 🔓 License

[![License: MIT](https://img.shields.io/badge/License-MIT-750014.svg)](https://opensource.org/licenses/MIT)
