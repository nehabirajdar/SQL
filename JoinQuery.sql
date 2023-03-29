select * from tbEmployee
alter table tbEmployee add Managerid int
update tbEmployee set Managerid=4 where empid in(1,2,3,5)
update tbEmployee set Managerid=6 where empid in(7,8)
update tbEmployee set Managerid=9 where empid in(10)

select empname as'Manager' from tbEmployee where Managerid is null

select emp.empname as 'Employee Name',man.empname as'Manager Name'
from tbEmployee emp,tbEmployee man
where man.empid=emp.Managerid

create table TShirt(Tshirt varchar(20))
insert into TShirt values('TShirt')
insert into TShirt values('TShirt')
insert into TShirt values('TShirt')
insert into TShirt values('TShirt')
insert into TShirt values('TShirt')
select * from TShirt
create table Sizes(Size varchar(10))
insert into Sizes values('M')
insert into Sizes values('L')
insert into Sizes values('XL')
insert into Sizes values('XXL')
insert into Sizes values('5XL')
select * from Sizes


create table Colours(Color varchar(10))
insert into Colours values('Red')
insert into Colours values('Green')
insert into Colours values('yellow')
insert into Colours values('Black')
insert into Colours values('White')

select * from Colours
select * from TShirt cross join Sizes cross join Colours

select city,count(empid) as'count'
from tbEmployee
group by city

--display dept wise count of emp
select dept.deptname,count(empid) as'emp count'
from tbEmployee emp inner join tbDept dept on emp.deptid=dept.deptid
group by deptname



--display country wise count of customer
select Country,count(CustomerId) as'customer count'
from Customer1
group by country

select * from tbDept


create table Book(Bookid int ,Book_name varchar(20),author_id int,Price int,PublishedDate Date)
create table Author(author_id int,author_name varchar(30),Phone_number int,Email varchar(50),Address varchar(30),City varchar(15))
create table Awards(award_id int,awardtypeId int,authorid int,bookid int,year int)
create table AwardMaster(awardtypeId int,awardname varchar(30),awardPrice int)


select * from tbEmployee where salary=
(
select min(salary) from tbEmployee
)

-- select the emp's who has greater salary than empid 14

select * from tbEmployee where salary>
(
select salary from tbEmployee where empid=10
)

-- find the emp's who have less salary than the avg salary

select * from tbEmployee where salary <(select avg(salary) from tbEmployee)

-- display emp's who have less salary than avg salary of dev dept
select * from tbEmployee where salary <
(
select avg(e.salary) from tbEmployee e
inner join tblDept d on d.deptid=e.deptid
where d.deptname='development'
)
-- OR
select * from tbEmployee where salary <(
select avg(salary) from tbEmployee where deptid=(
select deptid from tblDept where deptname='development')
)
select * from tbEmployee


--Select emp whose city is same as empid=3
select * from tbEmployee where city=
(
select city from tbEmployee where empid=3
)


--=display dept wise sum their salaries

select dp.deptname,sum(e.salary)
from tbEmployee e
inner join tbDept dp on dp.deptid=e.deptid
group by dp.deptname


--give hike by 20% to the emp who work in development dept

update tbEmployee set Salary=Salary+(Salary*0.20)
where deptid=(select deptid from tbDept where deptname='development')
select * from tbDept
select * from tbEmployee where deptid=3

---remove the emp who work in admin dept

delete from tbEmployee where deptid=(select deptid from tbDept where deptname='Admin')
select * from tbEmployee

