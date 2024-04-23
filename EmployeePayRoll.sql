create table Employeeroll(
Id int identity primary key,
Name varchar(50),
ProfileImage varchar(200),
Gender varchar(15),
Department varchar(30),
Salary bigint,
StartDate date,
Notes Varchar(50)
)

INSERT INTO Employeeroll (Name, ProfileImage, Gender, Department, Salary, StartDate, Notes)
VALUES 
('John Doe', 'profile_image.jpg', 'Male', 'IT', 60000, '2022-01-15', 'Employee notes here');


alter procedure spAddEmployee(
@Name varchar(50),
@ProfileImage varchar(200),
@Gender varchar(15),
@Department varchar(30),
@Salary bigint,
@StartDate date,
@Notes Varchar(50)
)
as 
begin
Insert into Employeeroll(Name,ProfileImage,Gender,Department,Salary,StartDate,Notes) values
(@Name,@ProfileImage,@Gender,@Department,@Salary,@StartDate,@Notes)
End


alter procedure spUpdateEmployee(
@Id int,
@Name varchar(50),
@ProfileImage varchar(200),
@Gender varchar(15),
@Department varchar(30),
@Salary bigint,
@StartDate date,
@Notes Varchar(50)
)
as 
begin
update Employeeroll set Name=@Name,ProfileImage=@ProfileImage,Gender=@Gender,Department=@Department,Salary=@Salary,StartDate=@StartDate,
Notes=@Notes
where Id=@Id
End

alter procedure spUpdateEmployeeByName(

@Name varchar(50),
@ProfileImage varchar(200),
@Gender varchar(15),
@Department varchar(30),
@Salary bigint,
@StartDate date,
@Notes Varchar(50)
)
as 
begin
update Employeeroll set Name=@Name,ProfileImage=@ProfileImage,Gender=@Gender,Department=@Department,Salary=@Salary,StartDate=@StartDate,
Notes=@Notes
where Name=@Name
End

alter procedure spDeleteEmployee(
@Id int
)
as 
begin
delete from Employeeroll where Id=@Id
End

create procedure spDeleteEmployeeByName(
@Name varchar(50)
)
as 
begin
delete from Employeeroll where Name=@Name
End

Create procedure spGetAllEmployee
as 
begin
select * from Employeeroll
End

Create procedure spGetEmployeeById(
@Id int
)
as 
begin
select * from Employeeroll where Id=@Id
End

Create procedure spGetEmployeeByName(
@Name varchar(100)
)
as 
begin
select * from Employeeroll where Name=@Name
End

alter procedure spLoginModel(
@Id int,
@Name varchar(50)
)
as begin 
select * from Employeeroll where Id=@Id and Name=@Name
End

spLoginModel @Id =1, @Name ='John Doe';

alter procedure spGetEmployeeByChar(
@Name Varchar
)
as 
begin
select * from Employeeroll where Name like @Name+'%'
End

spGetEmployeeByChar @Name='c'

Create procedure spGetEmployeeByDate(
@date date
)
as 
begin
select * from Employeeroll where StartDate=@date
End

spGetEmployeeByDate @date='2022-01-26'

Create procedure spGetByName(
@name varchar(50)
)
as 
begin
select * from Employeeroll where Name=@name
End

spGetByName @Name='chaithanya'

CREATE PROCEDURE spAddUpdateEmployee
    @Name varchar(50),
    @ProfileImage varchar(200),
    @Gender varchar(15),
    @Department varchar(30),
    @Salary bigint,
    @StartDate date,
    @Notes varchar(50)
AS 
BEGIN
    IF EXISTS (SELECT 1 FROM Employeeroll WHERE Name = @Name)
    BEGIN
        UPDATE Employeeroll
        SET ProfileImage = @ProfileImage,
            Gender = @Gender,
            Department = @Department,
            Salary = @Salary,
            StartDate = @StartDate,
            Notes = @Notes
        WHERE Name = @Name;
    END
    ELSE
    BEGIN
        INSERT INTO Employeeroll (Name, ProfileImage, Gender, Department, Salary, StartDate, Notes)
        VALUES (@Name, @ProfileImage, @Gender, @Department, @Salary, @StartDate, @Notes);
    END
END;

spAddUpdateEmployee @Name='kumar',@ProfileImage='chaithNYa',@Gender='female',@Department='mca',@Salary=50000,@StartDate='2022-01-26',@Notes='welcome'

alter procedure spGetEmployeeByChar(
@Name Varchar
)
as 
begin
select * from Employeeroll where Name like @Name+'%'
End

alter procedure spGetEmployeeByDate(
@startdate date,
@enddate date
)
as 
begin
select * from Employeeroll where StartDate between @startdate and @enddate
End