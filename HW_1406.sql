create database shop;
use shop;

CREATE TABLE customers (
    id INT PRIMARY KEY AUTO_INCREMENT, 
    name VARCHAR(20),
    lastname VARCHAR(20),
    gender char(1) check(gender in ('f', 'm')),
    age integer
);

INSERT INTO customers (name, lastname, age, gender) VALUES ('Гайк', 'Инанц', 29, 'm');
INSERT INTO customers (name, lastname, age, gender) VALUES ('Максим', 'Грибов', 32, 'm');
INSERT INTO customers (name, lastname, age, gender) VALUES ('Антон', 'Куликов', 27, 'm');
INSERT INTO customers (name, lastname, age, gender) VALUES ('Юрий', 'Митрофанов', 30, 'm');
INSERT INTO customers (name, lastname, age, gender) VALUES ('Нелли', 'Ефремян', 25, 'f');
INSERT INTO customers (name, lastname, age, gender) VALUES ('Ольга', 'Степанова', 35, 'f');

CREATE TABLE orders (
    id INT PRIMARY KEY auto_increment, 
    customerid integer,
    productid integer,
    ordertype varchar(128),
    product_count integer
);

INSERT INTO orders (customerid, productid, ordertype, product_count) VALUES (1, 3, 'online', 3);
INSERT INTO orders (customerid, productid, ordertype, product_count) VALUES (1, 2, 'online', 5);
INSERT INTO orders (customerid, productid, ordertype, product_count) VALUES (3, 1, 'direct', 2);
INSERT INTO orders (customerid, productid, ordertype, product_count) VALUES (3, 4, 'direct', 6);
INSERT INTO orders (customerid, productid, ordertype, product_count) VALUES (3, 3, 'direct', 3);
INSERT INTO orders (customerid, productid, ordertype, product_count) VALUES (1, 3, 'online', 4);
INSERT INTO orders (customerid, productid, ordertype, product_count) VALUES (5, 7, 'online', 2);
INSERT INTO orders (customerid, productid, ordertype, product_count) VALUES (5, 9, 'online', 7);
INSERT INTO orders (customerid, productid, ordertype, product_count) VALUES (6, 5, 'direct', 4);

CREATE TABLE products (
    id INT PRIMARY KEY AUTO_INCREMENT, 
    title varchar(128),
    price numeric(8, 2)
);

INSERT INTO products (title, price) VALUES ('молоко', 70);
INSERT INTO products (title, price) VALUES ('колбаса', 230);
INSERT INTO products (title, price) VALUES ('хлопья', 150);
INSERT INTO products (title, price) VALUES ('хлеб', 30);
INSERT INTO products (title, price) VALUES ('масло', 120);
INSERT INTO products (title, price) VALUES ('чипсики', 60);
INSERT INTO products (title, price) VALUES ('шоколад', 70);
INSERT INTO products (title, price) VALUES ('кетчуп', 150);
INSERT INTO products (title, price) VALUES ('яблоко', 70);

select *
from customers;

select *
from orders;

select *
from products;

-- 1) вывести название продукта, который чаще всего встречается в заказах

select distinct
	p.title
from orders o
join products p
on p.id=o.productid
where o.productid = (
	select 
		max(total) as max
		from (
			select count(productid) as total
			from orders
			group by productid
			) o
);

-- 2) вывести название продукта, который покупают чаще всего 
-- (нужно посчитать общее количество купленных единиц)

select
	p.title
from orders o
join products p
on p.id=o.productid
where o.product_count = (
	select
			max(sum) as max_sum
		from (
			select sum(product_count) as sum
		from orders
		group by productid
		) o
);

-- не поняла, в чём тут проблема, ничего не выводится(((

/** select
	max(sum) as max_sum
from (
	select
		sum(product_count) as sum
from orders
group by productid
) o;

select 
	productid,
	sum(product_count)
from orders
group by productid;
*/

-- 3) вывести общую выручку магазина. Сумма всех купленных единиц товара.

select
	sum(p.price*o.product_count) as sum_of_all_ord
from orders o
join products p
on p.id=o.productid;

-- 4) определить сумму выручки за онлайн продажи (online) и за продажи в магазине (direct)

select
	sum(p.price*o.product_count) as sum_of_all_ord,
    o.ordertype
from orders o
join products p
on p.id=o.productid
group by o.ordertype;

