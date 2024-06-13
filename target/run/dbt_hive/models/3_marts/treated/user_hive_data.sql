
  
    

  create  table "hive"."atlas"."user_hive_data__dbt_tmp"
  
  
    as
  
  (
    select * from "hive"."atlas_intermediary"."int_hive__hive_data"
  );
  