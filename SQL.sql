CREATE DATABASE `Друзья человека`;

CREATE TABLE `Домашние животные` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `имя` VARCHAR(50) NOT NULL,
  `команда` VARCHAR(50) NOT NULL,
  `дата_рождения` DATE NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `Вьючные животные` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `имя` VARCHAR(50) NOT NULL,
  `команда` VARCHAR(50) NOT NULL,
  `дата_рождения` DATE NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `Собаки` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `имя` VARCHAR(50) NOT NULL,
  `команда` VARCHAR(50) NOT NULL,
  `дата_рождения` DATE NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `Кошки` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `имя` VARCHAR(50) NOT NULL,
  `команда` VARCHAR(50) NOT NULL,
  `дата_рождения` DATE NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `Хомяки` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `имя` VARCHAR(50) NOT NULL,
  `команда` VARCHAR(50) NOT NULL,
  `дата_рождения` DATE NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `Лошади` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `имя` VARCHAR(50) NOT NULL,
  `команда` VARCHAR(50) NOT NULL,
  `дата_рождения` DATE NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `Верблюды` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `имя` VARCHAR(50) NOT NULL,
  `команда` VARCHAR(50) NOT NULL,
  `дата_рождения` DATE NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `Ослы` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `имя` VARCHAR(50) NOT NULL,
  `команда` VARCHAR(50) NOT NULL,
  `дата_рождения` DATE NOT NULL,
  PRIMARY KEY (`id`)
);

INSERT INTO `Собаки` (`имя`, `команда`, `дата_рождения`) VALUES ('Рекс', 'Охрана', '2022-01-01');
INSERT INTO `Кошки` (`имя`, `команда`, `дата_рождения`) VALUES ('Мурка', 'Ловля мышей', '2021-05-12');
INSERT INTO `Хомяки` (`имя`, `команда`, `дата_рождения`) VALUES ('Чип', 'Кручение колеса', '2018-02-11');
INSERT INTO `Лошади` (`имя`, `команда`, `дата_рождения`) VALUES ('Булат', 'Тяговая работа', '2022-07-05');
INSERT INTO `Верблюды` (`имя`, `команда`, `дата_рождения`) VALUES ('Али', 'Грузоперевозки', '2021-11-02');
INSERT INTO `Ослы` (`имя`, `команда`, `дата_рождения`) VALUES ('Игорь', 'Тяговая работа', '2023-09-05');


DELETE FROM `Верблюды` WHERE `id` = 1;

CREATE TABLE `Тяговые животные` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `имя` VARCHAR(50) NOT NULL,
  `команда` VARCHAR(50) NOT NULL,
  `дата_рождения` DATE NOT NULL,
  PRIMARY KEY (`id`)
);

INSERT INTO `Тяговые животные` (`имя`, `команда`, `дата_рождения`)
SELECT `имя`, `команда`, `дата_рождения` FROM `Лошади`
UNION ALL
SELECT `имя`, `команда`, `дата_рождения` FROM `Ослы`;


CREATE TABLE `Молодые животные` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `имя` VARCHAR(50) NOT NULL,
  `команда` VARCHAR(50) NOT NULL,
  `дата_рождения` DATE NOT NULL,
  `возраст_в_месяцах` INT NOT NULL,
  PRIMARY KEY (`id`)
);

INSERT INTO `Молодые животные` (`имя`, `команда`, `дата_рождения`, `возраст_в_месяцах`)
SELECT `имя`, `команда`, `дата_рождения`, TIMESTAMPDIFF(MONTH, `дата_рождения`, NOW()) AS `возраст_в_месяцах`
FROM `Домашние животные`
WHERE `дата_рождения` BETWEEN DATE_SUB(NOW(), INTERVAL 3 YEAR) AND DATE_SUB(NOW(), INTERVAL 1 YEAR)
UNION ALL
SELECT `имя`, `команда`, `дата_рождения`, TIMESTAMPDIFF(MONTH, `дата_рождения`, NOW()) AS `возраст_в_месяцах`
FROM `Вьючные животные`
WHERE `дата_рождения` BETWEEN DATE_SUB(NOW(), INTERVAL 3 YEAR) AND DATE_SUB(NOW(), INTERVAL 1 YEAR);


CREATE TABLE `Все животные` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `имя` VARCHAR(50) NOT NULL,
  `команда` VARCHAR(50) NOT NULL,
  `дата_рождения` DATE NOT NULL,
  `возраст_в_месяцах` INT,
  `тип` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`)
);

INSERT INTO `Все животные` (`имя`, `команда`, `дата_рождения`, `возраст_в_месяцах`, `тип`)
SELECT `имя`, `команда`, `дата_рождения`, NULL AS `возраст_в_месяцах`, 'Домашние животные' AS `тип` FROM `Домашние животные`
UNION ALL
SELECT `имя`, `команда`, `дата_рождения`, NULL AS `возраст_в_месяцах`, 'Вьючные животные' AS `тип` FROM `Вьючные животные`
UNION ALL
SELECT `имя`, `команда`, `дата_рождения`, TIMESTAMPDIFF(MONTH, `дата_рождения`, NOW()) AS `возраст_в_месяцах`, 'Собаки' AS `тип` FROM `Собаки`
UNION ALL
SELECT `имя`, `команда`, `дата_рождения`, TIMESTAMPDIFF(MONTH, `дата_рождения`, NOW()) AS `возраст_в_месяцах`, 'Кошки' AS `тип` FROM `Кошки`
UNION ALL
SELECT `имя`, `команда`, `дата_рождения`, TIMESTAMPDIFF(MONTH, `дата_рождения`, NOW()) AS `возраст_в_месяцах`, 'Хомяки' AS `тип` FROM `Хомяки`
UNION ALL
SELECT `имя`, `команда`, `дата_рождения`, NULL AS `возраст_в_месяцах`, 'Тяговые животные' AS `тип` FROM `Тяговые животные`
UNION ALL
SELECT `имя`, `команда`, `дата_рождения`, TIMESTAMPDIFF(MONTH, `дата_рождения`, NOW()) AS `возраст_в_месяцах`, 'Молодые животные' AS `тип` FROM `Молодые животные`;