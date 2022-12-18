ANS-2
// create TABLE and set primary key to ORDER_ID column and set DATE data type to ORDER_DATE and SHIPPED_DATE

1.	create or replace table sale_info
2.	(order_id varchar(20) not null primary key,
3.	order_date DATE,
4.	  ship_date DATE,
5.	  ship_mode varchar(20),
6.	  customer_name varchar(50),
7.	  segment varchar(20),
8.	  state varchar(50),
9.	  country varchar(50),
10.	  market varchar(20),
11.	  region varchar(30),
12.	  product_id varchar(30),
13.	  category varchar(50),
14.	  sub_category varchar(50),
15.	  product_name STRING,
16.	  sale int,
17.	  quantity int,
18.	  discount float,
19.	  profit float ,
20.	  shipping_cost float,
21.	  order_priority varchar(20),
22.	  year int
23.	
24.	);
----------------------------------------------------------------------------------------------------------------------------------------------
// extract the number from the last (-) in order_id.

Ans 4:-
select substr(order_id,'9','4') as order_extract
from sale_info;
----------------------------------------------------------------------------------------------------------------------------------------------
// Create a new column called Discount Flag and categorize it based on discount.

ANS-5:-
select order_id,
case when discount> 0 then 'yes'
else 'false'
end AS discount_flag
from sale_info;
----------------------------------------------------------------------------------------------------------------------------------------------
//Create a new column called process days and calculate how many days it takes for each order id to process from the order to its shipment.

ANS 6:-
select order_id,datediff(DAY, order_date,ship_date) as time_taken_to_shipped
from sale_info;
----------------------------------------------------------------------------------------------------------------------------------------------
//Create a new column called Rating and then based on the Process dates give rating like given below.

ANS 7:-
select order_id,datediff(DAY, order_date,ship_date) as time_taken_to_shipped,
case when time_taken_to_shipped <=3 then 5 
when time_taken_to_shipped > 3 and  time_taken_to_shipped <=6 then 4 
when time_taken_to_shipped > 6 and time_taken_to_shipped <=10 then 3 
when time_taken_to_shipped > 10 then 2 
end as rating
from sale_info;



