WITH source_data AS (
    select 
        *
    from 
        {{ source('hive','alert') }}
)

SELECT * FROM source_data