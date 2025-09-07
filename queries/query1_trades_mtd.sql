-- Trades MTD
WITH trades_date AS (
SELECT 
  trade_id
  , COALESCE(order_date, paid_date) AS order_date
  , amount
FROM `analytics-case-study.ae_case_study_brazil_PN.fact_trades`
)

SELECT 
  trade_id
  , t.order_date
  , amount
  , SUM(amount) OVER (
    PARTITION BY EXTRACT(YEAR FROM order_date), EXTRACT(MONTH FROM order_date)
    ORDER BY t.order_date
    ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
  ) AS mtd_amount
FROM trades_date t
ORDER BY t.order_date
;