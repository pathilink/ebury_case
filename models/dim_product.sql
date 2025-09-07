CREATE OR REPLACE TABLE `analytics-case-study.ae_case_study_brazil_PN.dim_product` AS
SELECT  
  product_id
  , product_name
FROM `analytics-case-study.ae_case_study_brazil_PN.product`;