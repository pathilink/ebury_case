CREATE OR REPLACE TABLE `analytics-case-study.ae_case_study_brazil_PN.dim_date` AS 
WITH calendar AS (
  SELECT
    day AS calendar_date
    , EXTRACT(YEAR FROM day) AS year
    , EXTRACT(MONTH FROM day) AS month
    , EXTRACT(DAY FROM day) AS day
    , EXTRACT(DAYOFWEEK FROM day) AS weekday
  FROM UNNEST(GENERATE_DATE_ARRAY('2020-01-01', '2030-12-31', INTERVAL 1 DAY)) AS day
),
holidays AS (
  SELECT 1 AS month, 1 AS day, 'BR' AS country UNION ALL -- New Year (BR)
  SELECT 12 AS month, 25 AS day, 'BR' UNION ALL          -- Christmas (BR)
  SELECT 1 AS month, 6 AS day, 'ES' UNION ALL            -- Three Kings Day (ES)
  SELECT 12 AS month, 25 AS day, 'ES' UNION ALL          -- Christmas (ES)
  SELECT 1 AS month, 1 AS day, 'UK' UNION ALL            -- New Year (UK)
  SELECT 12 AS month, 25 AS day, 'UK'                    -- Christmas (UK)
),
working_days AS (
  SELECT
    c.*
    , CASE 
        WHEN c.weekday IN (1, 7) THEN FALSE
        WHEN CAST(c.calendar_date AS STRING) LIKE ('%01-01') THEN FALSE
        WHEN CAST(c.calendar_date AS STRING) LIKE ('%01-06') AND country = 'ES' THEN FALSE
        WHEN CAST(c.calendar_date AS STRING) LIKE ('%12-25') THEN FALSE
        ELSE TRUE
      END AS is_working_day
    , country
  FROM calendar c 
  LEFT JOIN holidays h
    ON c.month = h.month --AND c.day = h.day
)

SELECT * FROM working_days WHERE is_working_day = TRUE;