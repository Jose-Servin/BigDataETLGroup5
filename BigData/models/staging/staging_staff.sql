WITH raw_staff AS (
    SELECT
        *
    FROM
        {{ source('dvd_rental', 'staff') }}
)
SELECT
    staff_id,
    store_id,
    first_name,
    last_name,
    email as staff_email,
    active,
    picture as staff_picture,
    password,
    address_id,
    last_update
FROM
    raw_staff