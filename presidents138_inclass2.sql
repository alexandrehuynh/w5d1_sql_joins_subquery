-- JOIN & SUB QUERIES --

select *
from customer;

select *
from order-;

-- INNER JOIN --
-- select from TABLE A
-- join from TABLE B
-- customer = TABLE A
-- order = TABLE B
-- we can select from both tables when using a JOIN
select first_name, last_name, order_id, amount
from customer -- table A
inner join order_ -- table B
on customer.customer_id = order_.customer_id;

-- LEFT JOIN --
select first_name, last_name, order_date, amount
from customer
left join order_ 
on customer.customer_id = order_.customer_id;

-- RIGHT JOIN --
select first_name, last_name, order_date, amount
from customer
right join order_ 
on customer.customer_id = order_.customer_id;

-- FULL JOIN --
select first_name, last_name, order_date, amount
from customer
full join order_ 
on customer.customer_id = order_.customer_id;