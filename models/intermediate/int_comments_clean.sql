/*Rename columns to be more easily readable*/ 
SELECT
    id AS comment_id,
    text AS comment,
    creation_date,
    post_id AS stackoverflow_post_id,
    user_id,
    user_display_name,
    CASE 
        WHEN score IS NULL THEN 0                          /*replacing null with 0 in the counts*/
        ELSE score
    END AS score
FROM {{ ref('stg_comments')}}


