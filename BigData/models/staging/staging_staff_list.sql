WITH raw_staff_list AS (
    SELECT
        *
    FROM
        {{ source('dvd_rental', 'staff_list') }}
)
SELECT
    ID as staff_id,
    SID,
    city,
    name as staff_name, 
    phone as staff_phone,
    address as staff_address,
    country,
    'zip code' as staff_zip_code
FROM
    raw_staff_list