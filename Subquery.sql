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


create table tbProject
(empid int,
empname varchar(40),
city varchar(30)
)

insert into tbProject select empid,empname,city from tbEmployee where deptid=
(
select deptid from tbDept where deptname='Development'
)

select * from tbProject


--All Keyword
insert into tbProject select empid ,empname,city from tbEmployee where Salary< all
(
	select avg(Salary) from tbEmployee
)

select * from tbEmployee where Salary < all(
select avg(Salary) from tbEmployee group by deptid
)

--find the name of emp who has 2nd highest salary using subquery
select * from tbEmployee where Salary =
(
	select max(Salary) from tbEmployee where salary < (select max(Salary) from tbEmployee )

)
--or
select * from tbEmployee where Salary =
(
	select max(Salary) from tbEmployee where Salary<>

(
	select max(Salary) from tbEmployee
)
)

--Function in SQL
--Len

select empname,len(empname) as 'word length' from tbEmployee

--Upper Lower
select UPPER(empname) as 'emp name' from tbEmployee

select lower(empname) as 'emp name' from tbEmployee

--Trim,LTrim,RTrim
select TRIM(empname) as 'trim fun' from tbEmployee
select LTRIM(empname) as 'trim fun' from tbEmployee
select RTRIM(empname) as 'trim fun' from tbEmployee

--Substring
select empname,SUBSTRING(empname,1,3) as 'temp name' from tbEmployee

--Concat
select CONCAT(empname,'->',city,'->',salary) as 'result'
from tbEmployee

--replace
select REPLACE(city,'pune','PUNE') from tbEmployee

select REVERSE(empname) from tbEmployee

--isnull
select ISNULL(city,'NA') as 'City' from tbEmployee

--Cast
select CAST(salary as varchar(20)) as 'Salary' from tbEmployee

select cast(CURRENT_TIMESTAMP as date)

select year(cast(CURRENT_TIMESTAMP as date))

alter table tbEmployee add JoiningDate date

select * from tbEmployee

update tbEmployee set JoiningDate= cast('2023-2-10' as date) where empid=1