{{ 
    config(
        materialized = 'incremental',
        on_schema_change = 'fail'
    )
}}

WITH stg_reviews AS (
    SELECT *
    FROM {{ ref('stg_reviews') }}
)
SELECT *
FROM stg_reviews
WHERE review_text IS NOT NULL
{% if is_incremental() %}
AND review_date > (SELECT MAX(review_date) FROM {{ this }})
{% endif %}