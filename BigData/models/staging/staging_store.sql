WITH raw_store AS (
    SELECT
        *
    FROM
        {{ source('dvd_rental', 'store') }}
)
SELECT
    store_id,
    address_id,
    manager_staff_id,
    last_update
FROM
    raw_store