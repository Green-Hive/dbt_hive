WITH source_data AS (
    select 
        *
    from 
        {{ source('hive','session') }}
)

SELECT * FROM source_data