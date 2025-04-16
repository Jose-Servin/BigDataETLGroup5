WITH rentals AS (
    SELECT
        r.rental_id,
        r.rental_date,
        r.return_date,
        DATE_TRUNC('MONTH', r.rental_date) AS rental_month,
        r.inventory_id,
        i.film_id,
        i.store_id,
        r.customer_id,
        r.staff_id
    FROM {{ ref('staging_rental') }} r
    JOIN {{ ref('staging_inventory') }} i ON r.inventory_id = i.inventory_id
),

payments AS (
    SELECT
        rental_id,
        SUM(payment_amount) AS total_payment_amount
    FROM {{ ref('staging_payment') }}
    GROUP BY rental_id
)

SELECT
    r.*,
    p.total_payment_amount,
    COALESCE(DATEDIFF(DAY, r.rental_date, r.return_date), 0) AS rental_duration_days
FROM rentals r
LEFT JOIN payments p ON r.rental_id = p.rental_id
