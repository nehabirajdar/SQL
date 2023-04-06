
--1.create table product2
create table product2(id int,name varchar(25),price decimal,company varchar(40))

insert into product2 values(1,'AC',25000,'Godrej')
insert into product2 values(2,'Washing Machine',40000,'Wirepool')
insert into product2 values(3,'TV',25000,'Sony')
insert into product2 values(4,'Mobile',15000,'Vivo')
insert into product2 values(5,'Laptop',65000,'hp')
insert into product2 values(6,'AC',25000,'Godrej')
insert into product2 values(7,'Hair Dryer',1000,'Philips')
insert into product2 values(8,'Iron',5000,'Philips')
insert into product2 values(9,'Headphone',2000,'Sony')
insert into product2 values(10,'Connector',500,'Sony')

--2.Display the product with highest price to lowest price(first 3 products)

select top 3 * from product2 order by price desc

--3. display product name whose price is lowset price in product table

select top 1 * from product2 order by price asc

--4. display the product with lowest to highest price (skip first 3 products & display next 5 products)

select * from product2 order by price desc offset 3 rows fetch next 3 rows only

--5. display product details with alphbetical order of product name & price 
select * from product2 order by name,price

--6. display product details with alphabetical order of company name& price
select * from product2 order by company,price

select name+'  '+company as 'Product with Company' from product2

select name, name as'Product Name',price as'Product Price' from product2
select * from product2
select * from tbEmployee

select count(id) as 'Count' from product2

select count(distinct name) as 'Count' from product2

select count(distinct city) as 'City Count' from tbEmployee

select sum(price) as 'Sum price' from product2

select sum(salary) as 'Sum Salary' from tbEmployee

select avg(price) as 'Average price' from product2

select avg(salary) as 'Average Salary' from tbEmployee




