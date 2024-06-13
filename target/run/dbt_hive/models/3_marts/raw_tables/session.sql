
  
    

  create  table "hive"."atlas"."session__dbt_tmp"
  
  
    as
  
  (
    WITH source_data AS (
    SELECT
        sid,
        sess,
        expire
    FROM "hive"."atlas_staging"."stg_hive__session"
)

SELECT * FROM source_data
  );
  