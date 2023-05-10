-- 6. найти учеников, у которых оценка больше 4
-- - найти учеников, у которых оценка не входит в диапазон от 3 до 4
-- - найти учеников, у которых имя начинается на И
-- - найти учеников, у которых оценка 2.2 или 3.1 или 4.7   

SELECT *
FROM students
WHERE avg_mark > 4;

SELECT *
FROM students
WHERE avg_mark NOT BETWEEN 3 AND 4;

SELECT *
FROM students
WHERE firstname LIKE 'И%';

SELECT *
FROM students
WHERE avg_mark = 2.2 OR avg_mark = 3.1 OR avg_mark = 4.7;

-- 7.Создать представление, которое содержит всех мужчин

CREATE VIEW m_students AS
	SELECT *
    FROM students
    WHERE gender = 'M';
    
SELECT *
FROM m_students;
  
-- 8. Создать представление, которое содержит всех женщин

CREATE VIEW f_students AS
	SELECT *
    FROM students
    WHERE gender = 'F';
    
SELECT *
FROM f_students;    

-- 9. Увеличить всем учащимся оценку в 10 раз

ALTER TABLE students
MODIFY COLUMN avg_mark float CHECK(avg_mark BETWEEN 0 and 100);

UPDATE students
SET avg_mark = avg_mark * 10;

SELECT *
FROM students;

-- 10.  Поменяйте у Олега Петрова фамилию на Сидоров

UPDATE students
SET lastname = 'Сидоров'
WHERE lastname LIKE 'Петров';

SELECT *
FROM students;

-- 11.  Для всех учеников, у которых оценка не больше 31 увеличить на 10  
  
UPDATE students
SET avg_mark = avg_mark + 10
WHERE avg_mark <= 31;  

SELECT *
FROM students;