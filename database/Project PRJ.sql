set nocount on
USE master
GO

if exists (select * from sysdatabases where name='Store')
begin
  raiserror('Dropping existing Store database ....',0,1)
  DROP database [Store]
end
GO

CHECKPOINT
go

raiserror('Creating Store database....',0,1)
go
   CREATE DATABASE [Store]
GO

CHECKPOINT
GO

USE [Store]
GO

Create table Category(
	CaId int IDENTITY(1,1) primary key,
	CaName Varchar(30) not null,
	)

Create TABLE Product(
	pId CHAR(4) primary key,
	pName varchar(30) not null,
	price FLOAT not null,
	[image] VARCHAR(50) not NULL,
	CaId int foreign key REFERENCES dbo.Category
)
CREATE TABLE [UserLog](
	[userName] [varchar](20)  primary key clustered,
	[password] [nvarchar](50) NOT NULL,
	)
GO
CREATE TABLE UserInfo(
	Id varchar(20) primary key clustered references [UserLog](userName),
	Name varchar(20) NOT NULL,
	phone varchar(10) UNIQUE NOT NULL,
	email VARchar(50) UNIQUE NOT NULL,
	address VARCHAR(100) not NULL,
)

CREATE TABLE Cart(
	pId CHAR(4) FOREIGN KEY REFERENCES dbo.Product,
	size char(4),
	quantity INT NOT NULL,
	)

CREATE TABLE OrderInfo(
	oId int IDENTITY(1,1) PRIMARY KEY,
	[uId] varchar(20) FOREIGN KEY REFERENCES dbo.UserLog(userName),
	[status] varchar(20),
	[Description] text
	)


Go

INSERT INTO Category(CaName)
VALUES
('Shirt'),('Trouser'),('Jacket'),('Accessories');



INSERT INTO Product
VALUES
('S001','Bad Boy Shirt',160,'Shirt (1).jpg',1),
('S002','Stussy Green Neon Shirt',160,'Shirt (2).jpg',1),
('S003','Hard Rock Shirt',160,'Shirt (3).jpg',1),
('S004','Nike Blue Stripe Shirt',160,'Shirt (4).jpg',1),
('S005','Dallas Cowboys Shirt',160,'Shirt (5).jpg',1),
('S006','Yankees Shirt',160,'Shirt (6).jpg',1),
('S007','Stylelist Shirt',160,'Shirt (7).jpg',1),
('S008','Vintage Nike Jordan Shirt',160,'Shirt (8).jpg',1),
('S009','Stussy Yellow Stripe Shirt',160,'Shirt (9).jpg',1),
('S010','Ringer Vintage Shirt',160,'Shirt (10).jpg',1),

('J001','Supreme Red Jacket',220,'Jacket (1).jpg',3),
('J002','The North Face Jacket',220,'Jacket (2).jpg',3),
('J003','Scrapes Jacket',220,'Jacket (3).jpg',3),
('J004','Gile Jacket',220,'Jacket (4).jpg',3),
('J005','Levi Straus Jeans Jacket',220,'Jacket (5).jpg',3),
('J006','Playboy VIP Jacket',220,'Jacket (6).jpg',3),
('J007','Mizzou Hoodie',220,'Jacket (7).jpg',3),
('J008','Issey Miyake Red Jacket',220,'Jacket (8).jpg',3),
('J009','Vans Windbreaker Jacket',220,'Jacket (9).jpg',3),
('J010','Double Mars Leather Jacket',220,'Jacket (10).jpg',3),
('J011','Ellese Vintage Jacket',220,'Jacket (11).jpg',3),


('T001','Cargo 1 Trouser',180,'Trouser (1).jpg',2),
('T002','Cargo 2 Trouser',180,'Trouser (2).jpg',2),
('T003','Cargo 3 Trouser',180,'Trouser (3).jpg',2),
('T004','Cargo 4 Trouser',180,'Trouser (4).jpg',2),
('T005','Cargo 5 Trouser',180,'Trouser (5).jpg',2),
('T006','Cargo 6 Trouser',180,'Trouser (6).jpg',2),
('T007','Cargo 7 Trouser',180,'Trouser (7).jpg',2),
('T008','Cargo 8 Trouser',180,'Trouser (8).jpg',2),
('T009','Cargo 9 Trouser',180,'Trouser (9).jpg',2),
('T010','Cargo 10 Trouser',180,'Trouser (10).jpg',2),
('T011','Cargo 11 Trouser',180,'Trouser (11).jpg',2),

('A001','Grey HandBag',250,'Accessory (1).jpg',4),
('A002','Givenchy Monogram HandBag',350,'Accessory (2).jpg',4),
('A003','Adidas Admiral Backpack',250,'Accessory (3).jpg',4),
('A004','Hermes HandBag',350,'Accessory (4).jpg',4),
('A005','Ysl Vintage HandBag',350,'Accessory (5).jpg',4),
('A006','Lancel HandBag',350,'Accessory (6).jpg',4),
('A007','Leather HandBag',300,'Accessory (7).jpg',4),
('A008','Canvas HandBag',250,'Accessory (8).jpg',4),
('A009','Beach HandBag',250,'Accessory (9).jpg',4),
('A010','P&D HandBag',250,'Accessory (10).jpg',4),
('A011','Nike Backpack',250,'Accessory (11).jpg',4)

GO

INSERT INTO userlog
VALUES
('Guest','123456789987654321'),
('admin','1')

go

INSERT INTO UserInfo
VALUES
('admin','Admin',' ',' ',' ')
/*
INSERT INTO Cart
VALUES
('S001','S','10'),
('S006','XL','7')

go

*/