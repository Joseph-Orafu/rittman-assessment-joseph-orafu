/*Selecting Specific columns and renaming columns*/ 
SELECT
    id AS history_id,
    creation_date,
    post_id AS stackoverflow_post_id,
    user_id,
    text,
    comment
FROM {{ ref('stg_post_history')}}


