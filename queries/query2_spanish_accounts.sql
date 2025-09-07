-- Spanish accounts > 300
SELECT 
  a.account_id
  , a.account_country
  , SUM(t.amount) AS total_amount
FROM `analytics-case-study.ae_case_study_brazil_PN.dim_account` a
LEFT JOIN `analytics-case-study.ae_case_study_brazil_PN.fact_trades` t
  ON a.account_id = t.account_id
WHERE account_country = 'Spain'
GROUP BY 1, 2
HAVING total_amount > 300;