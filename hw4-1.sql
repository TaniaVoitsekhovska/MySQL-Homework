DROP DATABASE IF EXISTS library;
CREATE DATABASE library;
USE library;

CREATE TABLE category(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(45) NOT NULL
);

CREATE TABLE author(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(45) NOT NULL,
    surname VARCHAR(45) NOT NULL,
    email VARCHAR(50) NOT NULL,
    adress VARCHAR(70) NOT NULL,
    birthday DATE NOT NULL
);

CREATE TABLE book(
    id INT NOT NULL UNIQUE AUTO_INCREMENT,
    book_title VARCHAR(120) NOT NULL,
    description TEXT,
    isbn BIGINT NOT NULL,
    book_price DECIMAL(5,2) NOT NULL DEFAULT 0.00,
    category_id INT NOT NULL,
    FOREIGN KEY (category_id) references category(id)
);
CREATE TABLE library(
book_id INT NOT NULL,
author_id INT NOT NULL,
FOREIGN KEY (book_id) references book(id),
FOREIGN KEY (author_id) references author(id),
PRIMARY KEY (book_id,author_id)
);

INSERT INTO category(name)
VALUES
('Художня проза'),
('Бізнес і саморозвиток'),
('Дитячі книги для читання');

INSERT INTO author(name,surname,email,adress,birthday)
VALUES
('Богдан','Логвіненко','BogdanLogvinenko@gmail.com','Україна, м.Одеса, вул.Садова 11','1966-05-12'),
('Наталка','Сняданко','NatalkaSiadanko@gmail.com','Україна, м.Львів, вул.Садова 122','1991-01-22'),
('Ярослава','Зелинська-Джонсон','Jonson@gmail.com','Україна, м.Миколаїв, вул.Героїв УПА 31/55','1955-02-02'),
('Надійка','Гербіш','GrebishNadia@gmail.com','Україна, м.Київ, вул.Шевченка 144/22','1987-02-04');

INSERT INTO book (book_title,description,isbn,book_price,category_id)
VALUES
('Спадщина чотирьох господинь','Ця книжка — важливий спадок, що заслуговує того, аби його не втрачати. Рецепти страв, які готували та ділили за одним столом, є частиною нашого минулого. Й, вони, сподіваємося, житимуть і надалі — вже як частина майбутнього українських родин.',9786176795315,125.25,1),
('Нестерпна легкість буття','Легендарний роман одного із найвизначніших письменників сучасності Мілана Кундери, сповнений глибокого сенсу, із блискучими та грайливими роздумами і різноманітністю стилів; це книга, що надихає і змушує замислитися.',9786176797012,201.99,1),
('WAKE UP! (Прокидаємось!) або Як перестати жити на автопілоті','Ця книжка допоможе згадати, хто ми насправді, і завдяки цікавим експериментам кожен зможе наповнити своє життя справжньою радістю. Отже, прокидаємось!',9786176794394,399.99,2),
('Середня стать','У книжці розповідається про Калліопу Стефанідіс і три покоління греко-американської сім’ї Стефанідісів, кожне з яких має свої секрети. ',9786176794318,79.99,1),
('Мюнхгаузен. Правда про неправду','Зухвало і з шармом Флікс та Кіссель створюють швидку, гротескну й мудру оповідь про нові пригоди барона Мюнхгаузена у вигляді коміксу.',9786176794431,155.00,3);

INSERT INTO library (book_id,author_id)
VALUES
(1,2), (1,4), (2,3), (3,4), (5,1), (5,2), (5,3), (4,1), (4,3);