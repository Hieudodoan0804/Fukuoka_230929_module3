-- DDL (Data Defintion Language)
-- Tạo mới CSDL
create database ra_fukuoka;
-- Chọn CSDL để truy vấn
use ra_fukuoka;
-- Tạo bảng trong CSDL
create table categories(
id varchar(36) primary key,
name varchar(250) unique not null,
status bit default 1
);
create table products(
	id varchar(36) primary key,
    name varchar(255) not null unique,
    categoryId varchar(36) not null,
    price int,
    constraint chk_products_price check(price > 1000),
    `description` nvarchar(4000) default 'Mô tả',
    status bit,
    foreign key (categoryId) references categories(id)
);
-- xoá bảng
drop table categories;
drop table products;
-- cập nhật bảng
alter table categories 
	modify column name varchar(100);
alter table categories
	drop column name;
alter table categories
	add column name varchar(250) not null;
    
-- DML (Data Manipulation Language)
-- thêm mới dữ liệu
insert into categories values(uuid(), 'First category', 1);
-- truy vấn dữ liệu
select * from categories;
-- cập nhật cơ sở dữ liệu
update categories
	set name = 'New category'
    where id = '14373122-bab6-11ee-9d88-88b111677266';
-- xóa dữ liệu
delete from categories ;
-- where name = 'Update category';
insert into products(id,name,price,categoryId,status) values(uuid(),'Tivi Sony', 500, '82ebe428-babe-11ee-9d88-88b111677266', 1);
-- 82ebe428-babe-11ee-9d88-88b111677266
-- 98f7d8ac-babe-11ee-9d88-88b111677266
select * from products;
