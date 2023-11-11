SELECT * FROM actor;
SELECT first_name, last_name FROM actor;
SELECT * FROM city;

--send promotional email to existing customers, we need to know their first and last name.
-- HINT: use the customer table, select column needed and parse query
select first_name, last_name, email from customer;

-- select distinct, with or without parenthesis, use film table, check the column you need to query.
select distinct  (release_year)  from film;
select distinct (rental_rate) from film;
select distinct (rating) from film;

--select count  . seleect count (distinct column name)
select  distinct (amount)from payment;

select  count (distinct amount)from payment;

--- WHERE , select column needed, from table, where conditions are met
-- comparison operators  >,  <,  =,  >=,  <= , <> or (!=) not equal to
-- AND, OR,  NOT

SELECT * FROM customer
WHERE first_name = 'Jared';

select title from film
where rental_rate > 4 and replacement_cost >= 19.99
and rating='R';
-- AND

select count(title) from film
where rental_rate > 4 and replacement_cost >= 19.99
and rating='R';

-- OR
select count(*) from film
where rating = 'R' or rating= 'PG-13';

--not equal

select * from film
where rating != 'R';

-- how many customers have the first name Jared, translate business question to sql query
-- what is the email for the customer with the name Nancy Thomas
-- make sure name is capitalize, use strings for the names and specify column.

select email from customer
where first_name = 'Nancy' and last_name = 'Thomas';

-- Outlaw hanky movie description
-- use film tavble, make sure strings have quote , capitalization correction

select description from film
where title = 'Outlaw Hanky';

-- get the phonenumber for the customer who lives at 259 ipoh drive
-- use address tab;e, use correct capitalization.

select phone from address
where address = '259 Ipoh Drive';

---ORDER by , select colum. from tab;e, ordey by column ASC, DESC

select * from customer
order by first_name ASC;

--- by store id

select * from customer
order by store_id;

select store_id, first_name,last_name from customer
order by store_id DESC,first_name ASC;

-- you can order by a column which isnot selected

select first_name,last_name from customer
order by store_id DESC,first_name ASC;

-- LIMIT

select * from payment
order by payment_date ASC;

select * from payment
where amount != 0.00
order by payment_date DESC
limit 5;

-- challenge task.
-- what are the customer ids of the first 10 customers who created payment.
-- payment table, date and customer id.

select customer_id from payment
order by payment_date asc
limit 10;

---- titles of the 5 shortest movies, in runtime length

select * from  film;

-- use orderby linti, not where, title and length

select title,length  FROM film
order by length asc
limit 5;

--- how many movies have a runtime of less than or equals to 50 minutes.

select count(*) from film
where length <= 50;

-- OR

select count(title) from film
where length <= 50;

--- BETWEEN
select * from payment
limit 2;

select * from payment 
where amount between 8 and 9;

select count( *) from payment 
where amount between 8 and 9;

select count( *) from payment 
where amount not between 8 and 9;

-- put date in quotes

select  * from payment 
where payment_date between '2007-02-01' and '2007-02-15';

-- IN instead of = , not IN

select * from payment
limit 2;

select distinct(amount) from payment
order by amount;

select * from payment
where amount in (0.99, 1.99,1.98);


select count(*) from payment
where amount in (0.99, 1.99,1.98);

select count(*) from payment
where amount not in (0.99, 1.99,1.98);

select * from customer
where first_name in ('John', 'Julie','Jake');
-- like and ilike

select * from customer
where first_name like 'J%' and last_name like'S%';

select count(*) from customer
where first_name like 'J%' and last_name like'S%';
--iLike
select * from customer
where first_name ilike 'J%' and last_name like'S%';

select * from customer
where first_name like '%her%';
-- underscore for single replacement character.
select * from customer
where first_name like 'A%' and last_name not like  'B%'
order by last_name;

-- Challenge task.
-- how many payment transaction were greater than 5,00, use count here.

select count(*) from payment
where amount > '5.00';

-- OR

select count(amount) from payment
where amount > '5.00';

-- How many actors have a first name that start with the letter P

select count(first_name) from customer
where first_name like 'P%';
-- OR 
select count(*) from customer
where first_name like 'P%';

-- count, distinct- How many unique districts are our customers from.

select count(distinct (district)) from address;

--- Retrieve the list of names for those distinct districts from the previous  query
select * from address;

select distinct(district)
from address;

-- how many films have  a rating of R and a replacement cost between $ 5 and $15.

select count(*) from film
where rating = 'R' and replacement_cost between '5.00' and '15.00';
-- or without strings
select count(*) from film
where rating = 'R' and replacement_cost between 5 and 15;

-- How many films have the word Truman somehwere in the title.

select count(*) from film
where title like '%Truman%';

--- GROUP BY  -- AVG, COUNT, MAX, MIN, SUM, ROUND
-- only in the select of having clause, 

select min(replacement_cost) from  film;
select max(replacement_cost) from  film;
select max(replacement_cost) , min (replacement_cost)from  film;
select avg(replacement_cost)
from film;
select round(avg(replacement_cost), 2) from film; 

select sum(replacement_cost) from film; 

-- select category_col, agg func(data_col) form table goub by category_col
-- the group by clause must appear right after a from or where statement
-- in the select statement, columns must either have an aggregate function or be in the GroupBy call.
-- eg, SELECT company, distinct, SUM (sales) FROM finanace_table GROUP BY company,division
-- Select company, sum(sales) from finance_table Group by company, order by sum(sales) limit 5;
 select customer_id from payment
 group by customer_id
 order by customer_id;

select customer_id, sum(amount) from payment
Group by customer_id
order by sum(amount) desc;

select customer_id, count(amount )from payment
group by customer_id
order by count(amount) desc;

select  staff_id, customer_id,sum(amount)from payment
group by staff_id, customer_id
order by customer_id;
-- Date function
select date (payment_date) from payment
Group by date (payment_date)
order by sum(amount) desc;


select date (payment_date), sum(amount)from payment
Group by date (payment_date)
order by sum(amount) desc;

--- staff that handeled the most payments in terms of numbers  of payment processed not price.
-- how many payments did wasch staff member handle. , count, group by , order by 

select staff_id, count(payment_id)from payment
group by staff_id
order by staff_id asc;

----OR  use an * too 
select staff_id, count(amount)from payment
group by staff_id;

-- what is the average replacement cost per mpaa rating , you may need to expand the avg column to view results.
select rating, round(avg(replacement_cost), 2)from film
Group by rating;

-- OR without round

select rating, avg(replacement_cost)from film
Group by rating;

-- what are the customer ids of the top 5 customers by total spend in dollars. limit, count, group by
-- you can order by the results of an aggregate function e.g sum(amount)

select customer_id, sum(amount) from payment
group by customer_id 
order by sum(amount) desc
limit 5;

--- HaVING Clause, comes after group by example,  SELECT  company, SUM(sales) FROM finanace_table
-- GROUP by company, HAVING Sum(sales)> 1000.

select customer_id , sum(amount) from payment
--where customer_id not in (184,87,477)
Group by customer_id
having sum(amount) >100;


select store_id, count(customer_id) from customer
group by store_id;

select store_id, count(*) from customer
group by store_id
having count(customer) > 300;

select store_id, count(customer_id) from customer
group by store_id
having count(customer_id) > 300;

-- what customer id are eligible for platinum status,  which customer ids have 40 or more transactions.

select customer_id, count(amount) from payment
Group by customer_id
Having count(amount) >= 40;

-- or
select customer_id, count(*) from payment
Group by customer_id
Having count(amount) >= 40;

---customer ids , that have spent more than 100 dollars in payment transcations with staff id member 2.
-- payment table, staff_id, > 100, amount ,where , sum

select customer_id, sum(amount) from payment
where staff_id = '2'
group by customer_id
having sum(amount) >= 100;


-- customer id that have spent over 110 dollars with staff id 2

select customer_id, sum(amount) from payment
where staff_id = '2'
group by customer_id
having sum(amount) >= 110;

-- how many films begin with the letter J
select count(*) from film
where title like 'J%';
-- which customer has the highest customer id  number whose name starts with an E and has address Id lower than 500 

select * from customer;

select first_name, last_name from customer
where  first_name like 'E%'
and address_id < 500
order by customer_id desc
limit 1;

--- JOINS-- combining info from diferent tables.
-- AS alias clause for column aliases 
-- INNER JOIN
-- OUTER JOIN
--FULL JOINS
--UNIONS
SELECT COUNT(amount) AS num_transactions
FROM payment;


SELECT customer_id , sum(amount) AS total_spent
FROM payment
Group by customer_id;
--- the alias appears at the end and cannot be used to filter by
SELECT customer_id , sum(amount) AS total_spent
FROM payment
Group by customer_id
having sum(amount) > 100;

select customer_id, amount as new_name
from payment
where amount >2;

---INNER JOIN
----select * from tablea inner join tableb on tableA.col_match = tableB.col_match
--Registration and login table, select * from registration inner join logins on registrations.name=logins.name
-- select reg_id,logins.name,logi_id from registrations inner join logins on registrations.name=logins.name
--- inner join order doesnt matter, join is also default as inner join in padmin

select * from payment
inner join customer
on payment.customer_id = customer.customer_id;


select payment_id ,payment.customer_id, first_name from payment
inner join customer
on payment.customer_id = customer.customer_id;

--Outer Joins.... Ful outer join, left outer join, right outer join.
---SELECT * FROM TableB, FULL OUTER JOIN Table A ON TableA.col_match = TableB.col_match
--select* from table a full outer join table b on table a.col_match -= tableb.col_match where tablea.id is null or table.id is null

--full outer join
Select * From customer 
Full Outer Join payment
On customer.customer_id = payment.customer_id;

Select * From customer 
Full Outer Join payment
On customer.customer_id = payment.customer_id
Where customer.customer_id Is null
Or payment.payment_id Is null;

select count(distinct customer_id) from customer;

-- LEft outer join or left join
--- select * from table a left oter join table b o tablea.col_match = tableb.col_match
-- order matters, have to secify what the table will be on the left
-- unique rows found on table A left not found on Tabkkle b

Select film.film_id,title, inventory_id,store_id
from film
left join inventory on
inventory.film_id = film.film_id
Where inventory.film_id is null;

-- right Join  select * from table a right join tableb on tablea.col_match = tableb.col_match, where tablea.id is null
-- Union, combine results of select statements
-- select column_name from table1  UNION select column_name from table2; order by name
-- Join challenge tasks
-- what are the emails of the customers who live in california?
Select district, email From address
inner  Join customer on
address.address_id = customer.address_id
where district = 'California';

-- get a list of all movies "Nick Wahlberg" has been in, actor, film, film_actor

Select title, first_name, last_name
from film_actor inner join actor
on film_actor.actor_id = actor.actor_id 
inner join film
on film_actor.film_id = film.film_id
where first_name = 'Nick '
and last_name = 'Wahlberg';

-- ADvanced SQL, Timestamps and Extract
--Timezone, Now, TimeOF Day , Current_time, Current_date.
Show All ;
show timezone;

Select Now();
Select Timeofday();
Select current_time;
Select current_date;

-- EXTRACT(), year, month, day, week, quarter  EXTRACT (YEAR FROMdate_col)
--AGE AGE(date_col)
-- to_char(date_col, mm,dd,yyy)

select  extract(year from payment_date) as  year from payment;

select  extract(month from payment_date) as  pay_month from payment;

select extract (quarter from payment_date) from payment;

select age ( payment_date) from payment;

select To_char(payment_date, 'mm/dd/  yyyy') from payment;

-- During which months did payment occur
select extract (month from payment_date) from payment;

select to_char(payment_date,'Month') from payment;
-- select all months, so use distinct function
select distinct(to_char(payment_date,'Month')) from payment;

-- show the total payments on Monday 

SELECT COUNT(*)
FROM payment
WHERE extract (dow from payment_date) = '1';

-- Mathematical operators and functions
--+ - / etc
--abs, pi, sqrt, trunc , functions

select * from film;

-- what % of the rental rate is replacement cost
select rental_rate/replacement_cost AS percent_cost from film;

select round(rental_rate/replacement_cost, 4)*100 as perecent_cost 
from film;

-- 10% of replacemetn cost is how much

select 0.1 * replacement_cost  as deposit
from film;

--strings functions an doperations


select length(first_name) from customer;

-- string concatenation

select first_name || Last_name
from customer;

select first_name ||'   '|| last_name as full_name
from customer;
-- make name appear in uppercase
select upper(first_name) ||'   '|| upper( last_name) as full_name
from customer;

-- create email for the customers

select first_name ||  last_name || '@gmail.com' as email_address
from customer;
-- converting names  to show in lower case for email

select lower(first_name) ||  lower (last_name) || '@gmail.com' as email_address
from customer;

--grabbing the email  using a shorter name.
select lower(left(first_name,1) )|| lower( last_name) || '@gmail.com' as email_address
from customer;
-- check documentation for more functions

-- SUBQUERY and EXIST function, performing a query on a results
--example, select student,grade from test_scores where grade >(select avg(grade)from test_score)
-- select student,grade from test_scores where grade >(70), subquery is performed first inside the parentheses, 
-- we can use the IN operator in conjunction with a subquery to check against multiple resultes returned
--select student,grade from test_scores where student in(select student from honor_roll_table)
-- we select average rental_rate
select avg(rental_rate)
from film;

--then we add queries
select title,rental_rate
from film
where rental_rate > (select avg (rental_rate) from film);
-- sub queries with join

select inventory.film_id
from rental
inner join inventory on inventory.inventory_id = rental.inventory_id
where return_date between '2005-05-29' and '2005-05-30';

-- using the IN operator to select film_id and title
select film_id, title
from film
where film_id in 
(select inventory.film_id
from rental
inner join inventory on inventory.inventory_id = rental.inventory_id
where return_date between '2005-05-29' and '2005-05-30'
order by title);

-- EXIST  operator.
--first_name and last_name of customers 

select first_name, last_name
from customer as c
where exists 
(select * from payment as p 
where p.customer_id = c.customer_id
and amount > 11);

--Not exists
select first_name, last_name
from customer as c
where not exists 
(select * from payment as p 
where p.customer_id = c.customer_id
and amount > 11);

-- Self join, always use an alias

-- find al the pairs of films with the same length
select title, length  from film
where length = 117;

-- matching up films with other films with the same length/runtime

select f1.title, f2.title, f1.length
from film as f1
inner join film as f2 on 
f1.film_id != f2.film_id
and f1.length = f2.length











































































