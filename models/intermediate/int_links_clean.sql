/*Selected specific columns and renamed columns*/ 
SELECT
    id AS link_id,
    creation_date,
    post_id AS stackoverflow_post_id,
    related_post_id AS stackoverflow_related_post_id
FROM {{ ref('stg_post_links')}}


