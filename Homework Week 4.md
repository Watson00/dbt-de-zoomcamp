#  Homework Week 4

### Question 1
select count(*) from de-ny-taxis.production.fact_trips; 
**61648442**

### Question 2
--89.9/10.1
![image](https://user-images.githubusercontent.com/7277548/221350890-8633c70c-61a0-4e09-9881-931dd80df308.png)


### Question 3
Select count(*) from de-ny-taxis.dbt_wluis.stg_fhv_tripdata; 
**43244696**

### Question 4
Select count(*) from de-ny-taxis.dbt_wluis.fact_fhv; 
**22998722**

### Question 5
Select extract(month FROM pickup_datetime) as mes,count(*)  from de-ny-taxis.dbt_wluis.fact_fhv
group by mes
order by mes desc; **January**
![image](https://user-images.githubusercontent.com/7277548/221350938-f530fc58-c10f-4ef3-af02-fde03ab10dba.png)
