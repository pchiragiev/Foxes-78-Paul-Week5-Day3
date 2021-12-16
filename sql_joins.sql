-- List all customers who live in Texas (use JOINs)
select customer.customer_id, customer.first_name, customer.last_name, address.district
from customer
join address
on customer.address_id = address.address_id
where address.district like 'Texas';

-- Get all payments above $6.99 with the Customer's Full Name
select customer.first_name, customer.last_name, payment.amount
from customer
join payment
on customer.customer_id = payment.customer_id
where payment.amount > 6.99;

-- Show all customers names who have made payments over $175(use subqueries)
select first_name, last_name
from customer
WHERE customer_id in(
	select customer_id
	from payment
	group by customer_id, amount
	having sum(amount) > 175
);

-- List all customers that live in Nepal (use the city table)
select customer.first_name, customer.last_name, country.country
from customer
join address
on customer.address_id = address.address_id
join city
on address.city_id = city.city_id
join country
on city.country_id = country.country_id
where country.country = 'Nepal';

-- Which staff member had the most transactions? *Mike Hillyer*
select count(rental.rental_id) as transactions, staff.first_name, staff.last_name
from staff
join rental
on staff.staff_id = rental.staff_id
group by staff.first_name, staff.last_name;

-- How many movies of each rating are there? *PG-13: 223, NC-17: 210, G: 178, PG: 194, R: 195*
select count(title), rating
from film
group by rating;

-- Show all customers who have made a single payment above $6.99 (Use Subqueries)
select *
from customer
WHERE customer_id in(
	select customer_id
	from payment
	group by customer_id, amount
	having amount > 6.99
	order by customer_id
);

-- How many free rentals did our stores give away? 24
select count(amount), amount
from payment
where amount < .01
group by amount;