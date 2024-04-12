- baitap1
SELECT NAME FROM CITY
WHERE COUNTRYCODE ='USA' AND POPULATION > 120000;

- baitap2
Select * from CITY
WHERE COUNTRYCODE = 'JPN'

- baitap3
SELECT CITY, STATE FROM STATION
  
- baitap4
Select Distinct CITY from STATION
Where CITY like 'A%' or CITY like 'E%' or CITY like 'I%' or CITY like 'O%' or CITY like 'U%';

- baitap5
SELECT DISTINCT CITY FROM STATION
WHERE CITY LIKE '%A' OR CITY LIKE '%E' OR CITY LIKE '%I' OR CITY LIKE '%O' OR CITY LIKE '%U'
  
- baitap6
SELECT DISTINCT CITY FROM STATION
WHERE NOT (CITY LIKE 'A%' OR CITY LIKE 'O%' OR CITY LIKE 'E%' OR CITY LIKE 'U%' OR CITY LIKE 'I%')
  
- baitap7
SELECT NAME FROM EMPLOYEE
ORDER BY NAME ASC
  
- baitap8
SELECT NAME FROM EMPLOYEE
WHERE (SALARY > 2000) AND (MONTHS < 10)
ORDER BY employee_id ASC
  
- baitap9
select product_id from Products
where low_fats = 'Y' and recyclable = 'Y'
  
- baitap10
select name from Customer
where referee_id <> 2 or referee_id IS NULL
  
- baitap11
select name, population, area from world
where (area >= 3000000) OR (population >= 25000000)
  
- baitap12
select distinct author_id as id from views
where viewer_id = author_id
order by author_id ASC
  
- baitap13
select * from parts_assembly
where finish_date is null
  
- baitap14
select * from lyft_drivers
where yearly_salary <= 30000 or yearly_salary >= 70000


- baitap15
select * from uber_advertising
where money_spent > 100000 AND year = 2019
