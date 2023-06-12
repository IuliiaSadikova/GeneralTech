use hr;

select * from employees;
select * from departments;


-- Найти количество сотрудников в каждом департаменте. Вывести departmentid и employeescnt

select
	department_id,
    count(employee_id) as employees_cnt
from employees
where department_id is not null
group by department_id;

-- Найти количество сотрудников в каждом департаменте. Вывести departmentname и employeescnt

select
	t1.department_name,
    count(t2.employee_id) as employees_cnt
from  departments t1
inner join employees t2
on t1.department_id=t2.department_id
group by department_name;

-- Найти количество сотрудников у каждого менеджера. Вывести managerid и employeescnt

select
	manager_id,
    count(employee_id) as employees_cnt
from employees
where manager_id is not null
group by manager_id;

-- Найти количество сотрудников у каждого менеджера. Вывести firstname,  lastname и employees_cnt

select 
	employee_id,
	first_name,
    last_name,
    count(manager_id) as employees_cnt
from employees 
group by manager_id;

-- Найти максимальную зарплату в каждом департаменте. Вывести departmentid и maxsalary

select
	max(salary) as max_salary,
    department_id
from employees
where department_id is not null
group by department_id;

-- Найти сотрудников, у которых наибольшая зарплата в их департаменте

select 
	first_name,
    last_name,
    max(salary) as max_salary,
    department_id
from employees
where department_id is not null
group by department_id;



