-- All other trades
SELECT 
  t.trade_id
  , t.trade_type
  , COALESCE(t.order_date, t.paid_date) AS order_date
  , t.amount
  -- , p.product_name
FROM `analytics-case-study.ae_case_study_brazil_PN.fact_trades` t
JOIN `analytics-case-study.ae_case_study_brazil_PN.dim_product` p
  ON t.product_id = p.product_id
WHERE trade_type <> 'internal'
  AND p.product_name <> 'Trade'