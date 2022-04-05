DAY 2 

-- 1. Which actor has appeared in the most films?
Use sakila; 
SELECT count(film_actor.actor_id), actor.first_name, actor.last_name
FROM actor INNER JOIN film_actor ON actor.actor_id = film_actor.actor_id
GROUP BY film_actor.actor_id order by count(film_actor.actor_id) desc limit 1;

-- 2. Most active customer (the customer that has rented the most number of films)
Use sakila; 
SELECT count(rental.customer_id), customer.first_name, customer.last_name
FROM customer INNER JOIN rental ON customer.customer_id= rental.customer_id
GROUP BY rental.customer_id ORDER BY count(rental.customer_id) desc limit 1;

-- 3. List number of films per category.
Use sakila;
SELECT count(film_id), name 
FROM category as c
INNER JOIN film_category as f
ON f.category_id= c.category_id
GROUP BY c.category_id, c.name

-- 4. Display the first and last names, as well as the address, of each staff member. 
Use sakila;
SELECT address, first_name, last_name 
FROM staff as s 
INNER JOIN address as a
ON s.address_id= a.address_id;


-- 5. Display the total amount rung up by each staff member in August of 2005.
-- (lo que han cobrado cada staff en total, en agost. 2005)
Use sakila;
SELECT  sum(amount), first_name, last_name 
FROM staff as s
RIGHT JOIN payment as p 
using (staff_id)
where payment_date between "2005-08-01" and "2005-09-01"
GROUP BY staff_id

-- 6. List each film and the number of actors who are listed for that film.
Use sakila;
SELECT title, count(actor_id)
FROM film as f
INNER JOIN film_actor as f_a
using (film_id)
GROUP BY film_id

-- 7. Using the tables payment and customer and the JOIN command, list the total paid 
-- by each customer. List the customers alphabetically by last name.
Use sakila;
SELECT count(amount), first_name, last_name
FROM customer as c
INNER JOIN payment as p
USING (customer_id)
GROUP BY customer_id
ORDER BY last_name asc