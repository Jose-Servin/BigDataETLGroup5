WITH raw_film_list AS (
    SELECT
        *
    FROM
        {{ source('dvd_rental', 'film_list') }}
)
SELECT
    FID as film_id,
    title as film_title,
    actors,
    price,
    length as film_length,
    rating,
    category,
    description
FROM
    raw_film_list