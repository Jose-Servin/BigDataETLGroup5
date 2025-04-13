WITH raw_category AS (
    SELECT
        *
    FROM
        {{ source('dvd_rental', 'category') }}
)
SELECT
    category_id,
    name,
    last_update
FROM
    raw_category