CREATE OR REPLACE TABLE `analytics-case-study.ae_case_study_brazil_PN.dim_client` AS
SELECT 
  GENERATE_UUID() AS surrogate_key -- replacement key for unification
  , CAST(client_number AS STRING) AS client_number
  , ebury_country
  , client_type
  , created_date
  , CURRENT_DATE() AS valid_from
  , DATE '9999-12-31' AS valid_to
  , TRUE AS is_current
  , 'source1' AS source
FROM `analytics-case-study.ae_case_study_brazil_PN.client_source1` 
UNION ALL
SELECT
    GENERATE_UUID() AS surrogate_key -- replacement key for unification
  , client_number
  , ebury_country
  , client_type
  , created_date
  , CURRENT_DATE() AS valid_from
  , DATE '9999-12-31' AS valid_to
  , TRUE AS is_current
  , 'source2' AS source
FROM `analytics-case-study.ae_case_study_brazil_PN.client_source2` 
