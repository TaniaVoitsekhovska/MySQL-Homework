DROP DATABASE IF EXISTS library;
CREATE DATABASE library char set utf8;
USE library;


CREATE TABLE category(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(45) NOT NULL
);

CREATE TABLE book(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    book_title VARCHAR(120) NOT NULL,
    description TEXT,
	category_id INT NOT NULL,
	FOREIGN KEY (category_id) references category(id),
    publication_date DATE NOT NULL DEFAULT '2018-01-01',
    isbn BIGINT NOT NULL UNIQUE,
    number_of_pages INT NOT NULL,
    book_price DECIMAL(5,2) NOT NULL DEFAULT 0.00
);

CREATE TABLE author(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	author_name VARCHAR(45) NOT NULL,
    author_surname VARCHAR(45) NOT NULL,
    author_email VARCHAR(50) NOT NULL,
    author_age TINYINT NOT NULL,
    author_birthday DATE NOT NULL
);

CREATE TABLE awards(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(45) NOT NULL
);

CREATE TABLE library(
id INT NOT NULL UNIQUE AUTO_INCREMENT,
book_id INT NOT NULL,
author_id INT NOT NULL,
author_awards_id INT DEFAULT NULL,
FOREIGN KEY (book_id) references book(id),
FOREIGN KEY (author_id) references author(id),
FOREIGN KEY (author_awards_id) references awards(id),
PRIMARY KEY (book_id,author_id)
);

INSERT INTO category(name)
VALUES
('Художня проза'),
('Бізнес і саморозвиток'),
('Ілюстровані історії та казки'),
('Книги для підлітків'),
('Альбоми та арт-буки'),
('Кулінарія'),
('Коротка проза та есеїстика'),
('Дитячі книги для читання');

INSERT INTO awards(name)
VALUES
('НАЙКРАЩІ КНИЖКИ ФОРУМУ ВИДАВЦІВ–2014'),
('НАЙКРАЩІ КНИЖКИ ФОРУМУ ВИДАВЦІВ–2015'),
('НАЙКРАЩІ КНИЖКИ ФОРУМУ ВИДАВЦІВ–2017'),
('Статуеткa Букерівської премії'),
('Пулітцерівська премія 2017'),
('Пулітцерівська премія 2018'),
('Пулітцерівська премія 2019'),
('НАЙКРАЩІ КНИЖКИ ФОРУМУ ВИДАВЦІВ–2017'),
('НАЙКРАЩІ КНИЖКИ ФОРУМУ ВИДАВЦІВ–2018'),
('НАЙКРАЩІ КНИЖКИ ФОРУМУ ВИДАВЦІВ–2019');

INSERT INTO author(author_name, author_surname, author_email, author_age, author_birthday)
VALUES
('Том','Флетчер','TomFlatcher@gmail.com',42,'1978-01-25'),
('Надійка','Гербіш','GrebishNadia@gmail.com',33,'1987-02-04'),
('Саллі','Ґрін','SalliGrin@gmail.com',55,'1964-12-22'),
('Шарлотте','Кернер','kerner@gmail.com',42,'1977-08-01'),
('Рімантас','Кміта','Kmita@gmail.com',33,'1986-01-27'),
('Фінн-Олє','Гайнріх','Gaynrikh@gmail.com',47,'1973-01-11'),
('Андреас','Штайнгьофель','Andreas@gmail.com',27,'1992-09-25'),
('Джеффрі','Євгенідіс','Jeffrey@gmail.com',38,'1981-07-05'),
('Джоанна','Басфор','basphor@gmail.com',34,'1985-07-29'),
('Наталка','Сняданко','NatalkaSiadanko@gmail.com',29,'1991-01-22'),
('Стівен','Сільбіґер','StevenSilbiger@gmail.com',45,'1975-01-02'),
('Арундаті','Рой','ArundatyRoi@gmail.com',39,'1981-02-01'),
('Амелі','Нотомб','NotombAmeli@gmail.com',28,'1991-11-01'),
('Богдан','Логвіненко','BogdanLogvinenko@gmail.com',53,'1966-05-12'),
('Мадлен','Пакетт','PukkatMadlen@gmail.com',38,'1982-01-31'),
('Кріс','Барез-Браун','BraunChris@gmail.com',34,'1986-01-01'),
('Ірина','Савка','IrynaSavka@gmail.com',31,'1988-05-25'),
('Елізабет','Ґілберт','Gilber@gmail.com',41,'1978-06-02');

INSERT INTO book (book_title, description,category_id, publication_date, isbn, number_of_pages,book_price)
    VALUES
    ('Різдвозавр','У вас у руках  найдивовижніша і найнеймовірніша різдвяна історія, яку тільки можна собі уявити. Хлопчик Вільям просить у Санти на Різдво динозавра і навіть не підозрює, чим обернеться його прохання. Гортаючи сторінки цієї веселої динамічної пригодницької книжки британського письменника і музиканта Тома Флетчера, ви довідаєтеся, хто допомагає Санті на Північному полюсі і хто намагається вполювати північних оленів, як з ненависті народжується дружба і чому містер Трандл понад усі свята любить Різдво. І, звісно, познайомитеся з найфантастичнішим книжковим героєм – Різдвозавром.',8,'2018-01-22',9786176796091,384,77.38),
    ('Одного разу на Різдво','У цій дивовижно світлій та домашній казці живе справжній дух Різдва. Родина їжачків - тато, мама та троє їхніх діток - не лише разом готуються до свята, переказують історію про народження Ісуса, а й приймають несподіваних гостей - двох маленьких ховрашат, які заблукали у лісі. Усі разом вони вчаться бути мудрими, розважливими і відкривати серця для доброти.',3,'2014-08-03',9786176791041,36,125.25),
    ('Світлокопія','У романі авторка описує недалеке майбутнє, де клонування людей стає можливим. Геніальна і самозакохана композиторка та піаністка Іріс Зеллін, довідавшись про свою невиліковну хворобу, просить клонувати її, бо хоче народити не просто дитину, а свою ідеальну копію. Та чи народжена дівчинка Сірі, від імені якої ведеться розповідь, — це лише точне віддзеркалення геніальної матері, чи особистість з власними емоціями, почуттями і прагненнями? Хто чи що таке клон? Чи є у нього душа чи це лише світлокопія без власної волі і бажань? Та чи має право «оригінал» вимагати, щоб клон проживав його, а не своє життя? Це психологічний і сповнений внутрішньої динаміки роман про майбутні відкриття, до яких вже варто готуватися, про питання біоетики, авторитаризм батьків та одвічне протистояння поколінь.',4,'2018-09-22',9786176796350,176,211.95),
    ('Напівзагублений','Натанові досі лише сімнадцять, і його самого це дивує, адже почувається він на всі сто сімнадцять. Він мусив убити свого батька та з’їсти його серце, і тепер хлопець має багато нових Дарів, які треба опанувати. Це важко, та ще важче — жити з жахливим спогадом, тягарем провини та лютою ненавистю до тієї, котра в усьому винна. Хлопець от-от загубиться серед моторошного минулого, кривавої реальності та непевного майбутнього. Аж ось у його невеселому житті з’являється ніжне кохання, що тримає юнака при тямі та веде до світла. Чи вдасться Натанові втілити свою мрію про спокійне, сповнене любові життя після війни?',4,'2016-05-23',9786176792765,336,55.99),
    ('Хроніки Південного','«Хроніки Південного» — молодіжний роман литовського письменника Рімантаса Кміти, в якому йдеться про життя шяуляйського старшокласника в 1990-х роках. Це дуже щира й дотепна розповідь головного героя, який виростає від бажання «бути як усі» до того, щоб не боятися бути унікальним. ',4,default,9786176796688,384,255.55),
    ('Руки розбійника','«Руки розбійника» — книжка про велику силу зв’язків, які лю­дина набуває за життя, іноді навіть всупереч власній волі. Їх складно змінити і дуже легко втратити, коли вже думаєш, що вони з тобою назавжди.',4,'2018-09-01',9786176795407,240,default),
    ('Середина світ','Сімнадцятирічний Філ намагається знайти своє місце серед вихору людських дивацтв. Він шукає порозуміння з ексцентричною мамою та відлюдькуватою сестрою-близнючкою, мріє дізнатися бодай щось про свого батька, закохується у нового загадкового однокласника, досліджує «чорні діри» власної душі та змалечку чинить опір «маленьким людям».',4,'2016-03-22',9786176792246,432,311.75),
    ('Середня стать','У книжці розповідається про Калліопу Стефанідіс і три покоління греко-американської сім’ї Стефанідісів, кожне з яких має свої секрети',1,'2018-10-11',9786176794318,704,199.99),
    ('Охайні прописи ерцгерцога Вільгельма','У центрі нового роману Наталки Сняданко особиста історія одного з найекстравагантніших членів імператорської родини Габс­бурґів — Вільгельма, більше відомого в Україні за бойовим псевдонімом  Василь Вишиваний. У романі його українську ідентичність розширено уявною — ймовірною — частиною біографії.',1,default,9786176794462,544,99.99),
    ('Різдво Джоанни','Чудова нова розмальовка для дорослих, створена спеціально для радісного періоду святкування Різдва.',5,'2017-11-11',9786176794646,80,101.50),
    ('Місто дівча','Це інтригуючий роман про жіночу сексуальність і свободу, про відвагу бути собою і право жити так, як тобі хочеться. А ще — історія дуже незвичайного кохання, на яке наклала свою тінь війна, та справжньої дружби, яку нелегко знайти, зрозуміти та оцінити, особливо в такому непростому і мінливому місті, як Нью-Йорк.',1,default,9786176797128,536,81.65),
    ('МВА за 10 днів','Тут знайдете інструменти успішного ведення бізнесу, яких навчають у найкращих бізнес-школах світу.',2,'2019-12-11',9786176795933,528,89.99),
    ('Бог Дрібниць','Події розгортаються в південноіндійському штаті Керала, у мальовничому, але й грузькому світі невеликого містечка на берегах могутньої ріки. У світі каст, традицій, комуністичного руху, занедбаної краси та понівечених людських доль. На тому строкатому тлі Амму, розлучена молода матір двох близнюків, Рахелі та Ести, повернулася до батьківського дому і якось уночі покохала чоловіка, якого її діти любили удень. І порушила основоположні закони функціонування тамтешньої громади. І була покарана, разом зі своїми дітьми.',1,default,9786176792772,432,55.99),
    ('Ukraїner. Ukrainian Insider','In this book we feature the most striking and memorable moments of our exploration as we intend to share with the world many unique places within Ukraine and the stories of the remarkable Ukrainians who live there. Evocative photography both showcases these stories and reveal Ukraine as authentic, surprising, and exciting country.',5,'2019-09-10',9786176797319,320,131.99),
    ('Мистецтво стратегії. Путівник до успіху в житті та бізнесі від експертів теорії гри','Книжка для тих, хто хоче досягти більшого у бізнесі та житті, використовуючи науково доведені стратегії, а також для тих, хто захоплюється математикою і теорією ігор.',2,default,9786176793625,608,269.99),
    ('Нестерпна легкість буття','Легендарний роман одного із найвизначніших письменників сучасності Мілана Кундери, сповнений глибокого сенсу, із блискучими та грайливими роздумами і різноманітністю стилів; це книга, що надихає і змушує замислитися.',1,'2019-02-06',9786176797012,320,131.95),
    ('Токійська наречена','Амелі приїздить у Японію, щоб пізнати культуру цієї країни та вивчити японську мову. Рінрі — японець, студент факультету французької філології. Вони обоє — немов люди із різних світів, але Рінрі закохується в цю дивну дівчину, таку близьку й далеку водночас. Амелі має мрію: зійти на Фудзіяму і зустріти на вершині цієї гори перші промені ранкової зорі. ',1,default,9786176795728,160,89.99),
    ('Wine Folly. Усе, що треба знати про вино','Скільки таємниць ховається у пляшці вина? Як з ним поводитися, подавати, декантувати, дегус­тувати, а з чим найкраще смакувати? Як залежить смак від клімату країни? Скільки відтінків кольорів і смаків приховує вино? І чи знали ви, що Совіньйон Блан може пахнути свіжоскошеною травою і чому в Шардоне з’являються нотки вершкового масла? Про все це у книжці «Wine Folly.',6,'2018-02-25',9786176795308,240,109.99),
    ('Шипшинове намисто','Герої цих новел — прості звичайні люди, зі складними, часто поламаними долями і зраненими душами. Їхні історії нанизуються одна на одну і творять справдешнє шипшинове намисто — червоного кольору кохання, з гострими колючками болю, розчарування, втрати. У цих новелах так багато правди життя, як у самому житті. І стільки ж любові до людини.',7,default,9786176793243,160,65.50),
    ('Спадщина чотирьох господинь','Ця книжка — важливий спадок, що заслуговує того, аби його не втрачати. Рецепти страв, які готували та ділили за одним столом, є частиною нашого минулого. Й, вони, сподіваємося, житимуть і надалі — вже як частина майбутнього українських родин.',6,'1999-08-25',9786176795315,256,135.20),
    ('Мюнхгаузен. Правда про неправду','Зухвало і з шармом Флікс та Кіссель створюють швидку, гротескну й мудру оповідь про нові пригоди барона Мюнхгаузена у вигляді коміксу.',5,'2017-06-06',9786176794431,192,66.30),
    ('Шлях до фінансової свободи. Bаш перший мільйон за сім років','Мрієте стати мільйонером за 7 років? Схоже, це цілком реально, варто лише почати вчитися фінансової грамотності, яка хоч і непроста, але цікава наука.',2,default,9786176796541,344,19.60),
    ('Правда','Пориньте у карколомні пригоди Вільяма де Ворда, засновника першої у Дискосвіті газети «Анк-морпоркський Час». Де Вордові доведеться експериментувати, боротися з конкурентом-таблоїдом та його вигадками, наживати впливових ворогів та створювати перші журналістські стандарти.',1,'2017-03-23',9786176794455,464,78.25),
    ('Щоденник Бріджит Джонс','Ця книжка — чудова нагода посміятися, розчулитися, а може, навіть вигукнути: «Бріджит Джонс — це я!».',1,'2017-03-08',9786176793694,432,132.50),
    ('WAKE UP! (Прокидаємось!) або Як перестати жити на автопілоті','Ця книжка допоможе згадати, хто ми насправді, і завдяки цікавим експериментам кожен зможе наповнити своє життя справжньою радістю. Отже, прокидаємось!',2,'2017-10-10',9786176794394,304,366.66);
    
    INSERT INTO library (book_id,author_id,author_awards_id)
VALUES
(1,7,default), (1,8,default), (2,8,1), (3,2,2),
(3,6,2), (3,10,2), (4,10,3), (5,9,default),
(5,1,default), (6,1,6), (7,5,8), (8,1,default),
(8,4,4), (9,5,default), (9,13,default), (9,3,default),
(10,11,2), (11,6,default), (12,6,default), (13,6,7),
(14,1,5), (14,17,5), (15,12,8), (15,11,8),
(16,13,6), (17,14,default), (18,3,1), (19,4,default),
(19,17,default), (20,16,7), (21,15,default), (21,18,default),
(22,3,2), (23,5,default), (23,17,default), (23,8,default),
(24,9,2), (25,14,default), (25,18,default);

/*SELECT * FROM book;
SELECT * FROM book WHERE id = 5 OR id = 10 OR id = 13;
SELECT * FROM book WHERE number_of_pages > 150;
SELECT * FROM book WHERE author_age > 30;
SELECT * FROM book WHERE author_awards IS NULL;
SELECT * FROM book WHERE author_email = 'Kmita@gmail.com';
SELECT * FROM book WHERE isbn = 9786176794646;
SELECT * FROM book WHERE category = 'Художня проза';
SELECT * FROM book WHERE number_of_pages > 200 AND author_age > 25;
SELECT * FROM book WHERE category = 'Бізнес і саморозвиток' OR category = 'Кулінарія';
SELECT * FROM book ORDER BY book_title ASC;
SELECT * FROM book ORDER BY author_email ASC;
SELECT * FROM book ORDER BY number_of_pages DESC;
SELECT DISTINCT category FROM book;
SELECT DISTINCT author_name FROM book;
SELECT * FROM book WHERE publication_date > '2000-01-01';
SELECT * FROM book WHERE publication_date < '2010-01-01';

SELECT * FROM book;
SET sql_safe_updates = 0;
UPDATE book SET author_surname='Тетчер' WHERE author_surname='Флетчер';
SET sql_safe_updates = 1;
UPDATE book SET author_surname='Блікс' WHERE id=23;
SELECT COUNT(*) as number_of_books FROM book  WHERE author_awards IS NOT NULL;

SELECT id, book_title, category, author_name, author_surname, number_of_pages
FROM book
WHERE number_of_pages = (SELECT MIN(number_of_pages) FROM book);

SELECT MAX(number_of_pages) as Max_number_of_pages FROM book;
SELECT ROUND(AVG(book_price), 2) as average_price FROM book;
SELECT SUM(book_price) as total_cost_of_books FROM book WHERE category = 'Художня проза';
SELECT MIN(book_price) as lowest_book_price FROM book;

SELECT id, book_title, category, author_name, author_surname, number_of_pages
FROM book
WHERE book_price = (SELECT MIN(book_price) FROM book);

SELECT id, book_title, ROUND(book_price, 4) as rounded_book_price FROM book ORDER BY book_title;
SELECT * FROM book ORDER BY publication_date LIMIT 5, 5;
SELECT * FROM book ORDER BY publication_date LIMIT 10, 6;
SELECT id, book_title, number_of_pages FROM book WHERE number_of_pages LIKE '5%';
SELECT id, book_title, category FROM book WHERE category LIKE '%проза%';
SELECT id, book_title, category, publication_date FROM book WHERE publication_date LIKE '2017%';
SELECT id, book_title, book_price FROM book WHERE book_price BETWEEN 1.50 and 120.2;
SELECT id, book_title, book_price FROM book WHERE book_price NOT BETWEEN 200 and 600;
DELETE FROM book WHERE id = 2;
SET sql_safe_updates = 0;
DELETE FROM book WHERE author_name = 'Наталка';
SET sql_safe_updates = 1;
DELETE FROM book WHERE isbn = 9786176794394;
*/


SELECT book_title, category.name, book_price
FROM book 
JOIN category ON book.category_id=category.id
ORDER BY category.name;

SELECT
    book.book_title,
	book. publication_date,
    book.isbn,
    book.number_of_pages,
    author.author_name,
    author.author_surname,
    author.author_email,
    book.book_price
FROM library 
    JOIN book ON book_id = book.id
    JOIN author ON author_id = author.id
    ORDER BY book.book_price LIMIT 10;

SELECT
    b.book_title,
    b.isbn,
    b.number_of_pages,
    au.author_name,
    au.author_surname,
    b.book_price
FROM library as l
    JOIN book as b on l.book_id = b.id
    JOIN author as au on l.author_id = au.id
    WHERE b.book_price > 150.00
    ORDER BY b.isbn;
    
SELECT 
library.id,
b.book_title,
au.author_name,
au.author_surname,
a.name
FROM library
JOIN book as b on library.book_id = b.id
JOIN author as au on library.author_id = au.id
JOIN awards as a on library.author_awards_id=a.id
WHERE author_awards_id IS NOT NULL
ORDER BY library.id;

SELECT 
library.id,
b.book_title,
au.author_name,
au.author_surname,
a.name
FROM library
JOIN book as b on library.book_id = b.id
JOIN author as au on library.author_id = au.id
RIGHT JOIN awards as a on library.author_awards_id=a.id
ORDER BY library.id;

SELECT 
library.id,
b.book_title,
au.author_name,
au.author_surname,
a.name
FROM library
JOIN book as b on library.book_id = b.id
JOIN author as au on library.author_id = au.id
LEFT JOIN awards as a on library.author_awards_id=a.id
ORDER BY library.id;
