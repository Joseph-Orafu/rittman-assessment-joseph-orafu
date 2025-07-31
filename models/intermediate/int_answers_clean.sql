/*Selecting specific column and renaming columns*/
SELECT
    id AS answer_id,
    TRIM(REGEXP_REPLACE(body,r'<[^>]*>','')) AS answers,        /*Use REGEX to clean the answers removing <p>*/
    comment_count,
    creation_date,
    last_activity_date,
    last_editor_user_id,
    parent_id,
    CASE 
        WHEN score IS NULL THEN 0                          /*replacing null with 0 in the counts*/
        ELSE score
    END AS score
FROM {{ ref('stg_post_answers')}}


