create table StudentForm(
Id int,
Name varchar(50),
Branch varchar(200),
Address varchar(15),
Mobile bigint,

)

create procedure spAddStudent(
@Id int,
@Name varchar(200),
@Branch varchar(15),
@Address varchar(15),
@Mobile bigint
)
as 
begin
Insert into StudentForm(Id,Name,Branch,Address,Mobile) values
(@Id,@Name,@Branch,@Address,@Mobile)
End

spAddStudent @Id =1, @Name ='John Doe',@Branch='MCA',@Address='banglore',@Mobile=9573691101;


Create procedure spGetStudent
as 
begin
select * from StudentForm
End

alter procedure spDeleteStudent
@Id int
as 
begin
delete from StudentForm where Id=@Id
End

spDeleteStudent @Id=2

alter procedure spUpdateStudent(
@Id int,
@Name varchar(200),
@Branch varchar(15),
@Address varchar(15),
@Mobile bigint
)
as 
begin
Update StudentForm set Id=@Id,Name=@Name,Branch=@Branch,Address=@Address,Mobile=@Mobile where @Id=Id
End

Create procedure spGetStudentByName(
@Name varchar(100)
)
as 
begin
select * from StudentForm where Name=@Name
End