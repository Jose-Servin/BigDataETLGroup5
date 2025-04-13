WITH raw_customer AS (
    SELECT
        *
    FROM
        {{ source('dvd_rental', 'customer') }}
)
SELECT
    customer_id,
    first_name,
    last_name,
    email,
    active,
    store_id,
    activebool,
    address_id,
    create_date,
    last_update
FROM
    raw_customer