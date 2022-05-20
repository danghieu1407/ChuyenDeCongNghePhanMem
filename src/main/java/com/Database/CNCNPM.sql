create database CDCNPM
use CDCNPM

create table _User
(
	_name text not null,
	_email nchar(100) primary key,
	_password nchar(100) not null,
	_role int default '1',
	_phone nchar(100) not null,
	_address nvarchar(200) not null,
	_wallet int default 0
)

create table _Product
(
	
	_productID nchar(100) primary key,
	_name nchar(100),
	_category nchar(100),
	_price int,
	_amount int default 0,
	_image TEXT,
	_detail text
)


create table _Cart
(	
	_ID int primary key identity(1,1),
	_email nchar(100),
	_productID nchar(100),
	_name nchar(100) ,
	_category nchar(100),
	_price int ,
	_amount int default 0,
	_image TEXT ,
	_detail text 
)

create table _Receipt

(	
	_ID int primary key identity(1,1),
	_email nchar(100),
	_productID nchar(100),
	_name nchar(100),
	_phone nchar(100),
	_category nchar(100),
	_price int ,
	_amount int default 0,
	_image TEXT ,
	_detail text, 
	_address text,
	_date datetime default getdate(),
	_status nchar(8) default 'Waiting'
)

insert into _Cart values('Nguyen Dang Hieu','DB1','2 ','3 ','4 ',' 55','6 ','7 ')


insert into _User values ('Cao Bảo Thái', 'cbt@gmail.com','123456','Admin','0972707663','An Giang','0')
insert into _User values ('Nguyen Dang Hieu', 'ndh@gmail.com','123456','User','123456789','Phu Yen','0')
insert into _User values ('Huynh Nguyen Hoai Bao', 'hoaibao@gmail.com','123456','User','987654321','Tien Giang','0')

insert into _Product values('BBC','Cabbage','vegatable','1000','0','1','Bắp cải siêu sạch')
insert into _Product values('CCB','Cucumber','vegatable','200','0','1','Dưa leo siêu sạch')
