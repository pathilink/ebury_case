CREATE OR REPLACE TABLE `analytics-case-study.ae_case_study_brazil_PN.fact_payments_enriched` AS
SELECT 
    f.payment_id,
    f.client_number,
    f.payment_ordered_on,
    f.payment_currency,
    f.payment_amount,
    f.gbp_payment_amount,
    c.surrogate_key,
    c.ebury_country,
    c.client_type,
    c.source
FROM `analytics-case-study.ae_case_study_brazil_PN.fact_payments` f
LEFT JOIN `analytics-case-study.ae_case_study_brazil_PN.dim_client` c
  ON f.client_number = c.client_number
 AND f.payment_ordered_on BETWEEN c.valid_from AND c.valid_to