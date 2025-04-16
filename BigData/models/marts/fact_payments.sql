select
    p.payment_id,
    p.customer_id,
    p.staff_id,
    r.inventory_id,
    i.film_id,
    i.store_id,
    p.rental_id,
    p.payment_amount,
    p.payment_date,
    date_trunc('month', p.payment_date) as payment_month
from {{ ref('staging_payment') }} p
left join {{ ref('staging_rental') }} r on p.rental_id = r.rental_id
left join {{ ref('staging_inventory') }} i on r.inventory_id = i.inventory_id
