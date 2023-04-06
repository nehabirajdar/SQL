

create table Customer1(CustomerId int primary key,
CustomerName varchar(40),
City varchar(20),
Country varchar(20),
PostalCode varchar(40),
Productid int
)

insert into Customer1 values(1,'Ajay','Aldgate','London','E17AY',01)
insert into Customer1 values(2,'Satyam','Portsoken','London','E17BS',01)
insert into Customer1 values(3,'Vivek','Bishopgate','London','E17DG',02)
insert into Customer1 values(4,'Pratik','Mitte','Berlin','10115',01)
insert into Customer1 values(5,'Ganesh','Fennpfuhl','Berlin','10367',03)
insert into Customer1 values(6,'Pooja','Halensee','Berlin','10629',03)

select * from Customer1

--1.Write a statement that will select the City column from the Customers table
select City from Customer1

--2.Select all the different values from the Country column in the Customers table.
select Country from Customer1

--3.Select all records where the City column has the value "London
select * from Customer1 where Country='London'

select * from Customer1 where   not Country='London'

select * from Customer1 where CustomerId=5

select * from Customer1 where Country='Berlin' AND PostalCode='10629'

select * from Customer1 where Country='Berlin' or Country='London'

select * from Customer1 order by Country

select * from Customer1 order by Country desc





