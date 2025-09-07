-- Accounts with number of trades
SELECT
  a.account_id
  , COUNT(t.trade_id) AS number_of_trades
FROM `analytics-case-study.ae_case_study_brazil_PN.dim_account` a
LEFT JOIN `analytics-case-study.ae_case_study_brazil_PN.fact_trades` t 
  ON a.account_id = t.account_id
GROUP BY 1
ORDER BY 2;