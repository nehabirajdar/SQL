create table Trainernew
(
Trainer_id int primary key identity(1,1),
trainer_name varchar(30),
joi_date date,
email varchar(25),
ExperienceInYear int,
)

create table Coursenew
(
courseid int primary key identity(1,1),
coursename varchar(30),
durationInMonth int,
Trainer_id int,
constraint fktainernewcoursenew foreign key(Trainer_id) references Trainernew(Trainer_id),
totalFees int
)

create table student2new
(
rollno int,
sname varchar(30),
degree varchar(25),
birthdate date,
courseid int,
constraint fkstudentcourse2 foreign key(courseid) references Coursenew(courseid),
batchid int,
fees_paid int,
remark varchar(40),

)
select * from student1new
insert into Trainernew values('Kalpana','12-03-2010','kalpana@gmail.com',5);
insert into Trainernew values('Pooja','20-03-2015','pooja@gmail.com',10);
insert into Trainernew values('Aarti','12-05-2013','aarti@gmail.com',6);
insert into Trainernew values('Dipa','25-05-2012','dipa@gmail.com',5);
insert into Trainernew values('Neha','12-03-2020','neha@gmail.com',7);
insert into Trainernew values('Bhakti','20-10-2010','bhakti@gmail.com',15);

insert into Coursenew values('java',3,1,25000);
insert into Coursenew values('.net',4,4,35000);
insert into Coursenew values('c++',3,1,25000);
insert into Coursenew values('c',2,1,38000);

insert into student2new values(1,'Arun','BE','12-10-1998',2,1,25000,'Good');
insert into student2new values(2,'Sanjay','BCA','18-10-1990',1,2,20000,'Good');
insert into student2new values(3,'Arun','BE','12-10-1998',3,3,35000,'Good');
insert into student2new values(4,'Arun','BE','12-10-1998',2,1,25000,'Good');
insert into student2new values(4,'Arun','BE','12-10-1998',2,1,25000,'Good');

select * from Trainernew;
select * from Coursenew;
select * from student2new;

--show list of students .List contains roll no,student name, course name,trainer name,in order of course name and student name
select coursename,trainer_name from  Coursenew c inner join Trainernew t on t.Trainer_id=c.Trainer_id 

--show list of students who have pending fees more than 1000rs.List should have student name,course name,balance fees.Show the list in descending order of balance fees.

select s.sname ,c.coursename, (totalFees-fees_paid) as balance_fees from student2new s inner join Coursenew c on s.courseid=c.courseid

---List name of course for which more than 20 students are enrolled
select coursename,count(sname) from Coursenew ,student2new 

--select name of students who are in same batch as 'Arun'
select sname from student2new where 

--update table student.update 'remark' field.Remark shoud be 'Eligible' if fees paid by student is more than 60%
update student2new set remark='Eligible' where fees_paid>=all(
select (totalfees *0.60) from Coursenew)

select * from student2new

select c.coursename from student2new s inner join Coursenew c on c.courseid=s.courseid
group by c.courseid,coursename
having count(c.courseid)>0



