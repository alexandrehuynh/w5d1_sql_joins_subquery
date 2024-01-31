-- JOINS & SUBQUERIES FOR REAL FOR REAL --
select *
from staff;

select *
from rental;

select staff_id, count(rental_id) as rental_count
from rental
group by staff_id;

--    staff tabble
select first_name, last_name, staff.staff_id, count(staff.staff_id)
from staff
full join rental -- table B
on staff.staff_id = rental.staff_id  -- we match records from table a to table b, to get the 
									 --number of rental_id associated with each staff id
group by staff.staff_id; -- this glues the count of the staff_id where they match the rental_id 
						 --to a specific staff member

-- JOIN BETWEEN THE ACTOR AND FILM_ACTOR TABLE
select *
from actor;

select *
from film_actor;

select * 
from film;

--     actor           actor      actor      film_actor
select actor.actor_id, first_name, last_name, film_id
from actor
inner join film_actor
on actor.actor_id = film_actor.actor_id;

-- triple join bonaza from actor table to the film_actor table to the film table
select actor.actor_id, first_name, last_name, film.film_id, title, description 
from actor
inner join film_actor
on actor.actor_id = film_actor.actor_id -- link actor with film_actor using actor.id
inner join film
on film_actor.film_id  = film.film_id; -- link film_actor to film using film_id
-- using primiary key or foreign keys for continuity and consistency purposes

-- create a inner join to see which customers live in Angola
select *
from country;
select *
from city;
select *
from customer;
select *
from address;

select first_name, last_name, country -- technically don't need to select customer.address_id, address.city_id, city.country_id
from customer
inner join address
on customer.address_id = address.address_id
inner join city 
on address.city_id = city.city_id
inner join country
on city.country_id = country.country_id
where country = 'Angola';

-- SUBQUERIES -- query inside of a query
-- using the AVG()
select avg(amount)
from payment;

select *
from payment
where amount > (
	select avg(amount) from payment
);

-- find everyone who lives in Dallas
select first_name, last_name 
from customer
where address_id in (
	select address_id 
	from address
	where city_id in (
		select city_id
		from city
		where city = 'Dallas'
	)
);
-- can only one when doing subqueries

select *
from city
where city = 'Dallas';

select *
from address 
where city_id = 135;

select *
from customer
where address_id = 405;
-- essencially what we have to do if not for sub-queries

-- grab all movies of the action genre
select *
from film;
select *
from film_category;
select *
from category;

select film_id, title, description 
from film
where film_id in (
	select film_id 
	from film_category
	where category_id in (
		select category_id
		from category
		where name = 'Action'
	)
);

-- getting all the customer who paid over $175
select *
from customer 
where customer_id in ( 
	select customer_id 
	from payment 
	group by customer_id 
	having sum(amount) > 175
	order by sum(amount) desc
)