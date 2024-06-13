
  
    

  create  table "hive"."atlas"."hive_data__dbt_tmp"
  
  
    as
  
  (
    WITH source_data AS (
    SELECT
        id,
        createdat AS created_at,
        hiveid AS hive_id,
        weight,
        humiditybottomleft AS humidity_bottom_left,
        humidityoutside AS humidity_outside,
        humiditytopright AS humidity_top_right ,
        magnetic_x,
        magnetic_y,
        magnetic_z,
        pressure,
        tempbottomleft AS temp_bottom_left,
        tempoutside AS temp_outside,
        temptopright AS temp_top_right,
        time
    FROM "hive"."atlas_staging"."stg_hive__hive_data"
)

SELECT * FROM source_data
  );
  