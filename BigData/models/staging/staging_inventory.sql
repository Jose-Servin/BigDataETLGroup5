WITH raw_inventory AS (
    SELECT
        *
    FROM
        {{ source('dvd_rental', 'inventory') }}
)
SELECT
    film_id,
    store_id,
    inventory_id,
    last_update
FROM
    raw_inventory