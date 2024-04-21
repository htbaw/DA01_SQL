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
