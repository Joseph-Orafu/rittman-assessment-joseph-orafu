with questions AS (
    SELECT
        *
    FROM {{ ref('int_questions_clean')}}
),
answers AS (
    SELECT
        *
    FROM {{ ref('int_answers_clean')}}
),

merge_question_answers AS (
    SELECT
        q.question_id,
        q.questions,
        a.answers,
        q.answer_count,
        q.comment_count,
        q.creation_date AS question_creation_date,
        a.creation_date AS answer_creation_date,
        q.favorite_count,
        q.last_activity_date AS question_last_activity_date,
        a.last_activity_date AS answer_last_activity_date,
        q.last_editor_user_id,
        q.owner_user_id,
        q.parent_id,
        q.score AS question_score,
        a.score AS answer_score,
        q.tags,
        q.view_count
    FROM questions q
    LEFT JOIN answers a ON q.answer_id = a.answer_id
)

SELECT * FROM merge_question_answers