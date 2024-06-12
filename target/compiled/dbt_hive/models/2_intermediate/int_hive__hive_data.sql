WITH source_data AS (
    select 
        u.id as user_id, 
        u.email,
        u.name as user_name, 
        u.createdat as created_at,
        u.updatedat as updated_at, 
        u.role,
        h.name as hive_name,
        h.userhasaccess as user_has_access
    from lake.user u
left join lake.hive h on u.id =  h.userid


)

SELECT * FROM source_data