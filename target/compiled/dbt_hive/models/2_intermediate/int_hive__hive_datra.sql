WITH source_data AS (
    select 
        u.id, 
        u.email,
        u.name, 
        u.createdat,
        u.updatedat, 
        u.role,
        u.role,
        h.name as hive_name,
        h.userhasaccess
    from lake.user u
left join lake.hive h on u.id =  h.userid


)

SELECT * FROM source_data