

-- importing new movies from 2020
drop table if exists films_2020;
CREATE TABLE `films_2020` (
  `film_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text,
  `release_year` year(4) DEFAULT NULL,
  `language_id` tinyint(3) unsigned NOT NULL,
  `original_language_id` tinyint(3) unsigned DEFAULT NULL,
  `rental_duration` varchar(255),
  `rental_rate` varchar(255),
  `length` smallint(5) unsigned DEFAULT NULL,
  `replacement_cost` varchar(255) DEFAULT NULL,
  `rating` enum('G','PG','PG-13','R','NC-17') DEFAULT NULL,
  PRIMARY KEY (`film_id`),
  CONSTRAINT FOREIGN KEY (`original_language_id`) REFERENCES `language` (`language_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1003 DEFAULT CHARSET=utf8;


show variables like 'local_infile';

set global local_infile =1;

load data infile './Users/javiercorderopariente/dataexercises/sakila2020/lab-sql-6/files_for_lab/films_2020.csv' into table films_2020 fields terminated by ',';

show variables like 'local_infile';
set global local_infile = 1;
show variables like 'secure_file_priv';

set sql_safe_updates = 0;

LOAD DATA LOCAL INFILE "/Users/javiercorderopariente/dataexercises/sakila2020/lab-sql-6/files_for_lab/films_2020.csv" 
INTO table sakila.films_2020
FIELDS TERMINATED BY ',';
#LOAD DATA INFILE '/Users/javiercorderopariente/dataexercises/sakila2020/lab-sql-6/files_for_lab/films_2020.csv' 
#INTO TABLE sakila.films_2020
#FIELDS TERMINATED BY ',';

select * from sakila.films_2020;

-- 2020 films rental duration equals to 3 days 
#rental duration will be 3 days 
#with an offer price of 2.99€
#replacement cost of 8.99€. 

UPDATE sakila.films_2020
SET  replacement_cost= '8.99'
WHERE release_year = 2020;

UPDATE sakila.films_2020
SET  rental_duration= '3'
WHERE release_year = 2020;

UPDATE sakila.films_2020
SET  rental_rate= '2.99'
WHERE release_year = 2020;

select * from sakila.films_2020;