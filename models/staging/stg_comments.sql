/* 
{{ config(
        tags = ["assess"]
) }}
*/

SELECT
   id,
   text,
   creation_date,
   post_id,
   user_id,
   user_display_name,
   score,
FROM {{ source('stackoverflow','comments')}}
