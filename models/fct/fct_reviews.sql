{{
  config(
    materialized = 'incremental',
    on_schema_change='fail'
    )
}}
with src_rev as (
  select * from {{ref("src_reviews")}}
)
select
{{ dbt_utils.surrogate_key(['LISTING_ID', 'REVIEW_DATE', 'REVIEWER_NAME', 'REVIEW_TEXT']) }} as review_id,
* 
from src_rev
where src_rev.review_text is not null

{% if is_incremental() %}
  AND review_date > (select max(review_date) from {{ this }})
{% endif %}
