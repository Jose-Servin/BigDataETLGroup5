WITH raw_payment AS (
    SELECT
        *
    FROM
        {{ source('dvd_rental', 'payment') }}
)
SELECT
    payment_id,
    customer_id,
    staff_id,
    rental_id,
    amount as payment_amount,
    payment_date,
FROM
    raw_payment