
  
    

  create  table "hive"."atlas_staging"."stg_hive__user__dbt_tmp"
  
  
    as
  
  (
    WITH source_data AS (
    select 
        *
    from 
        "hive"."lake"."user"
)

SELECT * FROM source_data
  );
  