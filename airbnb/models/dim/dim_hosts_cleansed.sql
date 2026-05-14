WITH stg_hosts AS (
    SELECT *
    FROM {{ ref('stg_hosts') }}
)
SELECT 
    host_id,
    NVL(host_name, 'anonymous') AS host_name,
    TRY_TO_BOOLEAN(is_superhost) AS is_superhost,
    created_at,
    updated_at
FROM stg_hosts