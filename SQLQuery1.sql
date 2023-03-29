select * from tbEmployee
truncate table tbEmployee

insert into tbEmployee values('Rohan','Mumbai',1)
insert into tbEmployee values('Suraj','Pune',1)
insert into tbEmployee values('Arjun','Pune',2)
insert into tbEmployee values('Arun','Pune',2)
insert into tbEmployee values('Kishor','Nagpur',3)
insert into tbEmployee values('Rahul','Nagpur',3)
insert into tbEmployee values('Aarti','Mumbai',3)
insert into tbEmployee values('Ganesh','Banglore',4)
insert into tbEmployee values('Dipa','Nashik',4)

update tbEmployee set city='Aurangabad'where deptid=1
update tbEmployee set empname='Rohan'where Salary=20000


update tbEmployee set empname='Kishor'where Salary=30000
update tbEmployee set empname='Ganesh'where Salary=35000
update tbEmployee set empname='Suraj'where Managerid=9

select * from tbEmployee






