WITH source_data AS (
    select 
        *
    from 
        {{ source('hive','user') }}
)

SELECT * FROM source_data