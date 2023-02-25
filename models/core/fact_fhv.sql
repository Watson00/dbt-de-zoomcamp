{{ config (materialized="table") }}


with fhv_data as (
    select *, 
        'FHV' as service_type 
    from {{ ref('stg_fhv_tripdata') }}
), 


trips_unioned as (
    select * from fhv_data
), 

dim_zones as (
    select * from {{ ref('dim_zones') }}
    where borough != 'Unknown'
)
select 
    trips_unioned.dispatching_base_num, 
    trips_unioned.pickup_locationid, 
    trips_unioned.dropoff_locationid,
    trips_unioned.pickup_datetime, 
    trips_unioned.dropoff_datetime, 
    trips_unioned.SR_Flag,
    trips_unioned.Affiliated_base_number,
    dropoff_zone.borough as dropoff_borough, 
    dropoff_zone.zone as dropoff_zone,  
    pickup_zone.borough as pickup_borough, 
    pickup_zone.zone as pickup_zone, 
from trips_unioned
inner join dim_zones as pickup_zone
on trips_unioned.pickup_locationid = pickup_zone.locationid
inner join dim_zones as dropoff_zone
on trips_unioned.dropoff_locationid = dropoff_zone.locationid