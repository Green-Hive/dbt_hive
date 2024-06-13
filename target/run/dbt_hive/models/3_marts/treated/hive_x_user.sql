
  
    

  create  table "hive"."atlas"."hive_x_user__dbt_tmp"
  
  
    as
  
  (
    select * from "hive"."atlas_intermediary"."int_hive__hive_x_user"
  );
  