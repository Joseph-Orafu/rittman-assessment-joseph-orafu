/*Selecting specific column and renaming columns*/
SELECT
    id AS stackoverflow_id,
    TRIM(REGEXP_REPLACE(body,r'<[^>]*>','')) AS posts,    /*Use REGEX to clean the answers removing <p>*/ 
    accepted_answer_id AS answer_id,
    CASE 
        WHEN answer_count IS NULL THEN 0           /*replacing null with 0 in the counts*/
        ELSE answer_count
    END AS answer_count,
    comment_count,
    creation_date,
    CASE 
        WHEN favorite_count IS NULL THEN 0         /*replacing null with 0 in the counts*/
        ELSE favorite_count
    END AS favorite_count,
    last_activity_date,
    last_editor_user_id,
    owner_user_id
    parent_id,
    score,
    tags,
   CASE 
        WHEN view_count IS NULL THEN 0             /*replacing null with 0 in the counts*/
        ELSE view_count
    END AS view_count
FROM {{ ref('stg_stackoverflow_post')}}


