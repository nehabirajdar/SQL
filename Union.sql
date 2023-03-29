select * from tbEmployee

Select empname ,

  Case
      When  Managerid is null then 'Manager'
  Else 'Employee'
  end as 'Role'
From tbEmployee

select * from Book

select Book_name,
Case
 When Price >300 then ‘Expensive’
 When Price < 500 then ‘ effective’
Else  ‘average’
end as ‘Price_Comment’
from Book

create table student2(stuid int primary key identity(1,1),
stuname varchar(20),
RegestrationNo int ,
FinalYearPer int,
stream varchar(25)
)

create table Profile2( stuid  int ,
constraint fkstudent2 foreign key(stuid) references student2(stuid),
DOB varchar(25),
Gender varchar(25),
City varchar(20),
Emailid varchar(25)

)

insert into student2 values('Ganesh',1234,78,'IT')
insert into student2 values('Viresh',2446,89,'CS')
insert into student2 values('Satyam',3445,79,'IT')


insert into Profile2 values(2,'28-12-2000','Male','Pune','ganesh@gmail.com')
insert into Profile2 values(1,'18-12-2014','Male','Mumbai','ganesh@gmail.com')
insert into Profile2 values(3,'20-12-2000','Male','Pune','viresh@gmail.com')

select * from student2
select * from Profile2

create table MapperTable(id int primary key identity(1,1),
stuid int,
constraint fkstudent3 foreign key(stuid) references student2(stuid),
)

insert into MapperTable values(1)

select * from MapperTable