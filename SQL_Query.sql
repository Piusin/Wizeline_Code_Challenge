select 
s.staff_id, s.first_name, s.last_name, s.email,st.store_id
c.first_name customer_first_name, c.last_name customer_last_name, c.email customer_email,
ad.address
sum(p.amount) payment_amount, count(distinct inventory_id) rented_dvds_count
from staff s
left join payment p on s.staff_id = p.staff_id
left join rental r on s.staff_id = r.staff_id
left join customer c on r.customer_id = c.customer_id
left join address ad on c.address_id  = ad.address_id 
left join store st  on s.store_id = st.store_id
where s.staff_id = 1
group by s.staff_id, s.first_name, s.last_name, s.email, c.first_name, c.last_name,c.email, st.store_id
limit 5