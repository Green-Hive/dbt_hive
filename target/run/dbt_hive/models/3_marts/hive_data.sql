
  
    

  create  table "hive"."atlas"."hive_data__dbt_tmp"
  
  
    as
  
  (
    select * from "hive"."atlas_INTERMEDIARY"."int_hive__hive_data"
  );
  