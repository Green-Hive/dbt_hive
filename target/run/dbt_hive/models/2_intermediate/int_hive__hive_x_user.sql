
  
    

  create  table "hive"."atlas_intermediary"."int_hive__hive_x_user__dbt_tmp"
  
  
    as
  
  (
    WITH source_data AS (
    select 
        u.id as user_id, 
        u.email,
        u.name as user_name, 
        u.createdat as created_at,
        u.updatedat as updated_at, 
        u.role,
        h.id as hive_id,
        h.name as hive_name,
        h.userhasaccess as user_has_access
    from "hive"."atlas_staging"."stg_hive__user" u
left join "hive"."atlas_staging"."stg_hive__hive" h on u.id =  h.userid


)

SELECT * FROM source_data
  );
  