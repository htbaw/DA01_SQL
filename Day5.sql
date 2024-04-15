--baitap1
SELECT DISTINCT CITY FROM STATION
WHERE ID%2=0

--baitap2
Select COUNT(CITY) - COUNT(Distinct CITY) 
From STATION

--baitap3 (Em không biết làm ạ)

--baitap4
SELECT 
ROUND(CAST(SUM(item_count*order_occurrences)/SUM(order_occurrences) AS DECIMAL),1) AS mean
FROM items_per_order

--baitap5

--baitap6

--baitap7

--baitap8

--baitap9

--baitap10

--baitap11

--baitap12

--baitap13

--baitap14

--baitap15
