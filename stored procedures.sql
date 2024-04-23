alter procedure spGetemployeedata
as
begin
select id,name from employeedetails
end

sp_helptext spGetemployeedata

spGetemployeedata

--with parameters

alter procedure spGetemployeedata
@id int,
@name varchar(20)
as
begin
select id,name,phnum from employeedetails
where id=@id and name=@name
end

spGetemployeedata 1,'chaithanya'

spGetemployeedata @name='chaithanya',@id=1

--with encryption
alter procedure spGetemployeedata
@id int,
@name varchar(20)
with encryption
as
begin
select id,name,phnum from employeedetails
where id=@id and name=@name
end

create procedure spCountOfEmployee
@name varchar(20),
@employeecount int output
as
begin
select @employeecount=count(id) from employeedetails where name=@name
end

declare @totalcount int
execute spCountOfEmployee 'chaithanya',@totalcount output
if(@totalcount is null)
	print('@totalcount is null')
else
	print('@totalcount is not null')

print @totalcount

select * from employeedetails


create procedure sptotalcount
@empcount int output
as
begin
select  @empcount=count(*) from employeedetails
end

declare @totalcount int
execute sptotalcount @totalcount output
print  @totalcount

create procedure sptotalcount2
as
begin
return (select count(*) from employeedetails) 
end

declare @totalemp int
execute @totalemp=sptotalcount2
select @totalemp

