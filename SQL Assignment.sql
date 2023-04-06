create table customer1(
customerId int,
Name char(40),
city varchar(20),
country varchar(20),
postalcode int
)
sp_help customer
select * from customer1

   --Q1 Write a statement that will select the City column from the Customers table

   select city from customer1     


insert into customer1 values(1,'Ajay','Pune','India',12345)
insert into customer1 values(1,'Pratik','Pune','India',123456)
insert into customer1 values(3,'Ganesh','Berlin','USA',121110)
insert into customer1 values(2,'Prathmesh','London','USA',221214)
insert into customer1 values(1,'Viresh','Pune','India',12345)
insert into customer1 values(4,'Shraddha','fff','Jermani',0)
insert into customer1 values(5,'Pooja','Mumbai','India',0)
insert into customer1 values(4,'Neha','xxx','Norway',564423)
insert into customer1 values(3,'Dipa','aaa','France',0)
insert into customer1 values(4,'Aarti','sss','India',789456)

  ----Q2 Select all the different values from the Country column in the Customers table.
  select Distinct country from customer1  

 ----Q3 Select all records where the City column has the value "London
select * from customer1 where city='London'       

-----Q4 Use the NOT keyword to select all records where City is NOT "Berlin".
select * from customer1 where city not in('Berlin')  
update customer1 set customerId=23 where customerId=5
 -----Q5 Select all records where the CustomerID column has the value 23.
 select * from customer1 where customerId=23     

  ---Q7 Select all records where the City column has the value 'Berlin' or 'London'.
select * from customer1 where city='Berlin' or city='London'  

--Q6 	Select all records where the City column has the value 'Berlin' and the PostalCode column has the value 121110.

select * from customer1 where city='Berlin' and postalcode=121110  

 ------Q8 	Select all records from the Customers table, sort the result alphabetically by the column City.

select * from customer1
order by city 

------Q9 	Select all records from the Customers table, sort the result reversed alphabetically by the column City.

select * from customer1
order by city desc 

 ---Q10  	Select all records from the Customers table, sort the result alphabetically, first by the column Country, then, by the column City
select * from customer1
order by country,city     

 --Q11  	Select all records from the Customers where the PostalCode column is empty.
update customer1 set postalcode=null where postalcode=0
select * from customer1 where postalcode is null 

 ----Q12 	Select all records from the Customers where the PostalCode column is NOT empty.
select * from customer1 where postalcode is not null  

---Q13 	Set the value of the City columns to 'Oslo', but only the ones where the Country column has the value "Norway".
update customer1 set city='Oslo'where country='Norway'  

--Q14 	Delete all the records from the Customers table where the Country value is 'Norway'.
delete from customer1
where country='Norway'  

---Q20 	Select all records where the value of the City column starts with the letter "a".

select * from customer1 where city LIKE 'a%' 

---Q21 	Select all records where the value of the City column ends with the letter "a".

select * from customer1 where city LIKE '%a'  

---Q22  	Select all records where the value of the City column contains the letter "a".

select * from customer1 where city LIKE '%a%'   

---Q23 	Select all records where the value of the City column starts with letter "a" and ends with the letter "b".
select * from customer1 where city LIKE 'a%b' 

---Q24 Select all records where the value of the City column does NOT start with the letter "a".
select * from customer1 where city not LIKE 'a%' 

---Q25 Select all records where the second letter of the City is an "a".
select * from customer1 where city LIKE '_a%'  

---Q26 	Select all records where the first letter of the City is an "a" or a "c" or an "s".
select * from customer1 where city LIKE '[acs]%'  

 ---Q27 	Select all records where the first letter of the City starts with anything from an "a" to an "f".
select * from customer1 where city LIKE '[a-f]%'

----Q28 	Select all records where the first letter of the City is NOT an "a" or a "c" or an "f".

select * from customer1 where city not LIKE '[!acf]%' 

---Q29 Use the IN operator to select all the records where the Country is either "Norway" or "France".
select * from customer1 where country in('Norway','France')  
 ---Q30 Use the IN operator to select all the records where Country is NOT "Norway" and NOT "France".

select * from customer1 where country not in ('Norway','France') 
create table product(
pname varchar(40),
pid int,
price decimal
)
select * from product

insert into product values('pen',1,15)
insert into product values('Pensil',2,20)
insert into product values('Book',3,24)
insert into product values('Rubber',2,18)
insert into product values('Paper',6,30)
insert into product values('ink',4,50)
insert into product values('Notebook',3,30)
insert into product values('Drafter',2,100)
insert into product values('Writingpad',1,60)
insert into product values('calculator',7,500)
insert into product values('chock','5',5)

---Q31.	Use the BETWEEN operator to select all the records where the value of the Price column is between 10 and 20
select * from product where price between 10 and 20 

 ----Q32	Use the BETWEEN operator to select all the records where the value of the Price column is NOT between 10 and 20.

select * from product where price not between 10 and 20
create table persons(
DOB date 
)
  --36.	List the number of customers in each country.
select count (1) country from customer1 group by country 
order by count(1)desc

select * from persons

--Q40 Add a column of type DATE called Birthday in Persons table
alter table persons add Birthday date  
--Q41.	Delete the column Birthday from the Persons table

alter table persons drop column Birthday 
