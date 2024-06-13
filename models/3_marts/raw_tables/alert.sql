WITH source_data AS (
    SELECT
        id,
        createdat AS created_at,
        hiveid AS hive_id,
        message,
        type,
        severity
    FROM {{ ref('stg_hive__alert')}}
)

SELECT * FROM source_data