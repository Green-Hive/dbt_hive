WITH source_data AS (
    select 
        *
    from 
        "hive"."lake"."session"
)

SELECT * FROM source_data