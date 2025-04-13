WITH raw_film AS (
    SELECT
        *
    FROM
        {{ source('dvd_rental', 'film') }}
)
SELECT
    film_id,
    title,
    rating,
    length,
    fulltext as full_text
FROM
    raw_film