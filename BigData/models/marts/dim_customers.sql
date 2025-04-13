select
    c.customer_id,
    c.first_name,
    c.last_name,
    c.email,
    c.address_id,
    a.address,
    a.district,
    a.city_id,
    ci.city_name,
    ci.country_id,
    co.country_name
from {{ ref('staging_customer') }} c
join {{ ref('staging_address') }} a on c.address_id = a.address_id
join {{ ref('staging_city') }} ci on a.city_id = ci.city_id
join {{ ref('staging_country') }} co on ci.country_id = co.country_id
