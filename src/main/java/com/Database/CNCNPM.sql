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


insert into _User values ('Cao Bảo Thái', 'cbt@gmail.com','123456','2','0972707663','An Giang','0')
insert into _User values ('Nguyen Dang Hieu', 'ndh@gmail.com','123456','3','0123456789','Phu Yen','0')
insert into _User values ('Huynh Nguyen Hoai Bao', 'hoaibao@gmail.com','123456','1','0987654321','Tien Giang','0')




-- insert data for _Product
insert into _Product values('OR','Orange','Fruit','10','20','orange.jpg','An orange is a fruit of various citrus species in the family Rutaceae (see list of plants known as orange); it primarily refers to Citrus  sinensis,[1] which is also called sweet orange')

insert into _Product values('CR','Carrot','Tubers','25','20','carrot.jpg','A carrot in a vegetable garden. Fresh carrots should be firm and crisp, with smooth and unblemished skin')

insert into _Product values('GL','Garlic','Tubers','20','20','garlic.jpg','Garlic is the small, white, round bulb of a plant that is related to the onion plant. Garlic has a very strong smell and taste and is used in cooking.')

insert into _Product values('CB','Cucumber','Tubers','12','20','cucumber.jpg','Cucumber is a summer vegetable, with elongate shape and 15cm long.')

insert into _Product values('SP','Spinach','Leaves','15','20','spinach.jpg','Spinach is a herbaceous plant whose leaves, green and arranged in rosette, are eaten raw or cooked.')

insert into _Product values('LT','Lettere','Leaves','15','20','spinach.jpg','Spinach is a herbaceous plant whose leaves, green and arranged in rosette, are eaten raw or cooked.')






