WITH dim_listings AS (
    SELECT *
    FROM {{ ref('dim_listings') }}
),
dim_hosts AS (
    SELECT *
    FROM {{ ref('dim_hosts') }}
)
SELECT 
    l.listing_id,
    l.listing_name,
    l.room_type,
    l.minimum_nights,
    l.price,
    h.host_id,
    h.host_name,
    h.is_superhost AS host_is_superhost,
    l.created_at,
    GREATEST(l.updated_at, h.updated_at) AS updated_at
FROM dim_listings l
LEFT JOIN dim_hosts h
    ON l.host_id = h.host_id