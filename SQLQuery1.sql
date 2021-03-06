create table tblRole (
RoleID int identity(1,1) Primary Key,
RoleName nvarChar(50),
RoleDescription nvarChar(50),
)

create table tblUser (
UserName nvarChar(50) Primary Key,
FullName nvarChar(50),
Pass nvarChar(50),
Mobile nvarChar(11),
City nvarChar(50),
Country nvarChar(50),
RoleID int
)

insert into tblUSer(UserName,FullName,Pass,Mobile,City,Country,RoleID) values (@UserName,@FullName,@Pass,@Mobile,@City,@Country,@RoleID)

select * from tblRole
select * from tblUser

set nocount on;
select t1.UserName,t1.FullName,t1.Pass,t1.Mobile,t1.City,t1.Country,t2.RoleName from tblUser as t1 with(nolock)
inner join tblRole as t2 with(nolock) on t2.RoleID=t1.RoleID

create table tblCustomer (
ID int identity(1,1) Primary Key,
CustomerName nvarChar(50),
[Address] nvarChar(50),
Mobile nvarChar(11),
)

insert into tblCustomer(CustomerName,[Address],Mobile) values (@CustomerName,@Address,@Mobile)

select ID, CustomerName,Address,Mobile from tblCustomer

create table tblCategory (
ID int identity(1,1) Primary Key,
CategoryName nvarChar(50),
)
insert into tblCategory(CategoryName) values (@CategoryName)
select ID, CategoryName from tblCategory

create table tblProduct (
ID int identity(1,1) Primary Key,
ProductCode int,
ProductName nvarChar(50),
ProductAmount int,
ProductStatus nvarChar(10),
SelectedWarehouse nvarChar(50) 
)

insert into tblProduct(ProductCode,ProductName,ProductAmount,ProductStatus,SelectedWarehouse) values (@ProductCode,@ProductName,@ProductAmount,@ProductStatus,@SelectedWarehouse)
select ID, ProductCode, ProductName, ProductAmount, ProductStatus, SelectedWarehouse from tblProduct

create table tblWarehouse (
ID int identity(1,1) Primary Key,
Warehouses nvarchar(50)
)