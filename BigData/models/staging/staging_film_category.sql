WITH raw_film_category AS (
    SELECT
        *
    FROM
        {{ source('dvd_rental', 'film_category') }}
)
SELECT
    film_id,
    category_id
FROM
    raw_film_category