SELECT
    *
FROM
    {{ ref('staging_rental') }}
WHERE return_date < rental_date
LIMIT 10
