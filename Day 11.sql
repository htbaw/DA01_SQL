--baitap1
SELECT COUNTRY.CONTINENT, FLOOR(AVG(CITY.POPULATION))
FROM CITY
JOIN COUNTRY ON CITY.COUNTRYCODE = COUNTRY.CODE
GROUP BY COUNTRY.CONTINENT

--baitap2
SELECT 
ROUND(1.0*SUM(CASE 
WHEN t.signup_action = 'Confrimed' THEN 1 ELSE 0 
END)/COUNT(DISTINCT e.user_id),2) as comfirm_rate
FROm emails e
LEFT JOIN texts t on e.email_id = t.email_id

--baitap3
SELECT b.age_bucket,
 SUM(CASE 
 WHEN a.activity_type = 'send' THEN time_spent END) AS sending_time,
 SUM(CASE 
 WHEN a.activity_type = 'open' THEN time_spent END) AS opening_time
 FROM activities a 
 JOIN age_breakdown b
 on a.user_id = b.user_id
 GROUP BY b.age_bucket

--baitap4
SELECT a.customer_id as customer_id,
count(distinct b.product_category ) as product_purchase
FROM customer_contracts a
INNER JOIN products b
ON a.product_id = b.product_id
GROUP BY customer_id

--baitap5
SELECT e1.reports_to AS employee_id, e2.name,
COUNT(e1.reports_to) AS reports_count,
ROUND(AVG(e1.age),0) AS average_age
FROM employees e1
JOIN employees e2
ON e1.reports_to=e2.employee_id
GROUP BY e1.reports_to
ORDER BY e1.reports_to

--baitap6
SELECT a.product_name, 
SUM(unit) as unit
FROM Products a
LEFT JOIN Orders b
ON a.product_id = b.product_id
WHERE b.order_date BETWEEN '2020-02-01' AND '2020-02-29'
GROUP BY a.product_id
HAVING SUM(unit) >= 100

--baitap7
SELECT pages.page_id 
FROM pages 
LEFT JOIN page_likes
ON pages.page_id = page_likes.page_id 
WHERE page_likes.liked_date IS NULL
ORDER BY 1

________________________________________________________________
MID_TERM
 
--baitap1
SELECT DISTINCT film_id, 
SUM (replacement_cost) AS total_amount
FROM film
GROUP BY film_id
ORDER BY SUM (replacement_cost)

--baitap2
SELECT 
SUM(CASE
WHEN replacement_cost BETWEEN 9.99 AND 19.99 THEN 1 ELSE 0
END) AS low,
SUM(CASE
	WHEN replacement_cost BETWEEN 20.00 AND 24.99 THEN 1 ELSE 0 
END) AS medium,
SUM(CASE
	WHEN replacement_cost BETWEEN 25.00 AND 249.99 THEN 1 ELSE 0
END) AS high
FROM film

--baitap3
SELECT a.title, a.length, c.name FROM film AS a
INNER JOIN film_category AS b
ON a.film_id = b.film_id
INNER JOIN category AS c
ON b.category_id = c.category_id
WHERE c.name IN ('Drama', 'Sports')
ORDER BY a.length DESC

--baitap4
SELECT c.name, 
COUNT (*) AS number_titles
FROM film AS a
INNER JOIN film_category AS b
ON a.film_id = b.film_id
INNER JOIN category AS c
ON b.category_id = c.category_id
GROUP BY  c.name
ORDER BY number_titles DESC

--baitap5
SELECT a.first_name, a.last_name,
COUNT(c.film_id) AS number_films
FROM actor AS a
INNER JOIN film_actor AS b
ON a.actor_id= b.actor_id
INNER JOIN film AS c
ON b.film_id = c.film_id
GROUP BY a.first_name, a.last_name
ORDER BY number_films DESC


--baitap6
SELECT a.address
FROM address AS a
LEFT JOIN customer AS b
ON a.address_id= b.address_id
WHERE b.address_id IS NULL

--baitap7
SELECT a.city, 
SUM (d.amount) AS total_city
FROM city AS a
JOIN address AS b 
ON a.city_id = b.city_id
JOIN customer AS c
ON b.address_id = c.address_id
JOIN payment AS d
ON c.customer_id = d.customer_id
GROUP BY a.city
ORDER BY total_city DESC

--baitap8 (doanh thu thap nhat = 50.85)
SELECT CONCAT(a.city,', ',e.country) AS city_country,
SUM(d.amount) AS total_amount
FROM city AS a
JOIN country AS e
ON e.country_id= a.country_id
JOIN address AS b 
ON a.city_id = b.city_id
JOIN customer AS c
ON b.address_id = c.address_id
JOIN payment AS d
ON c.customer_id = d.customer_id
GROUP BY city_country
ORDER BY total_amount


