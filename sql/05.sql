/*
 * Management wants to advertise to actors,
 * and needs a list of all actors who are not also customers.
 *
 * Assume that if an entry in the customer and actor table share a first_name and last_name,
 * then they represent the same person.
 * Then select all actors who are not also customers.
 *
 * HINT:
 * This can be solved using either a LEFT JOIN or the NOT IN operator.
 */
SELECT actor.last_name,actor.first_name
FROM actor
LEFT JOIN customer c USING (first_name,last_name)
WHERE c.first_name IS NULL AND c.last_name IS NULL
ORDER BY actor.last_name,actor.first_name;
