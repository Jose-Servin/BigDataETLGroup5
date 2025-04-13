SELECT
    r.rental_id,
    r.rental_date,
    r.customer_id,
    p.payment_amount
FROM
    {{ ref('marts_fact_rentals') }} r 
LEFT JOIN {{ ref('staging_payment') }} p  
    ON r.rental_id = p.rental_id
WHERE
    p.rental_id IS NULL  
    OR p.payment_amount <= 0  
LIMIT 10
