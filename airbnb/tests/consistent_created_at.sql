SELECT *
FROM {{ ref('dim_listings') }} l
LEFT JOIN {{ ref('fct_reviews') }} r
    ON l.listing_id = r.listing_id
WHERE r.review_date < l.created_at
LIMIT 10