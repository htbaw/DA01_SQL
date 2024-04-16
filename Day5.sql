--baitap1
SELECT DISTINCT CITY FROM STATION
WHERE ID%2=0

--baitap2
Select COUNT(CITY) - COUNT(Distinct CITY) 
From STATION

--baitap3 
SELECT ceil(avg(salary)-avg(replace(salary,0,''))) 
FROM EMPLOYEES

--baitap4
SELECT 
ROUND(CAST(SUM(item_count*order_occurrences)/SUM(order_occurrences) AS DECIMAL),1) AS mean
FROM items_per_order

--baitap5
SELECT candidate_id FROM candidates
WHERE skill IN ('Python', 'Tableau','PostgreSQL') 

--baitap6
SELECT user_id,
DATE(max(post_date))-DATE(min(post_date)) as days_between
FROM posts
WHERE post_date >='2021-01-01' AND post_date <'2022-01-01'
GROUP BY user_id
HAVING COUNT(post_id) >= 2

--baitap7
SELECT card_name,
MAX(issued_amount)-MIN(issued_amount) AS difference
FROM monthly_cards_issued
GROUP BY card_name
ORDER BY difference DESC
  
--baitap8
SELECT manufacturer,
COUNT(drug) AS drug_count,
ABS(SUM(cogs-total_sales)) AS total_loss
FROM pharmacy_sales
WHERE total_sales<cogs
GROUP BY manufacturer
ORDER BY total_loss DESC
  
--baitap9
SELECT * FROM Cinema
WHERE id%2=1 and description <> 'boring'
ORDER BY rating DESC
  
--baitap10
 SELECT teacher_id, 
COUNT(DISTINCT subject_id) AS cnt
FROM Teacher
GROUP BY teacher_id 
  
--baitap11
SELECT user_id,
COUNT(follower_id) AS followers_count
FROM Followers
GROUP BY user_id
ORDER BY user_id
  
--baitap12
SELECT class from Courses
GROUP BY class
HAVING COUNT(student)>=5
