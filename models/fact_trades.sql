CREATE OR REPLACE TABLE `analytics-case-study.ae_case_study_brazil_PN.fact_trades` AS
SELECT 
    trade_id
    , order_date
    , account_id
    , product_id
    , trade_type
    , paid_date
    , amount
FROM `analytics-case-study.ae_case_study_brazil_PN.trade`;
