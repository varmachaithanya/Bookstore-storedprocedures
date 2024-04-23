create table Stringdatatypes(firstname char(15),lastname varchar(10),address varchar(max),textdescription text)

insert into Stringdatatypes values('chaithanya','varma','alluru,9/19,alakapuram,bapatla','welcome to bridgelabz')
insert into Stringdatatypes values('chaithanya1','varma','alluru,9/19,alakapuram,bapatla','welcome to bridgelabz')
insert into Stringdatatypes values('chaithanya','varma1','alluru,9/19,alakapuram,bapatla','welcome to bridgelabz')
insert into Stringdatatypes values('chaithanya','varma','alluru,9/19,alakapuram,bapatla','welcome to bridgelabz1')

select * from Stringdatatypes

create table Numericdatatypes(bits bit,mobile bigint,id smallint,price float,value1 decimal(10,2),value2 decimal(10,2))
insert into Numericdatatypes values(0,9573691101,1101,100.0345,123.22,321.33)
insert into Numericdatatypes values(10,9573691101,1101,100.0345,123.22,321.33)
insert into Numericdatatypes values(1110,9573691101,1101,100.0345,123.22,321.33)
insert into Numericdatatypes values(1110,9573691101,1101,100.0345,123.212,321.33)


select * from Numericdatatypes;


create table Datetimedatatypes(event datetime,dates date,timings time)

insert into Datetimedatatypes values('2024-01-09T10:30:00','2024-01-31','12:00:00')

select * from Datetimedatatypes


create table studentDetails(id int,name varchar(20),mail varchar(30),mobile bigint)

alter table studentDetails
alter column id int not null;

alter table studentDetails
alter column name varchar(20) not null;

alter table studentDetails
alter column mail varchar(20) not null;

alter table studentDetails
alter column mobile bigint not null;



alter table studentDetails
add constraint uc_mail unique(mail);

alter table studentDetails
add constraint uc_mobile unique(mobile);

insert into studentDetails values(1,'chaithanya','varma1101@gmail.com',9573691101)
insert into studentDetails values(1,'chaithanya','chaithanya@gmail.com',9030041101)
insert into studentDetails values(2,'chaithanya','aa@gmail.com',9130041101)


alter table studentDetails 
add check(id>0)

alter table studentDetails
add  city varchar(20)

alter table studentDetails
add constraint uc_default  default 'banglore' for city;
insert into studentDetails(id,name,mail,mobile) values(2,'chaithanya','bb@gmail.com',9230041101)




select * from studentDetails

create table employeedetails(id int primary key,name varchar(20)not null,phnum bigint)

alter table employeedetails
add constraint uc_unique unique(phnum)


insert into employeedetails values(1,'chaithanya',9573691101)
insert into employeedetails values(2,'chaithanya',9030041101)
insert into employeedetails values(3,'varma',9397960108)
insert into employeedetails values(4,'kiran',9704571101)
insert into employeedetails values(5,'kumar',9130041101)

select * from employeedetails

create table emlployee(empid int primary key,empsalary float,empcity varchar(20),id int foreign key references employeedetails(id))

insert into emlployee values(1,40000,'banglore',1)
insert into emlployee values(10,40000,'banglore',2)
insert into emlployee values(11,45000,'banglore',3)
insert into emlployee values(12,50000,'banglore',4)
insert into emlployee values(13,60000,'banglore',5)





select * from emlployee



select * from employeedetails




