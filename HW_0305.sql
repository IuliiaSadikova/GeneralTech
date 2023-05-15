use hr;

/*Найти департаменты в которых есть работники, зарабатывающие больше 10 000. 
В результате выборки формируются два поля (department_id и поле со значениями 1 или 0) (использовать метод max)
*/ 

/*Найти департаменты в которых все работники зарабатывают больше 10 000. 
В результате выборки формируются два поля (department_id и поле со значениями 1 или 0)  (использовать метод min)
*/

-- я не совсем поняла, что в данном случае делает MIN или MAX, поэтому не стала использовать то, что непонятно.

SELECT 
	department_id,
    CASE
		WHEN salary > 10000
        THEN 1
	ELSE 0
END
AS salary_id	
FROM employees
GROUP BY department_id;


-- Отсортировать сотрудников по фамилии в алфавитном порядке

SELECT *
FROM employees
ORDER BY last_name;

-- Отсортировать сотрудников по зарплате - от самой большой зарплаты до самой маленькой

SELECT *
FROM employees
ORDER BY salary DESC;

-- Вывести сотрудников, работающих в департаментах с id 60, 90 и 110, отсортированными в алфавитном порядке по фамилии (оператор in).

SELECT *
FROM employees
WHERE department_id IN(60, 90, 110)
ORDER BY last_name;

-- Вывести сотрудников с jobid STCLERK, отсортированными по зарплате - от самой большой зарплаты до самой маленькой.

SELECT *
FROM employees
WHERE job_id LIKE 'ST_CLERK'
ORDER BY salary DESC;

-- Вывести сотрудников, чьи имена начинаются на букву D и отсортировать их в алфавитном порядке по фамилии

SELECT *
FROM employees
WHERE first_name LIKE 'D%'
ORDER BY last_name;

-- --------------------------------------------------------------------------------------------------------
use airplanes;


/*Выведите данные о билетах разной ценовой категории. Среди билетов экономкласса (Economy) добавьте в выборку 
билеты с ценой от 10 000 до 11 000 включительно. Среди билетов комфорт-класса (PremiumEconomy) — 
билеты с ценой от 20 000 до 30 000 включительно. Среди билетов бизнес-класса (Business) — 
с ценой строго больше 100 000. В решении необходимо использовать оператор CASE.
В выборке должны присутствовать три атрибута — id, service_class, price
*/

SELECT 
	id,
    price,
		CASE 
			WHEN price BETWEEN 10000 and 11000
				THEN 'Economy'
            WHEN price BETWEEN 20000 and 30000
				THEN 'PremiumEconomy'
			WHEN price > 100000
				THEN 'Business'
			ELSE '-'
		END AS service_class
FROM tickets;

/* Разделите самолеты на три класса по возрасту. Если самолет произведен раньше 2000 года, то отнесите его к классу 'Old'. 
Если самолет произведен между 2000 и 2010 годами включительно, то отнесите его к классу 'Mid'. 
Более новые самолеты отнесите к классу 'New'. Исключите из выборки дальнемагистральные самолеты с максимальной дальностью полета больше 10000 км. 
Отсортируйте выборку по классу возраста в порядке возрастания.
В выборке должны присутствовать два атрибута — side_number, age.
*/

SELECT 
	side_number,
    CASE 
		WHEN production_year < 2000
			THEN 'Old'
		WHEN production_year BETWEEN 2000 and 2010
			THEN 'Mid'
		WHEN production_year > 2010
				THEN 'New'
		END AS age
FROM airliners
WHERE `range` < 10000
ORDER BY age;

SELECT *
FROM airliners;

/* Руководство авиакомпании снизило цены на билеты рейсов LL4S1G8PQW, 0SE4S0HRRU и JQF04Q8I9G. 
Скидка на билет экономкласса (Economy) составила 15%, на билет бизнес-класса (Business) — 10%, 
а на билет комфорт-класса (PremiumEconomy) — 20%. Определите цену билета в каждом сегменте с учетом скидки.
В выборке должны присутствовать три атрибута — id, tripid, newprice.
*/

SELECT 
	id,
    trip_id,
    price,
    CASE
		WHEN service_class = 'Economy'
			THEN price * 0.85
		WHEN service_class = 'PremiumEconomy'
			THEN price * 0.8
		WHEN service_class = 'Business'
			THEN price * 0.9
		END AS new_price
FROM tickets
WHERE trip_id = 'LL4S1G8PQW' OR trip_id = '0SE4S0HRRU' OR trip_id = 'JQF04Q8I9G';

-- --------------------------------------------------------------------------------------------------------------------------------

use lesson3_0305;


-- Создайте таблицу goods (id, title, quantity)

create table goods (
	id integer primary key auto_increment,
    title varchar(200),
    quantity int
    );


-- Добавьте данные
INSERT INTO goods (title, quantity)
	VALUES ('pasta barilla', 150),
		   ('mozarella galbani', 103),
           ('pesto barilla', 78),
           ('mortadella milbona', 30),
           ('grana padano', 50);

-- Добавьте поле price (integer) со значением по умолчанию 0 (надо покопатся))

ALTER TABLE goods
ADD COLUMN price integer DEFAULT 0;

-- Проверьте содержимое таблицы.

SELECT *
FROM goods;

-- Сделайте удаление, изменение, добавление полей в таблице

SET SQL_SAFE_UPDATES=0;
UPDATE goods
SET price = 5
WHERE title LIKE 'mortadella%';

ALTER TABLE goods
ADD COLUMN weight i;

UPDATE goods
SET weight = 90.5
WHERE id = 2 OR id = 4;

ALTER TABLE goods
DROP COLUMN price;

ALTER TABLE goods
DROP COLUMN weight;

-- Удалите таблицу

DROP TABLE IF EXISTS goods;

-- Заново создайте, добавьте данные и на ее основе создайте новую таблицу

create table goods (
	id integer primary key auto_increment,
    title varchar(200),
    quantity int
    );
    
INSERT INTO goods (title, quantity)
	VALUES ('pasta barilla', 150),
		   ('mozarella galbani', 103),
           ('pesto barilla', 78),
           ('mortadella milbona', 30),
           ('grana padano', 50);

CREATE TABLE vegan_goods AS 
	SELECT *
	FROM goods
    WHERE title <> 'mortadella milbona';

SELECT *
FROM vegan_goods;
    



















