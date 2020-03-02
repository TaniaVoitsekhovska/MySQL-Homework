DROP DATABASE IF EXISTS study;
CREATE DATABASE study;
USE study;

CREATE TABLE universities(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(70) NOT NULL UNIQUE
);
CREATE TABLE university(
	id INT NOT NULL UNIQUE AUTO_INCREMENT,
    university_id INT NOT NULL,
    faculty_id INT NOT NULL,
    PRIMARY KEY (university_id,faculty_id)
);
CREATE TABLE faculty(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(70) NOT NULL
);
CREATE TABLE subjects(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(45) NOT NULL UNIQUE
);

CREATE TABLE lecturer(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(45) NOT NULL,
    surname VARCHAR(45) NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE,
    birthday DATE NOT NULL,
    phone_number BIGINT NOT NULL UNIQUE
);
CREATE TABLE student(
	id INT NOT NULL UNIQUE AUTO_INCREMENT,
	name VARCHAR(45) NOT NULL,
    surname VARCHAR(45) NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE,
    birthday DATE NOT NULL,
    phone_number BIGINT NOT NULL UNIQUE,
    university_id INT NOT NULL,
    faculty_id INT NOT NULL,
    PRIMARY KEY (name,surname,email,university_id,faculty_id)    
);
CREATE TABLE marks(
id INT NOT NULL UNIQUE AUTO_INCREMENT,
student_id INT NOT NULL,
faculty_id INT NOT NULL,
subject_id INT NOT NULL,
lecturer_id INT NOT NULL,
number_of_attempts TINYINT NOT NULL,
mark TINYINT NOT NULL,
PRIMARY KEY (student_id,faculty_id,subject_id,lecturer_id,number_of_attempts,mark)
);

ALTER TABLE university add FOREIGN KEY (university_id) references universities(id);
ALTER TABLE university add FOREIGN KEY (faculty_id) references faculty(id);
ALTER TABLE student add FOREIGN KEY (university_id) references universities(id);
ALTER TABLE student add FOREIGN KEY (faculty_id) references faculty(id);
ALTER TABLE marks add FOREIGN KEY (student_id) references student(id);
ALTER TABLE marks add FOREIGN KEY (faculty_id) references faculty(id);
ALTER TABLE marks add FOREIGN KEY (subject_id) references subjects(id);
ALTER TABLE marks add FOREIGN KEY (lecturer_id) references lecturer(id);

INSERT INTO universities(name)
VALUES 
('Львівський національний університет ім. Франка (ЛНУ)'),
('Національний університет «Львівська політехніка» (НУ «ЛП»)'),
('Львівський державний університет внутрішніх справ (ЛьвДУВС)'),
('Львівська філія Європейського університету');

 INSERT INTO faculty(name)
 VALUES
 ('Кібербезпека'),
 ('Комп’ютерні науки'),
 ('Публічне управління та адміністрування'),
 ('Фінанси, банківська справа та страхування'),
 ('Інформаційні системи та технології'),
 ('Облік і оподаткування'),
 ('Економіка'),
 ('Прикладна математика'),
 ('Міжнародні відносини, суспільні комунікації та регіональні студії'),
 ('Міжнародні економічні відносини');
 
INSERT INTO university(university_id,faculty_id)
VALUES (1,1),(1,2),(1,3),(2,1),(2,4),(2,7),(3,2),(3,5),(4,1),(4,8),(4,9);

INSERT INTO subjects(name)
VALUES
 ('Вища математика'),
 ('Основи програмування'),
 ('Етика і естетика'),
 ('Соціологія'),
 ('Бухгалтерський облік'),
 ('Макроекономіка'),
 ('Мікроекономіка'),
 ('Фізична культура'),
 ('Аудит'); 
 
INSERT INTO lecturer(name,surname,email,birthday,phone_number)
VALUES
('Тарас', 'Олійник','taras@gmail.com','1986-03-03',380970776523),
 ('Оксана', 'Горна','gorna@gmail.com','1977-12-01',380500786523),
 ('Орест', 'Коваль','koval@gmail.com','1971-08-01',380970774523),
 ('Олег', 'Рудницький','oleh@gmail.com','1969-03-25',380688716533),
 ('Ірина', 'Вагнер','vagner@gmail.com','1986-09-01',380961226523),
 ('Тарас', 'Закалюк','taras81@gmail.com','1981-11-03',380974577652);
  
INSERT INTO student(name,surname,email,birthday,phone_number,university_id,faculty_id)
VALUES
('Тарас', 'Гончар','taras@gmail.com','2000-03-03',380971236523,4,1),
 ('Олена', 'Брик','brick@gmail.com','2001-12-01',380507776523,1,2),
 ('Наталія', 'Коваль','koval99@gmail.com','1999-08-01',380970774523,3,2),
 ('Віктор', 'Рудницький','viktor02@gmail.com','2002-03-25',380684526533,1,3),
 ('Ірина', 'Жміковська','ira2001@gmail.com','2001-09-01',380681228529,3,5),
 ('Тарас', 'Бойків','taras2001@gmail.com','2001-11-03',380504577652,4,9);
 
 INSERT INTO marks (student_id,faculty_id,subject_id,lecturer_id,number_of_attempts,mark)
 VALUES
 (1,1,1,3,1,5), (1,1,4,4,2,5), (3,2,5,6,1,3), (4,3,1,3,1,5), (4,3,2,5,1,4), (2,2,6,3,3,2), (6,9,7,1,1,4), (5,5,7,1,2,5);
 
 
 SELECT
 universities.name as University,
 faculty.name as Faculty 
 FROM university
 JOIN universities ON university_id=universities.id
 JOIN faculty ON faculty_id=faculty.id
 ORDER BY universities.name;
 
  SELECT
	student.name,
	student.surname,
    student.email,
    student.birthday,
    student.phone_number, 
	universities.name as University,
	faculty.name as Faculty 
 FROM student
 JOIN universities ON university_id=universities.id
 JOIN faculty ON faculty_id=faculty.id
 ORDER BY student.surname;
 
  SELECT
	student.name,
	student.surname,
    student.email,
    student.birthday,
    student.phone_number, 
	universities.name as University,
	faculty.name as Faculty 
 FROM student
 JOIN universities ON university_id=universities.id
 JOIN faculty ON faculty_id=faculty.id
 WHERE student.birthday LIKE '2001%'
 ORDER BY student.surname;
 
 SELECT
	universities.name as University,
    faculty.name as Faculty, 
	student.name,
	student.surname,
    subjects.name,
	marks.number_of_attempts,
    marks.mark
 FROM marks
 JOIN student ON student_id=student.id
 JOIN universities ON university_id=universities.id
 JOIN faculty ON marks.faculty_id=faculty.id
 JOIN subjects ON subject_id=subjects.id
 JOIN lecturer ON lecturer_id=lecturer.id
 ORDER BY universities.name;
 
 SELECT
	universities.name as University,
    faculty.name as Faculty, 
	student.name,
	student.surname,
    subjects.name,
	marks.number_of_attempts,
    marks.mark
 FROM marks
 JOIN student ON student_id=student.id
 JOIN universities ON university_id=universities.id
 JOIN faculty ON marks.faculty_id=faculty.id
 JOIN subjects ON subject_id=subjects.id
 JOIN lecturer ON lecturer_id=lecturer.id
 WHERE marks.number_of_attempts > 1
 ORDER BY universities.name;
 
 
 