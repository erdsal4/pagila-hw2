/*
 * Management wants to send coupons to customers who have previously rented one of the top-5 most profitable movies.
 * Your task is to list these customers.
 *
 * HINT:
 * In problem 16 of pagila-hw1, you ordered the films by most profitable.
 * Modify this query so that it returns only the film_id of the top 5 most profitable films.
 * This will be your subquery.
 * 
 * Next, join the film, inventory, rental, and customer tables.
 * Use a where clause to restrict results to the subquery.
 */
/*
 * Use a JOIN to order the films by most profitable,
 * where the profit is the total amount that customer have payer for the film.
 * Use tables payment, rental, inventory, and film. 
 */
SELECT customer_id 
FROM customer
JOIN rental USING (customer_id)
JOIN inventory i USING (inventory_id)
WHERE i.film_id IN(
SELECT film_id FROM(
    SELECT film_id, sum(amount) as profit
    FROM film
    JOIN inventory USING (film_id)
    JOIN rental USING (inventory_id)
    JOIN payment USING (rental_id)
    GROUP BY film_id 
    ORDER BY profit DESC
    LIMIT 5
) t
)
GROUP BY customer_id
ORDER BY customer_id ASC;
