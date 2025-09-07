-- Duplicates in trades
SELECT 
  trade_id
  , COUNT(*) AS qtd
FROM `analytics-case-study.ae_case_study_brazil_PN.fact_trades` 
GROUP BY trade_id
HAVING qtd > 1