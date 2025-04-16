select
    s.store_id,
    a.address,
    ci.city_name,
    co.country_name,
    s.manager_staff_id,
    st.first_name || ' ' || st.last_name as manager_name
from {{ ref('staging_store') }} s
join {{ ref('staging_address') }} a on s.address_id = a.address_id
join {{ ref('staging_city') }} ci on a.city_id = ci.city_id
join {{ ref('staging_country') }} co on ci.country_id = co.country_id
join {{ ref('staging_staff') }} st on s.manager_staff_id = st.staff_id
