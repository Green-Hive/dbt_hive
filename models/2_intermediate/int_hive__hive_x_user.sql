WITH source_data AS (
    select 
        u.id as user_id, 
        u.email,
        u.name as user_name, 
        u.createdat as created_at,

        u.role,
        h.id as hive_id,
        h.name as hive_name,
        h.userhasaccess as user_has_access
    from {{ ref('stg_hive__user') }} u
left join {{ ref('stg_hive__hive') }} h on u.id =  h.userid


)

SELECT * FROM source_data