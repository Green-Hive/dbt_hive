WITH source_data AS (
    SELECT
        sid,
        sess,
        expire
    FROM {{ref('stg_hive__session')}}
)

SELECT * FROM source_data