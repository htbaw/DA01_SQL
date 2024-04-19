--baitap1
SELECT 
SUM(CASE 
WHEN device_type ='laptop' THEN 1 ELSE 0
END) AS laptop_views,

SUM(CASE 
WHEN device_type IN ('tablet', 'phone') THEN 1 ELSE 0
END) AS mobile_views
FROM viewership

--baitap2
SELECT *,
CASE 
WHEN x+y>z AND y+z>x AND x+z>y THEN 'Yes' 
ELSE 'No' 
END AS triangle
FROM Triangle

--baitap3
SELECT
ROUND(SUM(CASE
WHEN call_category IS NULL OR call_category = 'n/a' THEN 1
ELSE 0 
END)/COUNT(*)*100,1) 
AS call_percentage
FROM callers
  
--baitap4
SELECT name
FROM Customer
WHERE referee_id <> 2 OR referee_id IS NULL

--baitap5
select survived, 
sum(case when pclass = 1 then 1 else 0 end) as first_class,
sum(case when pclass = 2 then 1 else 0 end) as second_class,
sum(case when pclass = 2 then 1 else 0 end) as third_class
from titanic 
group by survived
