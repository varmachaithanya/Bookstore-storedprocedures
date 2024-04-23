--Bookstore user
drop table Users
create table Users(Id int identity primary key,FullName varchar(30),EmailId varchar(50),Password varchar(20),Mobile bigint)

insert into Users(FullName,EmailId,Password,Mobile) values('chaithanya varma','varmachaithanya@gmail.com','Oct@2000',9573691101)

select * from Users

alter procedure spLoginUser(
@EmailId varchar(50),
@Password varchar(30)
)

as
begin
select * from Users where EmailId=@EmailId and Password=@Password
End

spLoginUser @EmailId='varmachaithanya@gmail.com',@Password='Oct@2000'

create procedure spRegisterUser(
@FullName varchar(30),
@EmailId Varchar(50),
@Password varchar(30),
@Mobile bigint
)
as
begin
insert into Users (FullName,EmailId,Password,Mobile) values(@FullName,@EmailId,@Password,@Mobile)
End

spRegisterUser @FullName='kumar',@EmailId='kumar@gmail.com',@Password='Oct@2000',@Mobile=9988776655


alter procedure spForgotPassword(
@EmailId varchar(50)
)
as
begin
select * from Users where EmailId=@EmailId
end

create procedure spUpdateUser(
@Id int,
@FullName varchar(30),
@EmailId varchar(50),
@Mobile bigint)
as 
begin
update Users set FullName=@FullName,EmailId=@EmailId,Mobile=@Mobile
where Id=@Id
end

 --@FullName='arun',@EmailId='arun@gmail.com',@mobile=9123456780,@Id=3

create procedure spGetUsers
as 
begin
select * from Users
end

create procedure spResetPassword(
@EmailId varchar(50),
@Password varchar(30)
)
as
begin
update Users set Password=@Password where EmailId=@EmailId
end








--Bookstore Book
create table Books(Id int identity primary key,Title varchar(max),Price bigint,Author varchar(max),Description varchar(max),Quantity int,Image varchar(max))

insert into Books(Title,Price,Author,Description,Quantity,Image)values('The stranger',1650,'Albert Camus','A young Algerian, Meursault, afflicted with a sort of aimless inertia, becomes embroiled in the petty intrigues of a local pimp and, somewhat inexplicably, ends up killing a man.',10,'assets\+-+40063136_140.jpg')

update Books set Title='The stranger',Author='Albert Camus',Description='A young Algerian, Meursault, afflicted with a sort of aimless inertia, becomes embroiled in the petty intrigues of a local pimp and, somewhat inexplicably, ends up killing a man.',Image='assets\+-+40063136_140.jpg' where Id=1
delete from Books where Id=13
select * from Books
update Books set Title='Alices Adventures' where Id=4

create procedure spGetBooks
as 
begin
select * from Books
end

spGetBooks

create procedure spGetBookById(
@Id int)
as
begin
select * from Books where Id=@Id
end

spGetBookById @id=1

create procedure spGetBookByTitle(
@Title varchar(max))
as
begin
select * from Books where Title=@Title
end

spGetBookByTitle @title='The Great Gatsby'

create procedure spGetBookByAuthor(
@Author varchar(max)
)
as
begin
select * from Books where Author=@Author
end

spGetBookByAuthor @Author='F. Scott Fitzgerald'


create procedure spGetBookByTitleAndAuthor(
@Title varchar(max),
@Author varchar(max)
)
as
begin
select * from Books where Title=@Title and Author=@Author
end

spGetBookByTitleAndAuthor @Title='The Great Gatsby',@Author='F. Scott Fitzgerald'






--Bookstore cart

create table Cart(Cart_Id int identity primary key,UserId int foreign key references Users(Id),Quantity int,BookId int foreign key references Books(Id))


insert into Cart(UserId,Quantity,BookId) values (1,10,1)

select * from Cart


alter procedure spAddToCart(
@UserId int,
@Quantity int,
@BookId int
)
as
begin
insert into Cart(UserId,Quantity,BookId) values (@UserId,@Quantity,@BookId)
end




create PROCEDURE spGet_cart
    @userId BIGINT
AS
BEGIN
    SELECT b.Id,
           b.Title,
           b.Author,
           b.Description,
           c.Quantity,
           b.price,
           b.image
    FROM Cart c
    INNER JOIN Books b ON c.BookId = b.Id
    WHERE c.UserId = @userId;
END;


create procedure spUpdateQuantity(
@UserId int,
@Quantity int,
@BookId int
)
as
begin
update Cart set Quantity=@Quantity where UserId=@UserId and BookId=@BookId
end


alter procedure spDelete_cart(
@UserId int,
@BookId int)
as
begin
delete from Cart where UserId=@UserId and BookId=@BookId
end








--BookStore  whishlist



create table WhishList(W_Id int identity primary key,UserId int foreign key references Users(Id),BookId int foreign key references Books(Id))

create procedure spAddtowhishlist(
@UserId int,
@BookId int)
as 
begin
insert into WhishList(UserId,BookId) values (@UserId,@BookId)
end

spAddtowhishlist @UserId=1,@BookId=1

create procedure spGetWhishlist(
@UserId int)
as
begin
select b.Id,
           b.Title,
           b.Author,
           b.Description,
           b.price,
           b.image
	from Whishlist w
	INNER JOIN Books b ON w.BookId = b.Id
    WHERE w.UserId = @userId;
END;
 
spGetWhishlist  @UserId=1


create procedure spDeleteWhishlist(
@UserId int,
@BookId int)
as
begin

delete from Whishlist where UserId=@UserId and BookId=@BookId

end




--Bookstore Address


create table Address(AddressId int identity primary key,
					UserId int foreign key references Users(Id),
					FullAddress varchar(max),
					City varchar(max),
					State varchar(max),
					Type varchar(max)
					)



					
create procedure spAddAddress(
@UserId int,
@FullAddress varchar(max),
@City varchar(max),
@State varchar(max),
@Type varchar(max)
)
as 
begin
insert into Address(UserId,FullAddress,City,State,Type) values (@UserId,@FullAddress,@City,@State,@Type)
end

alter procedure spGetAddress(
@UserId int
)
as
begin
select * from Address where UserId=@UserId
end


alter procedure spUpdateAddress
(
@UserId int,
@FullAddress varchar(max),
@City varchar(max),
@State varchar(max),
@Type varchar(max)
)
as
begin
update Address set FullAddress=@FullAddress,City=@City,State=@state,Type=@Type
where UserId=@UserId
end






--Bookstore  Order


create table Orders(Id int identity primary key,UserId int foreign key references Users(Id),BookId int foreign key references Books(Id),Quantity int)



create procedure spAddOrder(
@UserId int,
@BookId int,
@Quantity int
)
as
begin
insert into Orders(UserId,BookId,Quantity)values(@UserId,@BookId,@Quantity)
end


alter procedure spGetOrders(
@UserId int)
as
begin
select  b.Id,
           b.Title,
           b.Author,
           b.Description,
		   O.Quantity,
           b.price,
           b.image
		   from Orders O
	INNER JOIN Books b ON O.BookId = b.Id
    WHERE O.UserId = @userId;
end






--Bookstore  Review



create table Review(Id int identity primary key,Review varchar(max),Star int,BookId int foreign key references Books(Id),UserId int foreign key references Users(Id))




create procedure spAddReview(
@Review varchar(max),
@Star int,
@BookId int,
@UserId int
)
as
begin
insert into Review(Review,Star,BookId,UserId) values (@Review,@star,@BookId,@UserId)
end


create procedure spGetReview(
@BookId int)
as
begin
select u.FullName,
	   r.Review,
	   r.Star,
	   r.BookId
	   from Users u
	   Inner Join Review r ON r.UserId = u.Id
    WHERE r.BookId = @BookId;
end



