WITH raw_film_actor AS (
    SELECT
        *
    FROM
        {{ source('dvd_rental', 'film_actor') }}
)
SELECT
    film_id,
    actor_id
FROM
    raw_film_actor