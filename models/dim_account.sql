CREATE OR REPLACE TABLE `analytics-case-study.ae_case_study_brazil_PN.dim_account` AS
SELECT 
  account_id
  , account_name
  , account_country
  , created_on
FROM `analytics-case-study.ae_case_study_brazil_PN.account`;