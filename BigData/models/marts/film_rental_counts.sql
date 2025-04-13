select
    f.film_id,
    f.title,
    count(*) as rental_count
from {{ ref('staging_rental') }} r
join {{ ref('staging_inventory') }} i on r.inventory_id = i.inventory_id
join {{ ref('staging_film') }} f on i.film_id = f.film_id 
group by f.film_id, f.title
order by rental_count desc
