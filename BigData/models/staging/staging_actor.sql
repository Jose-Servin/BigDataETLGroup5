WITH raw_actor AS (
    SELECT
        *
    FROM
        {{ source('dvd_rental', 'actor') }}
)
SELECT
    actor_id,
    first_name,
    last_name,
    last_update
FROM
    raw_actor