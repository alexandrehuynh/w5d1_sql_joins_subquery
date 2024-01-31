-- query customer and order tables to view data
select *
from customer;

select *
from order_;

-- DDL / DML
-- DDL gives a home (define) eg create, drop, alter
-- DML how we use it eg insert, update, delete

-- altering: add a column to a table - DDL
alter table customer
add phone_number VARCHAR(30);

-- update: update customer table -- DML
update customer
set phone_number = '925-519-3662'
where customer_id = 6;

-- RETURNING
update customer 
set phone_number = 'ico-pac-etic'
where customer_id = 5
returning *; -- returning all (*) of the specified column for the updated row

update customer 
set phone_number = 'ico-pac-etic'
where customer_id = 5
returning first_name, phone_number; -- returning only the first name and phone number

-- Deleting a specific row of data
delete from customer
where customer_id = 6
returning *;

delete from customer
where last_name = 'Yankovic'
returning *;

select *
from customer;

-- DDL
create table staff(
	staff_id SERIAL primary key,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	email VARCHAR(50),
	order_id INTEGER,
	phone_number INTEGER,
	foreign key (order_id) references order_(order_id)
)

select*
from staff;

-- updating the data type for a specific column
alter table staff 
alter column phone_number type VARCHAR(25);

-- drop (delete) a table from our database
drop table staff cascade -- cascade will drop any objects dependent on this table
