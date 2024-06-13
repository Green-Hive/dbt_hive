WITH source_data AS (
    SELECT
        id,
        createdat AS created_at,
        hiveid AS hive_id,
        message,
        type,
        severity
    FROM "hive"."atlas_staging"."stg_hive__alert"
)

SELECT * FROM source_data