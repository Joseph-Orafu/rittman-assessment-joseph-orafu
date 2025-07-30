/* 
{{ config(
        tags = ["assess"]
) }}
*/

SELECT
    id,
    creation_date,
    post_id,
    post_history_type_id,
    revision_guid,
    user_id,
    text,
    comment
FROM {{ source('stackoverflow','post_history')}}