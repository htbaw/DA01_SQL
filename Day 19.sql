--Bài 1-- Chuyển đổi kiểu dữ liệu
alter table sales_dataset_rfm_prj alter column ordernumber type numeric using ordernumber::numeric;
alter table sales_dataset_rfm_prj alter column quantityordered  type numeric using quantityordered::numeric;
alter table sales_dataset_rfm_prj alter column priceeach  type numeric using priceeach::numeric;
alter table sales_dataset_rfm_prj alter column orderlinenumber  type numeric using orderlinenumber::numeric;
alter table sales_dataset_rfm_prj alter column sales  type numeric using sales::numeric;
alter table sales_dataset_rfm_prj alter column orderdate  type date using orderdate::date;
alter table sales_dataset_rfm_prj alter column msrp  type numeric using msrp::numeric;

--Bài 2-- CHECK NULL/BLANK
SELECT * FROM sales_dataset_rfm_prj WHERE ORDERNUMBER IS NULL OR LENGTH(NULLIF(LTRIM(RTRIM(ORDERNUMBER)), '')) = 0;
SELECT * FROM sales_dataset_rfm_prj WHERE QUANTITYORDERED IS NULL OR LENGTH(NULLIF(LTRIM(RTRIM(QUANTITYORDERED)), '')) = 0;
SELECT * FROM sales_dataset_rfm_prj WHERE PRICEEACH IS NULL OR LENGTH(NULLIF(LTRIM(RTRIM(PRICEEACH)), '')) = 0;
SELECT * FROM sales_dataset_rfm_prj WHERE ORDERLINENUMBER IS NULL OR LENGTH(NULLIF(LTRIM(RTRIM(ORDERLINENUMBER)), '')) = 0;
SELECT * FROM sales_dataset_rfm_prj WHERE SALES IS NULL OR LENGTH(NULLIF(LTRIM(RTRIM(SALES)), '')) = 0;
SELECT * FROM sales_dataset_rfm_prj WHERE ORDERDATE IS NULL OR LENGTH(NULLIF(LTRIM(RTRIM(ORDERDATE)), '')) = 0;

--Bài 3 
--Thêm cột
ALTER TABLE public.sales_dataset_rfm_prj
ADD COLUMN CONTACTLASTNAME VARCHAR 
ADD COLUMN CONTACTFIRSTNAME VARCHAR 
  
UPDATE public.sales_dataset_rfm_prj
SET CONTACTLASTNAME=LEFT(contactfullname, POSITION('-' in contactfullname)-1) ,
CONTACTFIRSTNAME= RIGHT(contactfullname, length(contactfullname)-POSITION('-' in contactfullname))	
  
--Chuẩn hóa 
UPDATE public.sales_dataset_rfm_prj
SET contactfirstname=upper(left(contactfirstname,1))||lower(right(contactfirstname, length(contactfirstname)-1)),
contactlastname=upper(left(contactlastname,1))||lower(right(contactlastname, length(contactlastname)-1))

--Bài 4: Thêm cột QTR_ID, MONTH_ID, YEAR_ID lần lượt là Qúy, tháng, năm được lấy ra từ ORDERDATE --- 
ALTER TABLE public.sales_dataset_rfm_prj
ADD COLUMN QTR_ID NUMERIC,
ADD COLUMN MONTH_ID NUMERIC ,
ADD COLUMN YEAR_ID NUMERIC 

UPDATE public.sales_dataset_rfm_prj
SET QTR_ID=EXTRACT(quarter FROM ORDERDATE),
MONTH_ID=EXTRACT (MONTH FROM ORDERDATE),
YEAR_ID=EXTRACT (YEAR FROM ORDERDATE)

--Bài 5: Tìm outlier 
Cách 1: Sử dụng Boxplot
with cte as
(select Q1-1.5*IQR as min, Q3+1.5*IQR as max from
(select
  percentile_cont(0.25) within group (order by quantityordered) as Q1,
  percentile_cont(0.75) within group (order by quantityordered) as Q3,
  percentile_cont(0.75) within group (order by quantityordered)-percentile_cont(0.25) within group (order by quantityordered) as IQR
from public.sales_dataset_rfm_prj) as temp)
   
select quantityordered from public.sales_dataset_rfm_prj
where quantityordered < (select min from cte) or quantityordered > (select max from cte);

Cách 2: Sử dụng Z-score
with cte as
(
	select quantityordered,
	(select avg(quantityordered) from public.sales_dataset_rfm_prj) as avg,
	(select stddev(quantityordered) from public.sales_dataset_rfm_prj) as stddev
	from public.sales_dataset_rfm_prj),
cte_outliers as (
select quantityordered, (quantityordered - avg)/stddev as z_score
from cte
where abs((quantityordered - avg)/stddev) > 3)

--Bài 6:
CREATE TABLE SALES_DATASET_RFM_PRJ_CLEAN AS
SELECT *
FROM sales_dataset_rfm_prj;
