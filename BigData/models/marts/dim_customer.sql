select
    c.customer_id,
    c.first_name || ' ' || c.last_name as customer_full_name,
    c.email,
    a.address,
    ci.city_name,
    co.country_name,
    c.active,
    c.create_date
from {{ ref('staging_customer') }} c
join {{ ref('staging_address') }} a on c.address_id = a.address_id
join {{ ref('staging_city') }} ci on a.city_id = ci.city_id
join {{ ref('staging_country') }} co on ci.country_id = co.country_id
