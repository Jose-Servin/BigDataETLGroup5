WITH raw_city AS (
    SELECT
        *
    FROM
        {{ source('dvd_rental', 'city') }}
)
SELECT
    city_id,
    city as city_name,
    country_id,
    last_update
FROM
    raw_city