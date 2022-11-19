select *
from {{ ref('fct_reviews') }} r
inner join {{ ref('dim_listings_cleansed') }} l 
on r.listing_id = l.listing_id
{# USING (listing_id) #}
where r.review_date <= l.created_at
limit 10
