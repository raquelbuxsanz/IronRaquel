-- DAY 3
-- 1. How many copies of the film Hunchback Impossible exist in the inventory system?
Use sakila;
SELECT title, count(inventory_id) 
FROM film as f
LEFT JOIN inventory as i 
USING (film_id) 
GROUP BY film_id
HAVING title = 'Hunchback Impossible'


-- 2. List all films whose length is longer than the average of the length of all the films.
-- Nombra todas las películas cuya duración sea mas larga que la media de todas las películas. 
Use sakila;
SELECT length, title from film 
WHERE length> (SELECT avg(length) from film);


-- 3. Use subqueries to display all actors who appear in the film Alone Trip.
Use sakila;
SELECT first_name, last_name FROM actor WHERE actor_id in
	(SELECT actor_id from film_actor
    where film_id in 
	 (select film_id from film
     where title = "Alone Trip"))
     
-- 4. Identify all movies categorized as family films.
Use sakila;
SELECT title FROM film WHERE film_id in
	(SELECT film_id FROM film_category
    WHERE category_id in 
    (select category_id from category 
    where name = "Family"));

-- 5. Get name and email from customers from Canada using subqueries. 
-- Do the same with joins. Note that to create a join, you will have to identify the correct
 -- tables with their primary keys and foreign keys, that will help you get the relevant information.
 Use sakila;
 SELECT first_name, email from customer where address_id in 
	(select address_id from address
    where city_id in 
    (select city_id from city 
    where country_id in 
    (select country_id from country 
    where country = "Canada")))

Use sakila;
SELECT first_name, email
FROM customer 
INNER JOIN address 
USING (address_id) 
INNER JOIN city 
USING (city_id) 
INNER JOIN country 
USING (country_id) 
WHERE country = 'Canada'