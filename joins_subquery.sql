-- 1. List all customers who live in Texas (use
-- JOINs)
SELECT first_name, last_name, district
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
WHERE district = 'Texas';

-- Jennifer, Kim, Richard, Bryan, Ian

-- 2. Get all payments above $6.99 with the Customer's Full
-- Name
SELECT first_name, last_name, payment_id, amount
FROM customer
INNER JOIN payment
ON customer.customer_id = payment.customer_id
WHERE amount > 6.99;

-- 3. Show all customers names who have made payments over $175(use
-- subqueries)
SELECT first_name, last_name, amount
FROM customer
INNER JOIN payment
ON customer.customer_id = payment.customer_id
WHERE amount IN(
    SELECT amount
    FROM payment
    WHERE amount >175
);

-- 4. List all customers that live in Nepal (use the city
-- table)
SELECT first_name, last_name, city
FROM customer
JOIN address 
ON address.address_id = customer.address_id
JOIN city
ON city.city_id = address.city_id
WHERE city = 'Nepal';
-- None?

-- 5. Which staff member had the most
-- transactions?
SELECT COUNT(payment_id), staff.staff_id, first_name, last_name
FROM staff
INNER JOIN payment
ON staff.staff_id = payment.staff_id
GROUP BY staff.staff_id, first_name, last_name;
-- Jon

-- 6. How many movies of each rating are
-- there?
SELECT rating, COUNT(*)
FROM film
GROUP BY rating
ORDER BY count DESC;
-- pg-13 223
-- nc-17 209
-- r 195
-- pg 194
-- g 178

-- 7.Show all customers who have made a single payment
-- above $6.99 (Use Subqueries)
SELECT first_name, last_name, amount
FROM customer
INNER JOIN payment
ON customer.customer_id = payment.customer_id
WHERE amount IN (
    SELECT amount
    FROM payment
    WHERE amount > 6.99
);


-- 8.  How many free rentals did our stores give away?
SELECT amount
FROM payment
WHERe amount <2.99
-- None?