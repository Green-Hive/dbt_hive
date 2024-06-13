WITH source_data AS (
    SELECT
        id,
        email,
        name,
        provider,
        createdat AS created_at,
        updatedat AS updated_at,
        role,
        notified
    FROM "hive"."atlas_staging"."stg_hive__user"
)

SELECT * FROM source_data