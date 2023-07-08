use shop;
select * from customers;
select * from orders;
select * from products;


-- 1) найдите имя и фамилию пользователей, у которых нет заказов

select
	name,
    lastname
from customers
where id not in (
	select
		customerid
		from orders
        );

-- 2) найдите название товаров, которые ни разу не заказывали

select
	title
from products
where id not in (
	select 
		productid
        from orders
        );

-- 3) найдите название товаров, которые ни разу не заказывали онлайн

select
	title
from products
where id not in (
	select 
		productid
        from orders
        where ordertype = "online"
        );
        
-- 4) найдите имя и фамилию покупателя, который сделал самый дорогой заказ
        
select
    c.name,
    c.lastname,
	max(o.product_count*p.price) as total_price
from orders o
inner join products p
on o.productid=p.id
inner join customers c
on c.id=o.customerid;

        
select
    c.name,
    c.lastname
from orders o
left join customers c
on c.id=o.customerid
where product_count = (
	select
		max(product_count) as total_price
	from (
		select    
			(o.product_count*p.price) as total_price
	from products
    ) p
    );
-- запуталась в этих вложениях(

