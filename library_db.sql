CREATE database library_db;
CREATE USER alexander WITH encrypted password 'password';
GRANT ALL PRIVILEGES ON database library_db TO alexander;
ALTER USER alexander WITH SUPERUSER;

CREATE TABLE book (
id int,
title varchar(64),
genre varchar(32),
description varchar(256),
rate numeric(3,2),
authorID int);

CREATE TABLE author (
id int,
firstName varchar(64),
lastName varchar(64),
country varchar(64),
age int);

INSERT INTO book
(id, title, genre, description, rate, authorID) 
VALUES
(1 ,'Граф монте Крісто', 'Роман', 'Історія юнака Едмона Дантеса', 9.1, 1),
(2 ,'Гамлет','Пєса', 'Про помсту принца Гамлета', 9.2, 2),
(3 ,'Три товариша','Драма','Історя трьох друзів, що пройшли війну', 8.8, 3),
(4 ,'Хроніки нарнії','Фентезі','Розповідається про пригоди дітей у казковій країні під назвою Нарнія', 9.5, 4),
(5 ,'Ловець у житі','Роман','Автор знайомить нас з героєм в хвилину гострої моральної кризи', 8.5, 5),
(6 ,'Євгеній Онєгін','Роман','У книзі показана драматична доля людей дворянської інтелігенції', 8.9, 6),
(7 ,'Володар Мух','Повість','Героями повісті є діти і підлітки, що опинились на незаселеному острові', 9.1, 7),
(8 ,'Острік скарбів','Роман','Роман про життя піратів', 9.3, 8),
(9 ,'Темна вежа','Жахи','Роланд — останній живий член королівського ордену Стрільців і останній з роду Артура Ельда', 9.6,  9),
(10 ,'Собор Паризької богоматері','Історичний роман','Про циганку Есмеральду та горбаня Квазімодо', 8.9, 10),
(11 ,'По кому дзвонить дзвін','Роман','Роман яскраво зображує страхіття громадянської війни, як її бачить головний герой Роберт Джордан', 9.1, 11),
(12,'Батьки та діти','Роман','Дії у романі відбуваються влітку 1859 року, тобто напередодні селянської реформи 1861 року', 8.9,  12),
(13 ,'Володар перснів','Фентезі','Темний Володар Саурон викував Єдиний Перстень, щоб здобути владу над іншими перснями, які перебувають в руках вождів людей, ельфів та гномів', 9.8, 13),
(14 ,'Гаррі Поттер та філософський камінь','Фентезі','На початку роману світ чарівників святкує поразку Лорда Волдеморта, могутнього і жорстокого злого чарівника', 9.7, 14),
(15 ,'Бійцівський клуб','Роман','До написання роману Паланіка надихнула бійка, в якій він брав участь під час поїздки в літній табір', 9.2, 15),
(16 ,'1984','Утопія','Роман розповідає історію Вінстона Сміта і його деградації під впливом[1] тоталітарної держави, в якій він живе', 9.2, 16),
(17 ,'Війна та мир','Роман','Дві основні лінії «Війни і миру» — історія двох друзів, Пєра Безухова і Андрія Болконського', 8.9, 17),
(18 ,'Зелена миля','Роман','У вязниці «Холодна гора» блок смертників називають Зеленою Милею', 9.1, 9),
(19 ,'Дюна','Фантастика','Дія роману відбувається у вигаданому всесвіті Галактичної імперії, що їй підвладна безліч екзопланет', 9.4, 18),
(20 ,'Майстер і Маргарита','Роман','У романі представлено чергування двох сюжетних ліній, що розвиваються паралельно одна одній', 9.3, 19),
(21, '451° по Фаренгейту','Антиутопія', 'Роман «451 градус за Фаренгейтом» розповідає про тоталітарне суспільство, в якому література заборонена', 9.7, 20);

INSERT INTO author
(id, firstName, lastName, country, age)
VALUES
(1 ,'Олександр', 'Дюма', 'Росія', 68),
(2 ,'Уільям', 'Шекспір', 'Англія', 52),
(3 ,'Еріх Марія', 'Ремарк', 'Швейцарія', 72),
(4 ,'Клайв Стейплз', 'Льюїс', 'Англія', 64),
(5 ,'Джером Девід', 'Селінджер', 'США', 91),
(6 ,'Олександр', 'Пушкін', 'Росія', 37),
(7 ,'Вільям', 'Голдінг', 'Англія', 81),
(8 ,'Роберт', 'Стівенсон', 'Англія', 44),
(9 ,'Стівен', 'Кінг', 'США', 71),
(10 ,'Гюго', 'Віктор', 'Франція', 83),
(11 ,'Ернест', 'Хемінгуей', 'США', 61),
(12 ,'Іван', 'Тургенєв', 'Росія', 64),
(13 ,'Джон Роналд Руел', 'Толкін', 'Африка', 81),
(14 ,'Джоан', 'Роулінг', 'Англія', 54),
(15 ,'Чарльз Майкл', 'Паланік', 'США',57),
(16 ,'Джордж', 'Оруелл', 'Англія', 46),
(17 ,'Лев', 'Толстой', 'Росія', 82),
(18 ,'Френк', 'Герберт', 'США', 65),
(19 ,'Михайло', 'Булгаков', 'Росія', 47),
(20 ,'Рей', 'Бредбері', 'США', 91);

SELECT * FROM book LEFT JOIN author ON book.authorID = author.id;

SELECT * FROM book WHERE genre='Роман';

SELECT title, genre FROM book ORDER BY rate DESC;

SELECT title, MAX(rate) AS max_rate FROM book
GROUP BY id, title
ORDER BY max(rate) DESC;

SELECT * FROM book WHERE authorID=9;

SELECT * FROM author ORDER BY age DESC;

SELECT author.id, firstname, lastname, country, age, COUNT(book.authorid) AS count_of_books 
FROM Book LEFT JOIN author ON book.authorid=author.id
GROUP BY author.id, firstname, lastname, country, age
ORDER BY COUNT(book.authorid) DESC




