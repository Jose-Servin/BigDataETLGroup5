WITH raw_address AS (
    SELECT
        *
    FROM
        {{ source('dvd_rental', 'address') }}
)
SELECT
    address_id,
    address,
    city_id,
    address2,
    district,
    postal_code,
    phone as address_phone_number,
    last_update
FROM
    raw_address