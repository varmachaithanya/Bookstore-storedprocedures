create function fadd(@var int)
returns int
as
begin
return @var+100
end

select dbo.fadd(100)


alter function employedata(
@id varchar(50),
@name varchar(50),
@phnum varchar(50))
returns nvarchar(100)
as
begin
return(select @id+' ,'+@name+' ,'+@phnum)
end

select dbo.employedata(id,name,phnum) as employdata from employeedetails

create function tabularfunc()
returns table
as
return(select * from employeedetails)

select * from tabularfunc()

