with src_hosts as (
    select * from {{ref("src_hosts")}}
)
select
    HOST_ID,
    nvl(HOST_NAME, 'Anonymous') as HOST_NAME,
    IS_SUPERHOST,
    CREATED_AT,
    UPDATED_AT
from src_hosts

