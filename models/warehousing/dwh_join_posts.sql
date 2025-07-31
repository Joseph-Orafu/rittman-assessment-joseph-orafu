with posts AS (
    SELECT
        *
    FROM {{ ref('int_posts_clean')}}
),
comments AS (
    SELECT
        *
    FROM {{ ref('int_comments_clean')}}
),
links AS (
    SELECT
        *
    FROM {{ ref('int_links_clean')}}
),
history AS (
    SELECT
        *
    FROM {{ ref('int_history_clean')}}
),
answers AS (
    SELECT
        *
    FROM {{ ref('int_answers_clean')}}
),

merge_posts AS (
    SELECT
        p.stackoverflow_id,
        p.posts,
        p.answer_id,
        p.answer_count,
        p.comment_count,
        p.creation_date AS post_creation_date,
        p.favorite_count,
        p.last_activity_date AS post_last_activity_date,
        p.last_editor_user_id,
        p.owner_user_id,
        p.parent_id,
        p.score AS post_score,
        p.tags,
        p.view_count,
        c.comment_id,
        c.comment,
        c.creation_date AS comment_creation_date,
        c.user_id,
        c.user_display_name,
        l.stackoverflow_related_post_id,
        l.creation_date AS link_creation_date,
        h.text AS history,
        h.comment AS history_comment,
        a.answers,
        a.creation_date AS answer_creation_date,
        a.last_activity_date AS answer_last_activity_date,
    FROM posts p
    LEFT JOIN comments c ON p.stackoverflow_id = c.stackoverflow_post_id
    LEFT JOIN links l ON p.stackoverflow_id = l.stackoverflow_post_id
    LEFT JOIN history h ON p.stackoverflow_id = h.stackoverflow_post_id
    LEFT JOIN answers a ON p.answer_id = a.answer_id
)

SELECT * FROM merge_posts

        
