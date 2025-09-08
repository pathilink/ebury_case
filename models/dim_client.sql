CREATE OR REPLACE TABLE `analytics-case-study.ae_case_study_brazil_PN.dim_client` AS
WITH client_union AS (
SELECT 
  GENERATE_UUID() AS surrogate_key -- replacement key for unification
  , CAST(client_number AS STRING) AS client_number
  , ebury_country
  , client_type
  , created_date
  , CAST(created_date AS DATE) AS valid_from
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
  , CAST(created_date AS DATE) AS valid_from
  , DATE '9999-12-31' AS valid_to
  , TRUE AS is_current
  , 'source2' AS source
FROM `analytics-case-study.ae_case_study_brazil_PN.client_source2` 
),

client_deduplicated AS (
SELECT 
  *
  , ROW_NUMBER() OVER (
      PARTITION BY c.client_number
      ORDER BY c.valid_from ASC
  ) AS rn
FROM client_union c
)

SELECT 
  cd.surrogate_key
  , cd.client_number
  , cd.ebury_country
  , cd.client_type 
  , cd.created_date 
  , cd.valid_from
  , cd.valid_to
  , cd.is_current
  , cd.source
FROM client_deduplicated cd
WHERE rn = 1
-- AND client_number in ('211418', '405185', '328166', '287342', '430959AA', '369193AA', '268635AA', '461649AA')
-- ORDER BY client_number

