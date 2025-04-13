WITH raw_rental AS (
    SELECT
        *
    FROM
        {{ source('dvd_rental', 'rental') }}
)
SELECT
    rental_id,
    customer_id,
    staff_id,
    inventory_id,
    rental_date,
    return_date,
    last_update
FROM
    raw_rental