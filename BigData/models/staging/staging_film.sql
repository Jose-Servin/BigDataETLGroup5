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
    fulltext as full_text,
    description,
    language_id,
    last_update,
    rental_rate,
    release_year,
    rental_duration,
    replacement_cost,
    special_features
FROM
    raw_film