
  
    

  create  table "hive"."atlas_staging"."stg_hive__session__dbt_tmp"
  
  
    as
  
  (
    WITH source_data AS (
    select 
        *
    from 
        "hive"."lake"."session"
)

SELECT * FROM source_data
  );
  