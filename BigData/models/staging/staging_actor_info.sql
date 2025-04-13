WITH raw_actor_info AS (
    SELECT
        *
    FROM
        {{ source('dvd_rental', 'actor_info') }}
)
SELECT
    actor_id,
    first_name,
    last_name,
    film_info
FROM
    raw_actor_info