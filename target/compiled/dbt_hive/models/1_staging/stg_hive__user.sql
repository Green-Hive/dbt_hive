WITH source_data AS (
    select 
        *
    from 
        "hive"."lake"."user"
)

SELECT * FROM source_data