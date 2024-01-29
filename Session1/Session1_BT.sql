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
drop table Banners;
create table Contacts(
id int primary key,
email varchar(36),
address varchar(40),
message nvarchar(255),
status bit
);
drop table Contacts;
create table Blogs(
id int primary key,
title varchar (30),
image blob,
content varchar(255),
status bit
);
drop table Blogs;
create table Abouts(
id int primary key,
title varchar (30),
image blob,
content varchar(255),
status bit
);
drop table Abouts;
create table Categories(
id int primary key,
name nvarchar(30) unique not null,
keyword varchar(30),
description nvarchar(255),
status bit
);
INSERT INTO Categories (id, name, keyword, description, status)
VALUES
    (1, 'Electronics', 'electronics', 'Category for electronic devices', 1),
    (2, 'Clothing', 'clothing', 'Category for clothing items', 1),
    (3, 'Books', 'books', 'Category for books and printed materials', 1),
    (4, 'Furniture', 'furniture', 'Category for home and office furniture', 0),
    (5, 'Toys', 'toys', 'Category for children''s toys and games', 1);
select * from Categories;
drop table Categories;
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
INSERT INTO Products (id, name, category_id, image, list_image, price, sale_price, description, keyword, content, status)
 VALUES 
 ('1', 'Smartphone X', 1, 'image_url', 'list_image_url', 500, 450, 'Description of Smartphone X', 'smartphone, tech', 'Product content goes here', 1),
 ('2', 'Laptop Y', 1, 'image_url', 'list_image_url', 800, NULL, 'Description of Laptop Y', 'laptop, tech', 'Product content goes here', 1),
 ('3', 'T-Shirt Z', 2, 'image_url', 'list_image_url', 20, NULL, 'Description of T-Shirt Z', 'clothing, fashion', 'Product content goes here', 1),
 ('4', 'Book A', 3, 'image_url', 'list_image_url', 15, NULL, 'Description of Book A', 'books, literature', 'Product content goes here', 1),
 ('5', 'Tablet Z', 1, 'tablet_image_url', 'tablet_list_image_url', 300, NULL, 'Description of Tablet Z', 'tablet, tech', 'Product content goes here', 1),
 ('6', 'Smartwatch Q', 1, 'smartwatch_image_url', 'smartwatch_list_image_url', 150, NULL, 'Description of Smartwatch Q', 'smartwatch, tech', 'Product content goes here', 1),
 ('7', 'Dress X', 2, 'dress_image_url', 'dress_list_image_url', 50, NULL, 'Description of Dress X', 'clothing, fashion', 'Product content goes here', 1),
 ('8', 'Jeans Y', 2, 'jeans_image_url', 'jeans_list_image_url', 40, NULL, 'Description of Jeans Y', 'clothing, fashion', 'Product content goes here', 1),
 ('9', 'Novel B', 3, 'novel_image_url', 'novel_list_image_url', 10, NULL, 'Description of Novel B', 'books, literature', 'Product content goes here', 1),
 ('10', 'Cookbook C', 3, 'cookbook_image_url', 'cookbook_list_image_url', 20, NULL, 'Description of Cookbook C', 'books, cooking', 'Product content goes here', 1),
 ('11', 'TV X', 1, 'tv_image_url', 'tv_list_image_url', 700, NULL, 'Description of TV X', 'electronics, tv', 'Product content goes here', 1),
 ('12', 'Headphones Y', 1, 'headphones_image_url', 'headphones_list_image_url', 100, NULL, 'Description of Headphones Y', 'electronics, headphones', 'Product content goes here', 1),
 ('13', 'Sweater Z', 2, 'sweater_image_url', 'sweater_list_image_url', 30, NULL, 'Description of Sweater Z', 'clothing, fashion', 'Product content goes here', 1),
 ('14', 'Shorts A', 2, 'shorts_image_url', 'shorts_list_image_url', 25, NULL, 'Description of Shorts A', 'clothing, fashion', 'Product content goes here', 1);
 select * from Products;
create table Orders(
id int primary key,
customer_id int,
foreign key (customer_id) references Customers(id),
total double,
status bit
);
INSERT INTO Orders (id, customer_id, total, status)
VALUES
    (1, 101, 150.00, 1),
    (2, 102, 75.00, 0),
    (3, 103, 200.00, 1),
    (4, 104, 50.00, 1),
    (5, 105, 120.00, 1);
select * from Orders;
create table order_details(
id int primary key,
product_id int,
foreign key (product_id) references Products(id),
order_id int,
foreign key (order_id) references Orders(id),
price double,
quantity int
);
INSERT INTO order_details (id, product_id, order_id, price, quantity)
VALUES
    (1, 1, 1, 50.00, 2),
    (2, 2, 1, 30.00, 1),
    (3, 3, 2, 80.00, 1),
    (4, 4, 3, 25.00, 3),
    (5, 5, 3, 120.00, 1);
select * from order_details;
create table Customers(
id int primary key,
name nvarchar(30),
address varchar(40),
phone double,
email varchar(36)
);
INSERT INTO Customers (id, name, address, phone, email)
VALUES
    (101, 'John Doe', '123 Main St', 1234567890, 'john@example.com'),
    (102, 'Jane Smith', '456 Elm St', 9876543210, 'jane@example.com'),
    (103, 'Michael Johnson', '789 Oak St', 4561237890, 'michael@example.com'),
    (104, 'Emily Davis', '101 Pine St', 7894561230, 'emily@example.com'),
    (105, 'Chris Wilson', '202 Maple St', 3216549870, 'chris@example.com');
select * from Customers;
drop table Customers;
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
-- Bài tập
-- 1. Hiển thị danh sách các hóa đơn bao gồm: Mã đơn hàng, Tên khách hàng, Tổng tiền, Trạng thái
SELECT o.id AS Order_ID, c.name AS Customer_Name, o.total AS Total_Amount, 
    CASE 
        WHEN o.status = 1 THEN 'Hoàn thành' 
        ELSE 'Chưa hoàn thành' 
    END AS Status
FROM Orders o
INNER JOIN Customers c ON o.customer_id = c.id;
-- 2. Hiển thị danh Danh sách khách hàng gồm: Mã KH, Tên KH, Tổng ĐH đã mua
SELECT c.id AS Customer_ID, c.name AS Customer_Name, COUNT(o.id) AS Total_Orders
FROM Customers c
LEFT JOIN Orders o ON c.id = o.customer_id
GROUP BY c.id, c.name;
-- 3. Hiển thị danh sách sản phẩm kèm số lượng đã bán gồm: Mã SP, Tên SP, Số lượng (đã bán)
SELECT p.id AS Product_ID, p.name AS Product_Name, SUM(od.quantity) AS Total_Sold
FROM Products p
LEFT JOIN order_details od ON p.id = od.product_id
GROUP BY p.id, p.name;
-- 4. Hiển thị đơn hàng mua nhiều hơn 2 sản phẩm
SELECT o.id AS Order_ID, c.name AS Customer_Name, COUNT(od.id) AS Total_Products
FROM Orders o
INNER JOIN Customers c ON o.customer_id = c.id
INNER JOIN order_details od ON o.id = od.order_id
GROUP BY o.id, c.name
HAVING COUNT(od.id) > 2;
-- 5. Hiển thị top 3 sản phẩm bán chạy nhất
SELECT p.id AS Product_ID, p.name AS Product_Name, SUM(od.quantity) AS Total_Sold
FROM Products p
INNER JOIN order_details od ON p.id = od.product_id
GROUP BY p.id, p.name
ORDER BY Total_Sold DESC
LIMIT 3;
-- 6. Hiển thị danh Danh sách khách hàng gồm: Mã KH, Tên KH, Tổng tiền đã mua
SELECT c.id AS Customer_ID, c.name AS Customer_Name, SUM(o.total) AS Total_Amount_Spent
FROM Customers c
LEFT JOIN Orders o ON c.id = o.customer_id
GROUP BY c.id, c.name;
