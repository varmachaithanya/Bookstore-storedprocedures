create table student(rollno int identity,name varchar(10),mobile bigint unique,age int)
insert into student(name,mobile,age) values('chaithanya',9573691101,23)
insert into student(name,mobile,age) values('varma',9999991101,24)
insert into student(name,mobile,age) values('kumar',8888881101,21)
insert into student(name,mobile,age) values('kiran',7777771101,23)
insert into student(name,mobile,age) values('vijay',6666661101,22)
insert into student(name,mobile,age) values('singh',5555551101,25)
insert into student(name,mobile,age) values('patel',4444441101,26)
insert into student(name,mobile,age) values('patel',4443441101,26)



create table course(id int identity,no int)
insert into course(no) values(1)
insert into course(no) values(2)
insert into course(no) values(3)
insert into course(no) values(4)
insert into course(no) values(15)
insert into course(no) values(6)
insert into course(no) values(7)
insert into course(no) values(8)
insert into course(no) values(9)

select * from course

select * from student


select rollno,name,age
from student
inner join course
on course.no=student.rollno

select name,age,mobile,course.id
from student
left join course
on student.rollno=course.no


select rollno,name,age,course.no
from student
right join course
on student.rollno=course.no

select student.name,course.id
from student
full join course
on student.rollno=course.no

select name,age
from student
cross join course

select student.name,student.age
from student
where student.rollno in(
select id
from course
where no=15 or no=1)
order by 
name desc



