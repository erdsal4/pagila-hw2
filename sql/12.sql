/*
 * List the title of all movies that have both the 'Behind the Scenes' and the 'Trailers' special_feature
 *
 * HINT:
 * Create a select statement that lists the titles of all tables with the 'Behind the Scenes' special_feature.
 * Create a select statement that lists the titles of all tables with the 'Trailers' special_feature.
 * Inner join the queries above.
 */
SELECT t1.title
FROM (
    SELECT title
    FROM (
        SELECT title,unnest(special_features) AS special_feature
        FROM film
    ) t
    WHERE t.special_feature='Behind the Scenes'
) AS t1 JOIN (
    SELECT title
        FROM (
            SELECT title,unnest(special_features) AS special_feature
            FROM film
        ) t
        WHERE t.special_feature='Trailers'
) AS t2 ON (t1.title=t2.title) 
ORDER BY title;
