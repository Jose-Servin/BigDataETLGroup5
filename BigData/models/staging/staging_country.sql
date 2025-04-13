WITH raw_country AS (
    SELECT
        *
    FROM
        {{ source('dvd_rental', 'country') }}
)
SELECT
    country_id,
    country as country_name,
    last_update
FROM
    raw_country