--baitap1
Select Name
From STUDENTS
WHERE Marks>75
ORDER BY RIGHT(Name, 3), ID

--baitap2
SELECT user_id,
CONCAT(UPPER (LEFT (name, 1)), LOWER (RIGHT(name,LENGTH(name)-1))) as name
FROM Users
ORDER BY user_id

--baitap3
SELECT 
manufacturer,
'$' || ROUND(sum(total_sales)/1000000,0) || ' ' || 'million'
FROM pharmacy_sales
GROUP BY manufacturer
ORDER BY sum(total_sales) DESC, manufacturer

--baitap4
SELECT 
EXTRACT (month from submit_date) AS mth,
product_id,
ROUND(AVG(stars),2) AS avg_stars
FROM reviews
GROUP BY mth, product_id
ORDER BY mth, product_id

--baitap5
SELECT 
sender_id,
COUNT(message_id) AS message_count
FROM messages
WHERE EXTRACT(month from sent_date)=8
AND EXTRACT (year from sent_date)=2022
GROUP BY sender_id
ORDER BY message_count DESC
LIMIT 2

--baitap6
SELECT tweet_id
FROM Tweets
WHERE LENGTH(content) > 15

--baitap7
SELECT 
activity_date AS day,
COUNT(DISTINCT user_id) AS active_users
FROM Activity
WHERE activity_date BETWEEN '2019-06-28' AND '2019-07-27'
GROUP BY 1
  
--baitap8
select 
COUNT (employee_id) AS number_employee
from employees
WHERE EXTRACT (month from joinging_date) BETWEEN 1 AND 7
AND EXTRACT (year from joinging_date)=2022
  
--baitap9
select 
POSITION('a' IN first_name) AS position
from worker
WHERE first_name='Amitah'

--baitap10
select 
SUBSTRING(title, LENGTH(winery)+2,4)
from winemag_p2
WHERE country = 'Macedonia'
