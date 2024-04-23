create table Customer(id int identity(1,1) primary key ,firstname varchar(20) not null,lastname varchar(20) not null,mobile bigint unique,mail varchar(40) unique not null,city varchar(30) not null)
insert into Customer(firstname,lastname,mobile,mail,city) values ('chaithanya','varma',9573691101,'chaithanya@gmail.com','banglore')
insert into Customer(firstname,lastname,mail,city) values ('kumar','varma','kumar@gmail.com','banglore')
insert into Customer(firstname,lastname,mobile,mail,city) values ('kiran','singh',9704571101,'kiran@gmail.com','hyderabad')
insert into Customer(firstname,lastname,mobile,mail,city) values ('arjun','patel',9876543210,'arjun@gmail.com','delhi')
insert into Customer(firstname,lastname,mobile,mail,city) values ('sachin','sharma',9988776655,'sachin@gmail.com','kolkata')

--select commands
select * from Customer

select firstname,lastname from Customer;

select * from Customer where id=5

select * from Customer where city='banglore' order by firstname

select city ,count(*) from Customer where lastname='varma' group by city order by city

select city,count(*) from Customer where lastname='varma' group by city having(count(*)>1) order by city

--sorting data
select firstname,lastname from Customer order by firstname

select firstname,lastname from Customer order by firstname desc

select firstname,lastname,city from Customer order by firstname,lastname

select city,firstname,lastname from Customer order by city asc,firstname desc

select firstname from Customer order by city

select firstname,lastname from Customer order by LEN(firstname) desc

select firstname,lastname from Customer order by 1

--offset
select firstname,lastname from Customer
order by firstname,lastname
offset 2 rows

select firstname,lastname from Customer
order by firstname,lastname
offset 2 rows
fetch next 3 row only

select firstname,lastname from Customer
order by firstname,lastname
offset 0 rows
fetch first 2 row only

--top

select top 3 *
from Customer

--top percent
select top 20 percent *
from Customer

--top with ties
select top 3 with ties *
from Customer
order by
lastname desc

--distinct
select distinct city
from Customer
order by city

select distinct city,lastname
from Customer
order by city

select distinct mobile 
from Customer

--where
select firstname,lastname
from Customer
where lastname='varma' and city='banglore'

--and/or
select firstname,lastname
from Customer
where id>0 and id=2

select firstname,lastname
from Customer
where id>0 or id=2


select firstname,lastname
from Customer
where id between 1 and 2

select firstname,lastname
from Customer
where id in (1,2,3,4)

--like
select firstname,lastname
from Customer
where lastname like '%v%'

select firstname 
from Customer
where id=1 and city='banglore' and lastname='varma'

select firstname 
from Customer
where id=1 or id=2 and city='banglore' and lastname='varma'

--not in
select firstname
from Customer
where id not in(2,3,4,5)

--in
select firstname
from Customer
where id in(select id
			from Customer
			where id=1 or id=2)

--between
select firstname 
from Customer
where id between 1 and 4

--not between
select firstname 
from Customer
where id not between 1 and 4

--like
--start with c
select firstname
from Customer
where firstname Like 'c%'

--word contains a
select firstname
from Customer
where firstname Like '%a%'

--ends with ya
select firstname
from Customer
where firstname Like '%ya'

--starts with leter c and ends with a
select firstname
from Customer
where firstname Like 'c%a'

--second char should be h
select firstname
from Customer
where firstname Like '_h%'

--words start with c and a
select firstname
from Customer
where firstname Like '[ca]%'

--word start from a to c
select firstname
from Customer
where firstname Like '[a-c]%'

--words that not start with a to c
select firstname
from Customer
where firstname Like '[^a-c]%'

--words that not start with c
select firstname
from Customer
where firstname not Like 'c%'

--as(alias)
select firstname+' '+lastname as full_name
from Customer

--group by
select city,count(id) customerid
from Customer
where city in ('banglore','delhi')
group by city

select city,max(id) maximum_id
from Customer
group by city

--having
select city,count(id) customerid
from Customer
group by city
having count(id)>1

select city,count(id) customerid
from Customer
group by city
having count(id)>0

--union
select firstname
from Customer
union
select lastname
from Customer

select firstname,lastname
from Customer
union 
select firstname,lastname
from Customer
where id<5

--union all:to indicate duplicates we use union all
select firstname,lastname
from Customer
union all
select firstname,lastname
from Customer
where id<=5
order by firstname

--intersect
select city
from Customer
intersect 
select city
from Customer

--except:removes matched data and displays unmatched data
select city
from Customer
except
select city
from Customer

--nullif:return null if two values are equal/return first value if not equal.
select
nullif(10,20) result

--coalesce:accept number of arguments and return first non-null value.
select
coalesce(null,null,10,20) result

--case:evaluates a list of conditions and returns one of the specified result
select 
case id
when 1 then 'pending'
when 2 then 'processing'
when 3 then 'working'
when 4 then 'completed'
when 5 then 'done'
end as id
from Customer
group by id
having id=2


