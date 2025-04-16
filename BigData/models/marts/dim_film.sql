select
    f.film_id,
    f.title,
    f.description,
    f.release_year,
    l.language_name,
    f.length,
    f.rating,
    c.name as category
from {{ ref('staging_film') }} f
join {{ ref('staging_language') }} l on f.language_id = l.language_id
left join {{ ref('staging_film_category') }} fc on f.film_id = fc.film_id
left join {{ ref('staging_category') }} c on fc.category_id = c.category_id
