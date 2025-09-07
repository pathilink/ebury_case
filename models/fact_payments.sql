CREATE OR REPLACE TABLE `analytics-case-study.ae_case_study_brazil_PN.fact_payments` AS
SELECT 
    payment_id
    , client_number
    , payment_ordered_on
    , payment_currency
    , payment_amount
    , gbp_payment_amount
FROM `analytics-case-study.ae_case_study_brazil_PN.payment`;