create database store;
use store;
create table Banners(
id int primary key ,
title varchar(30) unique not null,
image blob,
summary text,
link blob,
order_by varchar(255),
status bit
);
create table Contacts(
id int primary key,
email varchar(36),
address varchar(40),
message nvarchar(255),
status bit
);
create table Blogs(
id int primary key,
title varchar (30),
image blob,
content varchar(255),
status bit
);
create table Abouts(
id int primary key,
title varchar (30),
image blob,
content varchar(255),
status bit
);
create table Categories(
id int primary key,
name nvarchar(30) unique not null,
keyword varchar(30),
description nvarchar(255),
status bit
);
create table Products(
id int primary key auto_increment,
name nvarchar(30) unique not null,
category_id int,
foreign key (category_id) references Categories(id),
image blob,
list_image varchar(200),
price double,
sale_price double,
description nvarchar(255),
keyword varchar(30),
content varchar(255),
status bit
);
create table Orders(
id int primary key,
customer_id int,
foreign key (customer_id) references Customer(id),
total double,
status bit
);
create table order_details(
id int primary key,
product_id int,
foreign key (product_id) references Products(id),
order_id int,
price double,
quantity int
);
create table Customers(
id int primary key,
name nvarchar(30),
address varchar(40),
phone int,
email varchar(36)
);
create table Services(
id int primary key,
name nvarchar(30),
summary text,
content varchar(255),
image blob,
order_by varchar(36),
status bit
);
create table Books(
id int primary key,
user_id int,
foreign key (user_id) references Users(id),
service_id int,
foreign key (service_id) references Services(id),
name nvarchar(30),
phone int,
date date
);
create table Users(
id int primary key
);
create table Comments(
id int primary key,
user_id int,
foreign key (user_id) references Users(id),
product_id int,
foreign key (product_id) references Products(id),
message nvarchar(255),
status bit
);
