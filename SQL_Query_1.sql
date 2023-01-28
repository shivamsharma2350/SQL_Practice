
--Q1. You are the first analyst working for “Uber”. You are asked to prepare a
--database for holding information about the rides.
--Prepare the list of tables along with the fields (Columns) you would store the
--information.
--Specify the primary key in each table and foreign key if it exists.

drop table Rides_Information;

create database Uber_Rides;

use Uber_Rides;

create table Rides_Information (
ride_id int not null,
customer_name varchar(50) not null,
Vehicle_class varchar(30) default 'hashback',
Pickup_address varchar(100) not null,
Droping_address varchar(100) not null,
Assigned_driver varchar(50) not null,
primary key(ride_id)
)


--Q5. You are working as an Analyst for an E-commerce company and you have
--access to the entire database, you are asked to do the below analysis.

--A. Find information about all the products whose Brand name ends with ‘a’
--and has ‘e’ at third place

select * 
from products
where  SUBSTRING(reverse(Brand), 1, 1) in ('a')  SUBSTRING(Brand, 3, 3) in ('e');



--B. Find information about all the products whose Product name has
--“Liquid” and Sub-categories are ‘Car & Shoe Care’ or ‘Bath & Hand Wash’

select substring(product,CHARINDEX('liquid' product),0)
from Products
where  (Sub_category in ('car', 'Shoe Care') 0r Sub_category in ('Bath', 'Hand wash'));

--C. Identify distinct combination of Sub-category and Brand for the brands
--whose name begins with ‘d’


select distinct(Sub_Category), Brand
from 
products
where brand like 'd%';



--D. Identify the customers who belong to Wisconsin and New York

select *
from 
Customers
where country = 'Wisconsin' and country = 'New York'


--E. Identify the distinct State and City combinations where the customer
--base belongs to.

select * 
from 
Customers
where city not in (state);

--F. Filter all the Products for the brand “Cadbury”

Select * from 
Products where Brand ='cadbury'


use Ecommerce;
select top 1 * from category;
select top 1 * from Customers;
select top 1 * from OrderDetails;
select top 1 * from Orders;
select top 1 * from Payments;
select top 1 * from Products;
select top 1 * from Shippers;
select top 1 * from Suppliers;

--Q6. Using the Customers table from E-commerce database, write queries to:
--A. Update the State Name from “New York” to “NY”
--B. Update the Country Name from “United States” to “US”

select * from Customers 

update Customers set country = 'US' where Country='United States' 
update Customers set state = 'NY' where State='New York';



-use pets_Owners;

select top 1 * from owners;
select top 1 * from pets;
select top 1 * from ProceduresDetails;
select top 1 * from ProceduresHistory;

select p.PetID, ph.ProcedureType, Name,  sum(price) as Total_Price
from pets as p inner join ProceduresHistory as ph on p.PetID = ph.PetID 
inner join ProceduresDetails as pd on ph.ProcedureType=pd.ProcedureType
where SUBSTRING(name, 1, 1) in ('A', 'B')
group by Name, p.PetID, ph.ProcedureType
having sum(price) > 1000
order by Total_Price DESC;

use Ecommerce;

select * from Orders;

select year(OrderDate) as year, MONTH(OrderDate) as month, SUM(Total_order_amount) as total_amount, count(OrderID) as no_of_Customer 
from Orders where DATEDIFF(day,OrderDate, DeliveryDate) = 3 AND DATEPART(month, Deliverydate) in (1,2) AND PaymentID in (2, 4, 5)
group by year(OrderDate), MONTH(OrderDate)
order by year, month;

select datename(month,orderdate) month_name , count(OrderID) as Total_ID 
from orders
where Datediff(day, Orderdate, DeliveryDate) = 5 AND month(Orderdate) not in (1, 2)
group by datename(month,orderdate)
having sum(Total_order_Amount)>5000;

 select PaymentID, sum(Total_order_Amount)as Total_Amount
 from orders
 where month(orderdate) in (11, 12) AND datename(weekday,orderdate) in ('monday','tuesday','wednesday')
 group by PaymentID
 having sum(Total_order_Amount) > 100000 

 select top 1* from customers;
 select top 1 * from orders;

 select c.CustomerID, count(orderID) no_of_order_ID
 from Customers c join Orders o on c.CustomerID=o.CustomerID
 where OrderDate between '2021-05-01' and '2021-10-01'
 group by c.CustomerID
 having  count(orderID) = 1;

 use pets_Owners;

select top 1 * from pets;
select top 1 * from owners;
select top 1 * from ProceduresDetails;
select top 1 * from ProceduresHistory;

select *
from 
ProceduresHistory
where ( ProcedureType in ('vaccinations') and ProcedureSubCode in (3, 4, 5)) or
(ProcedureType in ('General Surgeries') and ProcedureSubCode in (8,10,13,15,16));

select top 5 p.PetID, sum (Price) as total_price
from 
pets p join ProceduresHistory ph on p.PetID=ph.PetID join ProceduresDetails pd on ph.ProcedureType=pd.ProcedureType
group by p.PetID
order by total_price DESC;

select top 1 * from pets;
select top 1 * from owners;
select top 1 * from ProceduresDetails;
select top 1 * from ProceduresHistory;

select  o.OwnerID, sum(Price) Least_Price
from 
owners o join pets p on o.OwnerID=p.OwnerID join ProceduresHistory ph on ph.PetID=p.PetID
join ProceduresDetails pd on pd.ProcedureSubCode=ph.ProcedureSubCode
group by o.OwnerID
order by Least_Price DESC;

select * from pets;

select *,
case when age>=3 and age<5 then 'Young'
when age>=5 and age<7 then 'older'
when age<3 then 'New born'
else 'oldest'
end as Category
from pets;


select * from pets order by(case when substring(name, 1, 1) in ('a') then Name else Kind end)asc

select * from pets order by (case when name='antigone' then 0 when name='Angel' then 1 else 2 end), name asc;





