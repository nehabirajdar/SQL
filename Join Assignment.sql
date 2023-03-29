create table Book(Bookid int ,Book_name varchar(20),author_id int,Price int,PublishedDate Date)
create table Author1(author_id int,author_name varchar(30),Phone_number varchar(10),Email varchar(50),Address varchar(30),City varchar(15))
create table Awards(award_id int,awardtypeId int,authorid int,bookid int,year int)
create table AwardMaster(awardtypeId int,awardname varchar(30),awardPrice int)


insert into Book values(1,'Wings of fire',01,500,'1998-05-01')
insert into Book values(2,'Shyam chi Aai',02,450,'01-10-2000')
insert into Book values(3,'Yayati',03,200,'10-05-1990')
insert into Book values(4,'Dhanajay',04,450,'02-10-1998')
insert into Book values(5,'Deh Zala Chandnacha',05,500,'12-05-2002')

select * from Author1

insert into Author1 values(01,'Abdul Kalam','9837645243','abc@gmail.com','abc','Pune')
insert into Book values(02,'Wings of fire',01,500,01-05-1998)
insert into Book values(03,'Wings of fire',01,500,01-05-1998)
insert into Book values(04,'Wings of fire',01,500,01-05-1998)
insert into Book values(05,'Wings of fire',01,500,01-05-1998)


