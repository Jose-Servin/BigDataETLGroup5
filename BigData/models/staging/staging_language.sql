WITH raw_language AS (
    SELECT
        *
    FROM
        {{ source('dvd_rental', 'language') }}
)
SELECT
    language_id,
    name as language_name,
    last_update
FROM
    raw_language