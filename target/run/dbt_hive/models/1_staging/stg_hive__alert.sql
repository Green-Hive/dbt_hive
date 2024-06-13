
  
    

  create  table "hive"."atlas_staging"."stg_hive__alert__dbt_tmp"
  
  
    as
  
  (
    WITH source_data AS (
    select 
        *
    from 
        "hive"."lake"."alert"
)

SELECT * FROM source_data
  );
  