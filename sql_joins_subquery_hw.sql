-- Week 5 - Wednesday Questions

-- 1. List all customers who live in Texas (use JOINs)
select first_name, last_name, district 
from customer
inner join address
on customer.address_id = address.address_id 
where district  = 'Texas'; -- 5 Texans (Jennifer, Kim, Richard, Bryan, & Ian)

-- 2. Get all payments above $6.99 with the Customer's Full Name
select first_name, last_name
from customer
inner join payment
on customer.customer_id = payment.customer_id  
where amount > 6.99; -- brings ALL payments 1406

select first_name, last_name -- not an answer, for personal learning
from customer
where customer_id in ( -- membership check is eliminating duplicate
	select customer_id 
	from payment
	where amount > 6.99
); -- only gets back 539 because it gets rid of duplicates

-- 3. Show all customers names who have made payments over $175(use subqueries)
select first_name, last_name
from customer
where customer_id in (
	select customer_id 
	from payment
	group by customer_id 
	having sum(amount) > 175
	order by sum(amount) desc; -- 6 high ballers ( Rhonda, Clara, Eleanor, Marion, Tommy, & Karl)
)

-- 4. List all customers that live in Nepal (use the city table)
select first_name, last_name, country 
from customer
inner join address
on customer.address_id = address.address_id 
inner join city
on address.city_id  = city.city_id  
inner join country
on city.country_id  = country.country_id  
where country  = 'Nepal'; -- Kevin Schuler

-- 5. Which staff member had the most transactions?
select first_name, last_name, count(payment_id)
from staff
inner join payment
on staff.staff_id = payment.staff_id 
group by first_name, last_name; -- John Stephens 7304

-- 6. How many movies of each rating are there?
select rating, count (film_id)
from film
group by rating; -- G: 178, PG: 194, PG-13: 223, NC-17: 210, R: 195

-- 7.Show all customers who have made a single payment above $6.99 (Use Subqueries)
select first_name, last_name
from customer
where customer_id in (
	select customer_id 
	from payment
	where amount > 6.99
	group by customer_id 
	having count(customer_id) = 1 -- 130 one-hit wonders
)

-- 8. How many free rentals did our stores give away?
select store.store_id, count(payment.rental_id)
from store
inner join staff
on store.store_id = staff.store_id 
inner join payment
on staff.staff_id = payment.staff_id 
where amount = 0
group by store.store_id; -- store 1: 15, store 2: 9 = 24 total

select count(rental_id)
from payment
where amount = 0; -- total: 24