USE employees;
SELECT * FROM employees;

SELECT REPLACE('hello oneil class!', 'oneil', 'O\'Neil');

USE albums_db;
SELECT genre, REPLACE(genre, 'rock', '**ROCK**')
	FROM albums;

SELECT NOW();
SELECT CURRENT_DATE();
SELECT CURDATE();
SELECT CURTIME();
SELECT CONVERT_TZ(CURTIME(), '+00:00', '-06:00');