-- 1. Вывести зарплату сотрудника с именем ‘Lex’ и фамилией ‘De Haan'.
SELECT 
	salary
FROM employees
WHERE first_name = 'Lex' 
AND last_name = 'De Haan';

-- 2. Вывести всех сотрудников с jobid ‘FIACCOUNT’ и зарабатывающих меньше 8000. 
SELECT
	first_name, 
    last_name, 
    job_id, 
    salary
FROM employees
WHERE job_id = 'FI_ACCOUNT' 
AND salary < 8000;

-- 3. Вывести сотрудников, у которых в фамилии в середине слова встречаются сочетания ‘kk’ или ‘ll’. 
SELECT
	first_name, 
    last_name, 
    job_id, 
    salary
FROM employees
WHERE last_name like '%kk%'
OR last_name like '%ll%';

-- 4. Вывести сотрудников с commission_pct NULL.
SELECT
	first_name, 
    last_name, 
    salary, 
    commission_pct
FROM employees
WHERE commission_pct is null;
 
-- 5. Вывести всех сотрудников кроме тех, кто работает в департаментах 80 и 110.
SELECT
	first_name, 
    last_name, 
    salary, 
    department_id
FROM employees
WHERE department_id <> 80
AND department_id <> 110;

-- 6. Вывести сотрудников зарабатывающих от 5000 до 7000 (включая концы)
SELECT
	first_name, 
    last_name, 
    job_id, 
    salary
FROM employees
WHERE salary BETWEEN 5000 AND 7000;

-- ------------------------------------------------------------------------------------------------------

/*
Разделите самолеты на ближне-, средне- и дальнемагистральные. Ближнемагистральными будем считать самолеты, дальность полета которых > 1000 км и <= 2500 км. 
Среднемагистральными — с дальностью полета > 2500 км и <= 6000 км. Дальнемагистральными — с дальностью полета > 6000 км. В выборке должно быть два столбца, 
где в первом указана модель самолета. Во втором, category, — категория, со значениями short-haul, medium-haul, long-haul 
(ближне-, средне- и дальнемагистральные соответственно). Каждый самолет точно попадает ровно в одну категорию.
В выборке должны присутствовать два атрибута — model_name, category.
*/ 

SELECT
	model_name,
CASE 
	WHEN `range` BETWEEN 1000 AND 2500
		THEN 'short-haul'
    WHEN `range` BETWEEN 2500 AND 6000
		THEN 'medium-haul'
	WHEN `range` > 6000
		THEN 'long-haul'
	END as category
FROM airliners;

/*
Разделите самолеты на ближне-, средне- и дальнемагистральные. Ближнемагистральными будем считать самолеты, дальность полета которых > 1000 км и <= 2500 км. 
Среднемагистральными — с дальностью полета > 2500 км и <= 6000 км. Дальнемагистральными — с дальностью полета > 6000 км. 
В выборке должно быть два столбца, где в первом указана модель самолета. Во втором, category, — категория, со значениями short-haul, medium-haul, 
long-haul (ближне-, средне- и дальнемагистральные соответственно). Если максимальная дальность полета <= 1000 км или данных о дальности полета нет, 
в category выведите 'UNDEFINED'.
В выборке должны присутствовать два атрибута — model_name, category.
*/

SELECT
	model_name,
CASE 
	WHEN `range` BETWEEN 1000 AND 2500
		THEN 'short-haul'
    WHEN `range` BETWEEN 2500 AND 6000
		THEN 'medium-haul'
	WHEN `range` > 6000
		THEN 'long-haul'
	ELSE 'UNDEFINED'
	END as category
FROM airliners;



    