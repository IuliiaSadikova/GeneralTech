create database students;
use students;

create table Students(
	id integer primary key auto_increment,
    name varchar(128) not null,
    age int);

insert into Students (name, age) 
values ("Анатолий", 29),
	   ("Олег", 25),
       ("Семён", 27),
       ("Олеся", 28),
       ("Ольга", 31),
       ("Иван", 22);
       
create table Teachers(
	id integer primary key auto_increment,
    name varchar(128) not null,
    age int);       

insert into Teachers (name, age) 
values ("Пётр", 39),
	   ("Максим", 35),
       ("Антон", 37),
       ("Всеволод", 38),
       ("Егор", 41),
       ("Светлана", 32);
       
create table Competencies(
	id integer primary key auto_increment,
    title varchar(128) not null);
    
insert into Competencies (title) 
values ("Математика"),
	   ("Информатика"),
       ("Программирование"),
       ("Графика");    
       
create table Teachers2Competencies(
	id integer primary key auto_increment,
    teacher_id int,
    competencies_id int);
    
insert into Teachers2Competencies (teacher_id, competencies_id) 
values (1, 1),
	   (2, 1),
       (2, 3),
       (3, 2),
       (4, 1),
       (5, 3);
       
create table Courses(
	id integer primary key auto_increment,
    teacher_id int,
    title varchar(128) not null,
    headman_id int);
    
insert into Courses (teacher_id, title, headman_id) 
values (1, "Алгебра логики ", 2),
	   (2, "Математическая статистика", 3),
       (4, "Высшая математика", 5),
       (5, "Javascript", 1),
       (5, "Базовый Python", 1);  
       
create table Students2Courses(
	id integer primary key auto_increment,
    student_id int,
    course_id int);  
    
insert into Students2Courses (student_id, course_id) 
values (1, 1),
	   (2, 1),
       (3, 2),
       (3, 3),
       (4, 5);       
       
select * from Students;
select * from Teachers;
select * from Competencies;
select * from Teachers2Competencies;
select * from Courses;
select * from Students2Courses;

-- 1) Вывести имена студентов и курсы, которые они проходят

select
	t1.name,
    t3.title
from Students t1
inner join Students2Courses t2
on t1.id=t2.student_id
inner join Courses t3
on t3.id=t2.course_id;

-- 2) Вывести имена всех преподавателей с их компетенциями

select
	t1.name,
    t3.title
from Teachers t1
inner join Teachers2Competencies t2
on t1.id=t2.teacher_id
inner join Competencies t3
on t3.id=t2.competencies_id;

-- 3) Найти преподавателя, у которого нет компетенций

select
	name
from Teachers
where id not in (
	select teacher_id from Teachers2Competencies
    );

-- 4) Найти имена студентов, которые не проходят ни один курс

select
	name
from Students
where id not in (
	select student_id from Students2Courses
    );

-- 5) Найти курсы, которые не посещает ни один студент

select
	title
from Courses
where id not in (
	select course_id from Students2Courses
    );    

-- 6) Найти компетенции, которых нет ни у одного преподавателя

select
	title
from Competencies
where id not in (
	select competencies_id from Teachers2Competencies
    );    

-- 7) Вывести название курса и имя старосты

select
	t1.title,
    t2.name
from Courses t1
inner join Students t2
on t2.id=t1.headman_id;

-- 8) Вывести имя студента и имена старост (headman), которые есть на курсах, которые он проходит

select
	s.name,
    hm.name as headman
from Students s
inner join Students2Courses sc
on s.id=sc.student_id
inner join Courses c
on c.id=sc.course_id
inner join Students hm
on c.headman_id=hm.id;
   

    

       

       
