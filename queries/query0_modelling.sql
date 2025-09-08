-- Modelling

-- There is no payment data from client_source2 (Argentina and Brazil)
SELECT 
  f.*
  , c.*
FROM `analytics-case-study.ae_case_study_brazil_PN.fact_payments` f
LEFT JOIN `analytics-case-study.ae_case_study_brazil_PN.dim_client` c
  ON f.client_number = c.client_number
  AND f.payment_ordered_on BETWEEN c.valid_from AND c.valid_to
WHERE source = 'source2'
LIMIT 10;

-- Payments were left without a client (null JOIN)
SELECT 
  COUNT(*) AS total_payments
  , COUNT(DISTINCT f.client_number) AS distinct_clients_in_payments
  , COUNT(DISTINCT c.client_number) AS distinct_clients_dim
  , SUM(CASE WHEN c.client_number IS NULL THEN 1 ELSE 0 END) AS payments_without_client
FROM `analytics-case-study.ae_case_study_brazil_PN.fact_payments` f
LEFT JOIN `analytics-case-study.ae_case_study_brazil_PN.dim_client` c
  ON f.client_number = c.client_number
  AND f.payment_ordered_on BETWEEN c.valid_from AND c.valid_to;

-- Clients with more than one active line during the same period = 8 clients
SELECT 
  client_number -- not unique
  -- surrogate_key -- is unique
  , COUNT(*) AS qtd_registros
FROM `analytics-case-study.ae_case_study_brazil_PN.dim_client` c
WHERE is_current = TRUE
GROUP BY 1
HAVING COUNT(*) > 1;

-- Check duplication: diff countries, created_dates but same times
SELECT 
  *
FROM `analytics-case-study.ae_case_study_brazil_PN.dim_client` c
WHERE is_current = TRUE
  AND client_number in ('211418', '405185', '328166', '287342', '430959AA', '369193AA', '268635AA', '461649AA')
ORDER BY client_number;

-- Check if there are any payments that do not fall within any validity range: no clients information
SELECT 
  f.payment_id
  , f.client_number
  , f.payment_ordered_on
  , c.valid_from 
  , c.valid_to
FROM `analytics-case-study.ae_case_study_brazil_PN.fact_payments` f
LEFT JOIN `analytics-case-study.ae_case_study_brazil_PN.dim_client` c
  ON f.client_number = c.client_number
 AND f.payment_ordered_on BETWEEN c.valid_from AND c.valid_to
WHERE c.surrogate_key IS NULL;

-- CHECK fact_payments_enriched
-- completeness
SELECT
  COUNT(*) AS total_payments
  , SUM(CASE
        WHEN surrogate_key IS NULL THEN 1
        ELSE 0
        END) AS no_client
FROM `analytics-case-study.ae_case_study_brazil_PN.fact_payments_enriched`;

-- uniqueness: 100 duplicated payment_id
SELECT
  payment_id
  , COUNT(*) AS qtd_clients
FROM `analytics-case-study.ae_case_study_brazil_PN.fact_payments_enriched`
GROUP BY 1
HAVING COUNT(*) > 1;

SELECT *
FROM `analytics-case-study.ae_case_study_brazil_PN.fact_payments_enriched`
WHERE payment_id IN ('PI1009334', 'PI1751288', 'PI1182186', 'PI1084833', 'PI1585178')
ORDER BY client_number, payment_ordered_on;
