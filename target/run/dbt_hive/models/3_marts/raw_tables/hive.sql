
  
    

  create  table "hive"."atlas"."hive__dbt_tmp"
  
  
    as
  
  (
    WITH source_data AS (
    SELECT
        id AS hive_id,
        createdat AS created_at,
        updatedat AS updated_at,
        description,
        userid AS user_id,
        name,
        userhasaccess AS user_has_access
    FROM "hive"."atlas_staging"."stg_hive__hive"
)

SELECT * FROM source_data
  );
  