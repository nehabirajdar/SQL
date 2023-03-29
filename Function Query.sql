create function Addition(@a int,@b int)
returns int
as
begin
declare @c int
set @c=@a+@b
return @c
end

select * from tbEmployee

select dbo.Addition(10,30) as 'Addition'

create function GetNameById1(@id int)
returns varchar(20)
as begin
return(
select empname from tbEmployee where empid=@id
)
end

select dbo.GetNameById1(7) as'emp name'

--2 . multivalue function  -->which returns the recordset

create function GetEmpByDeptId(@did int)
returns table
as 
return
(
select * from tbEmployee where deptid=@did
)

select * from dbo.GetEmpByDeptId(4)

-- create a function to pass product price & discount percentage
-- returns the discounted price

create function GetDiscountedPrices1(@price decimal,@dis decimal)
returns decimal

as begin
declare @DiscountPrice decimal
set @DiscountPrice=@price-(@price*@dis/100)
return @DiscountPrice
end


select dbo.GetDiscountedPrices1(15000,20) as 'Dicount Price'


--Proc-
create proc GetAllEmps
as begin
select * from tbEmployee
return
end


exec GetAllEmps


create proc GetEmpByDept(@deptid int)
as begin
select * from tbEmployee where deptid=@deptid

return
end

exec GetEmpByDept @deptid=4

create proc InsertEmpones(
@empname varchar(20),
@city varchar(20),
@did int,
@salary int,
@managerid int,
@joiningdate date
)
as begin
insert into tbEmployee values(@empname,@city,@did,@salary,@managerid,cast(@joiningdate as date))

return 
end

exec InsertEmpones
@empname='TestOne',
@city='Pune',
@did=4,
@salary=35500,
@managerid=3,
@joiningdate='2/3/2023'



select * from tbEmployee

--Update
create proc updateEMployeeNewone(@empname varchar(20), @deptid int )
as
begin
update tbEmployee set empname=@empname where deptid=@deptid
end

exec  updateEMployeeNewone @empname='Akansha', @deptid=2

select * from tbEmployee

create proc DeleteEMployeeNewones(@empid int )
as
begin
delete from tbEmployee  where empid=@empid
end

exec  DeleteEMployeeNewones @empid=17

update tbEmployee set empname='Vivek' where empid=15
update tbEmployee set empname='Vrushali' where empid=18


--Trigger

select * from Product
select * from productlog
insert into Product values('Test','HP',100)
delete from Product where id=12
-- create a trigger that will maintain log for product table

create table EmployeeLog
(
logid int primary key identity(1,1),
description varchar(255)
)

-- any prodcut inserted in the product table log the details using trigger
-- triggers have built in properties 
-- inserted
--deleted
create trigger tr_employee_Inserts
on tbEmployee after insert
as begin
declare @empid int
select @empid = empid from inserted
insert into EmployeeLog values('New Emp id '+cast(@empid as varchar(10))+
' added on '+cast(CURRENT_TIMESTAMP as varchar(20)))
end

create trigger tr_employee_Delete1
on tbEmployee after insert
as begin
declare @empid int
select @empid = empid from inserted
insert into EmployeeLog values(' Emp id '+cast(@empid as varchar(10))+
' removed on '+cast(CURRENT_TIMESTAMP as varchar(20)))
end

select * from tbEmployee
select * from EmployeeLog

insert into tbEmployee values('Neha','Latur',2,40000,4,'')


delete from tbEmployee where empid=10


-------------------------------
create trigger tr_Employee_Update2
on tbEmployee for update
as begin
declare @id int
declare @oldempname varchar(40), @newempname varchar(40)
declare @oldcity varchar(40), @newcity varchar(40)
declare @olddeptid int , @newdeptid int
declare @oldsalary int , @newsalary int
declare @oldmanagerid int , @newmanagerid int
declare @oldjoingdate date, @newjoiningdate date


declare @descr varchar(500)
select * into tempTable from inserted
while(Exists(select empid from tempTable))
begin
set @descr=''
select TOP 1 @id=empid,
@newempname=empname,
@newcity=city,
@newdeptid=deptid ,
@newsalary=Salary,
@newmanagerid=Managerid,
@newjoiningdate=JoiningDate
from tempTable

select @newempname=empname,@newcity=city,@newdeptid=deptid,@newsalary=salary,@newmanagerid=Managerid,@newjoiningdate=JoiningDate from deleted where empid=@id
set @descr='employee with id '+cast(@id as varchar(10))+' change '
if(@oldempname<>@newempname)
set  @descr= @descr+' old empname '+@newempname + ' to new name '+@newempname
if(@oldcity<>@newcity)
set @descr= @descr+' old city '+@oldcity + ' to new comp '+@newcity
if(@olddeptid<>@newdeptid)
set  @descr= @descr+' old deptid '+cast(@olddeptid as varchar(20)) + ' to new deptid '+cast(@newdeptid as varchar(20))
if(@oldmanagerid<>@newmanagerid)
set  @descr= @descr+' old managerid '+cast(@oldmanagerid as varchar(20)) + ' to new manager '+cast(@newmanagerid as varchar(20))
if(@oldjoingdate<>@newjoiningdate)
set  @descr= @descr+' old joining date '+cast(@oldjoingdate as varchar(20)) + ' to new joining date '+cast(@newjoiningdate as varchar(20))
insert into EmployeeLog1 values(@descr)
delete from tempTable where empid=@id
end
end

update tbEmployee set empname='Rekha',city='Pune',deptid=1,Salary=28000,Managerid=1,JoiningDate='' where empid=2


select * from tbEmployee
select * from EmployeeLog1

create table EmployeeLog1
(
logid int primary key identity(1,1),
descr varchar(255)
)