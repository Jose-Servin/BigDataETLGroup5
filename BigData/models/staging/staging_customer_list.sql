WITH raw_customer_list AS (
    SELECT
        *
    FROM
        {{ source('dvd_rental', 'customer_list') }}
)
SELECT
    id as customer_id,
    SID,
    city,
    name as customer_name,
    notes,
    phone as customer_phone,
    address as customer_address,
    country as customer_country,
    'zip code' as customer_zip_code,
FROM
    raw_customer_list