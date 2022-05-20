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

insert into _Product values('LT','Lettere','Leaves','17','20','lettuce.jpg','lettuce, (Lactuca sativa), annual leaf vegetable of the aster family (Asteraceae)')


insert into _Product values('LTR','Lotusroot','Tubers','19','20','lotusroot.jpg','Lotus roots are cylindrical and brown. However, once sliced crosswise, you will see a lace-like design with pea-sized holes. The root is crunchy, mild in flavor, and very delicious')

insert into _Product values('ST','Strawberry','Fruit','13','20','strawberry.jpg','Strawberries are soft, sweet, bright red berries. They are also delicious. Strawberries have tiny edible seeds, which grow all over their surface')

insert into _Product values('TM','Tomato','Fruit','12','20','tomato.jpg','They are usually red, scarlet, or yellow, though green and purple varieties do exist, and they vary in shape from almost spherical to oval and elongate to pear-shaped')

insert into _Product values('BNN','Banana','Fruit','10','20','banana.jpg','A banana is a curved, yellow fruit with a thick skin and soft sweet flesh. If you eat a banana every day for breakfast, your roommate might nickname you "the monkey."')

insert into _Product values('SCL','Scallion','Leaves','11','20','scallion.jpg','Scallions are a variety of young onion also referred to as green onions and spring onions')


insert into _Product values('SSP','Sweet Potato','Tubers','5','20','sw.jpg','Sweet potatoes have a fusiform shape, orange colour and a thicker and harder rind')

insert into _Product values('BR','beetroot','Tubers','7','20','beetroot.jpg','Beetroot is the large and fleshy root growing in the plant of the same name, eaten as a vegetable')



insert into _Product values('SPR','sprouts','Leaves','6','20','sprouts.jpg','A sprout is a small growth on a plant — a little new bud. Other things can sprout too: kids are constantly sprouting (growing)')


insert into _Product values('BKC','Bok Choy','Leaves','6','20','BokChoy.jpg','Bok choy (pak choi), also called spoon cabbage (B. rapa, variety chinensis), has glossy dark green leaves and thick crisp white or green stalks in a loose head. ')

insert into _Product values('SAL','Salad','Leaves','6','20','Salad.jpg','Bok choy (pak choi), also called spoon cabbage (B. rapa, variety chinensis), has glossy dark green leaves and thick crisp white or green stalks in a loose head. ')

insert into _Product values('PIN','Pineapple','Fruit','6','20','pineapple.jpg','Pineapples have yellow or white pulp, fleshy, aromatic, juicy and sweet. In the fruit there is a fibrous axis that extends from the crown to the pedicle. ')

insert into _Product values('WTM','Water melon','Fruit','20','20','watermelon.jpg',' a large oblong or roundish fruit with a hard green or white rind often striped or variegated, a sweet watery pink, yellowish, or red pulp, and usually many seeds. ')


insert into _Product values('CAS','Cashew','Seed','20','20','cashew.jpg',' The leathery leaves are spirally arranged and elliptical in shape. The curved fruit, which is not a true nut, is shaped like a large thick bean and can reach more than 2.5 cm (1 inch) long. ')




insert into _Product values('BLB','Black Beans','Seed','10','20','blackbean.jpg','Black beans are medium to small, oval-shaped beans with a shiny black coat. They have a small, white eye or spot called a “keel.”')




insert into _Product values('SOB','Soy bean','Seed','3','20','soybean.jpg','The soybean, soy bean, or soya bean (Glycine max) is a species of legume native to East Asia, widely grown for its edible bean, which has numerous uses.')


insert into _Product values('ENO','Enokitake','Mushroom','3','20','Enokitake.jpg','Commercially farmed enoki is a long, thin white mushroom and is a popular ingredient for soups, especially in East Asian cuisine')
 
insert into _Product values('STM','Straw Mushrooms','Mushroom','4','20','strawmushrooms.jpg','Straw mushrooms grow in clusters and have varying appearances depending on maturity')




insert into _Product values('WEM','Wood-Ear Mushroom','Mushroom','6','20','woodearmushrooms.jpg','Wood ear mushrooms are a dark-to-light brown fungi that looks like a small crinkled ear')





insert into _Product values('CHI','Chilli','Spice','6','20','Chilli.jpg','Chilli is a fruit which belongs to Capsicum genus. It has many varieties which are differentiated on its pungency measured on Scoville Scale')



insert into _Product values('PEP','Pepper','Spice','6','20','pepper.jpg','Pepper or black pepper is the dried unripe fruit grown in the plant called piper nigrum')


















