--SQL joins
select *
from customer
limit 5;

select *
from payment
limit 5;

select customer.customer_id, customer.first_name, customer.last_name, customer.email, payment.amount, payment.payment_date
from customer
inner join payment
on customer.customer_id = payment.customer_id;
-- you can assign an alias to the customer name so we don't type customer all the time.

select customer.customer_id, first_name, last_name,email, amount, payment_date
from customer
inner join payment
on customer.customer_id = payment.customer_id;

select c.customer_id, first_name, last_name,email, amount, payment_date
from customer as c
inner join payment as p
on c.customer_id = p.customer_id;

--left join

Select *
from film
limit 5;

Select *
from inventory
limit 5;

select film.film_id, title, inventory_id
from film
left join inventory
on film.film_id = inventory.film_id
where inventory_id is null
order by film.film_id desc;

select inventory_id, inventory.film_id, title
from film
right  join inventory
on film.film_id = inventory.film_id
where inventory_id is null;


---full join

select film.film_id, title, inventory_id
from film
full join inventory
on film.film_id = inventory.film_id
where inventory_id is null;
-- order by film.film_id desc;






