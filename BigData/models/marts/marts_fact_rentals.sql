WITH rental_payment AS (
    SELECT
        r.rental_id,
        r.rental_date,
        r.customer_id,
        r.inventory_id,
        p.payment_id,
        p.payment_date,
        p.payment_amount,
        r.return_date,
        CASE
            WHEN p.payment_id IS NULL THEN 'Unpaid'
            WHEN p.payment_amount <= 0 THEN 'Invalid Payment'
            ELSE 'Paid'
        END AS payment_status
    FROM
        {{ ref('staging_rental') }} r
    LEFT JOIN {{ ref('staging_payment') }} p
        ON r.rental_id = p.rental_id
)

SELECT
    rental_id,
    rental_date,
    customer_id,
    inventory_id,
    payment_id,
    payment_date,
    payment_amount,
    return_date,
    payment_status
FROM
    rental_payment
