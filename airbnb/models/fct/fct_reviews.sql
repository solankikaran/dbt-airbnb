{{
    config(
        materialized='incremental',
        on_schema_change='fail'
    )
}}

WITH stg_reviews AS (
    SELECT *
    FROM {{ ref('stg_reviews') }}
    WHERE review_text IS NOT NULL 
)
SELECT 
    {{ dbt_utils.generate_surrogate_key(['listing_id', 'review_date', 'reviewer_name', 'review_text']) }} AS review_id,
    *
FROM stg_reviews
{% if is_incremental() %}
  WHERE review_date >= COALESCE((SELECT MAX(review_date) from {{ this }}), '1900-01-01')
{% endif %}
