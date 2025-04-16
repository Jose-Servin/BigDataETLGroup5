with rentals as (
    select * from {{ ref('fact_rentals') }}
),

payments as (
    select
        rental_id,
        max(payment_date) as latest_payment_date,
        sum(payment_amount) as total_payment_amount
    from {{ ref('fact_payments') }}
    group by rental_id
),

customer as (
    select * from {{ ref('dim_customer') }}
),

film as (
    select * from {{ ref('dim_film') }}
),

store as (
    select * from {{ ref('dim_store') }}
)

select
    r.rental_id,
    r.rental_date,
    r.return_date,
    r.rental_month,
    r.rental_duration_days,

    -- Payment info
    coalesce(p.total_payment_amount, r.total_payment_amount) as total_payment_amount,
    p.latest_payment_date,

    -- Customer info
    c.customer_id,
    c.customer_full_name,
    c.email as customer_email,
    c.city_name as customer_city,
    c.country_name as customer_country,
    c.active as customer_active,

    -- Film info
    f.film_id,
    f.title as film_title,
    f.category as film_category,
    f.rating as film_rating,
    f.length as film_length,
    f.language_name as film_language,

    -- Store info
    s.store_id,
    s.address as store_address,
    s.city_name as store_city,
    s.country_name as store_country,
    s.manager_name as store_manager_name,

    -- Staff
    r.staff_id

from rentals r
left join payments p on r.rental_id = p.rental_id
left join customer c on r.customer_id = c.customer_id
left join film f on r.film_id = f.film_id
left join store s on r.store_id = s.store_id
