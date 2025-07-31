{{ config(
    materialized = 'view'
) }}

/* Final reporting model with data from the last 5 years
   relative to the latest question_last_activity_date in the dataset */

WITH base AS (
    SELECT *
    FROM {{ ref('dwh_join_answers_questions') }}
),

max_date AS (
    SELECT MAX(DATE(question_last_activity_date)) AS latest_date
    FROM base
)

SELECT *
FROM base
WHERE DATE(question_last_activity_date) >= DATE_SUB((SELECT latest_date FROM max_date), INTERVAL 1 YEAR)
