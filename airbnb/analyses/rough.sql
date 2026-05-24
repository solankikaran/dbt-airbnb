SELECT *
FROM {{ source('raw', 'listings') }}
WHERE minimum_nights <= 0