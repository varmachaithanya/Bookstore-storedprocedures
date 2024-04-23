create table employeedata(id int primary key,name varchar(20),age int,department varchar(20),salary int)

insert into employeedata values(1,'chaithanya',23,'sales',40000)
insert into employeedata values(2,'kiran',24,'sales',45000)
insert into employeedata values(3,'kumar',27,'marketing',50000)
insert into employeedata values(4,'varma',29,'it',49000)
insert into employeedata values(5,'vija',27,'it',30000)

select * from employeedata

select name,age 
from employeedata
where department='sales'

select count(*)
from employeedata

select avg(salary) as average_sal
from employeedata
where age>25

select max(salary) from employeedata

select * from employeedata
where name like 'v%'

select name,salary 
from employeedata
order by salary desc
offset 0 rows
fetch first 5 rows only

