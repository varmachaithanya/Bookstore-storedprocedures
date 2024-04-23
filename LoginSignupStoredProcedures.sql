select * from Logindatatable

create procedure spLoginusersData
as
begin
select Username,Password from Logindatatable
end

insert into Logindata values('chaithanya','Oct@2000')

alter procedure spSignupusersData
@Name varchar(50),
@Age int,
@Email varchar(50),
@Phone varchar(50),
@Username varchar(50),
@Password varchar(50)
as
begin
insert into Logindatatable values(@Name,@Age,@Email,@Phone,@Username,@Password)
end

create procedure spGetusersData
as
begin
select * from Logindatatable
end

create procedure spDeleteusersData
@Name varchar(50)
as
begin
delete from Logindatatable where Name=@Name
end