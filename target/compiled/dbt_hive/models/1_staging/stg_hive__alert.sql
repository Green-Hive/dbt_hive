WITH source_data AS (
    select 
        *
    from 
        "hive"."lake"."alert"
)

SELECT * FROM source_data