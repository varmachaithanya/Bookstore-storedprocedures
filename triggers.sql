create trigger trEmpinsert
on employeedetails
for insert
as
begin
declare @id int
select @id=id from inserted
insert into audit values('new employee with id = '+cast(@id as nvarchar(5))+ 'is added at '+cast(Getdate() as varchar(20)))
end

insert into employeedetails values (10,'jj',09876)

select * from audit
select * from employeedetails

alter trigger trEmpDelete
on employeedetails
instead of delete
as begin
declare @id int
select @id=id from deleted
insert into audit values(2,'existing employee with id= '+cast(@id as nvarchar(5))+ 'is deleted at '+cast(getdate() as varchar(20)))
end
delete from employeedetails where id=10

alter trigger trddlemployee
on database
for alter_table
as
begin
print ('sucess')
end

alter table details
alter column id varchar (20)
