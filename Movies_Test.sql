CREATE DATABASE IMDB_Movies;
USE IMDB_Movies;

CREATE TABLE Movies_Table (
Series_Title VARCHAR (50),
Released_Year INT,
Certificate CHAR (10),
Runtime VARCHAR (50),
Genre VARCHAR (50),
IMDB_Rating DECIMAL,
Meta_score FLOAT,
Director VARCHAR (50),
Star1 VARCHAR (50),
Star2 VARCHAR (50),
Star3 VARCHAR (50),
Star4 VARCHAR (50),
No_of_Votes INT 
);


CREATE TABLE Product_Table(
ProductID INT primary key, 
ProductName VARCHAR(255), 
CategoryID INT NOT NULL, 
Price INT);

CREATE TABLE Categories_Table(
CategoryID INT Primary Key,
CategoryName Varchar(255),
Description Varchar(255)
);

INSERT INTO product_table(ProductID, ProductName, CategoryID, Price)
VALUES
(1, 'Chais', 1, 18),
(2, 'Chang', 1, 19),
(3, 'AniseedSyrup', 2, 20);


INSERT INTO categories_table(CategoryID, CategoryName, Description)
VALUES
(1, 'Beverages', 'Soft drinks, coffees, teas, beers, and ales'),
(2, 'Condiments', 'Sweet and savory sauces, relishes, spreads, and seasonings'),
(3, 'Confections', 'Desserts, candies, and sweet breads');


-- ALTER TABLE table_name
-- MODIFY COLUMN column_name FLOAT

ALTER TABLE Movies_Table
MODIFY COLUMN Meta_score INT NULL,
MODIFY COLUMN Series_Title VARCHAR (255);

ALTER TABLE Movies_Table 
MODIFY COLUMN IMDB_Rating DECIMAL(3,1);

SELECT *
FROM Movies_Table;

ALTER TABLE Movies_Table
MODIFY COLUMN Released_Year VARCHAR(255);

ALTER TABLE Movies_Table
DROP CHECK chk_year;

SHOW CREATE TABLE Movies_Table;

ALTER TABLE Movies_Table ADD CONSTRAINT UNIQUE (Series_Title);

DESCRIBE Movies_Table;

SELECT *
FROM Movies_Table
WHERE Series_Title = '12 Angry Men';

SELECT *
FROM movies_table
WHERE Series_Title = '(500) Days of Summer';

SELECT Series_Title, COUNT(*)
FROM movies_table
GROUP BY Series_Title
HAVING COUNT(*) > 1;


CREATE TABLE Movies_Table_Backup AS SELECT * FROM Movies_Table;


LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Movies_Test_Data.csv' 
INTO TABLE Movies_Table
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(Series_Title, Released_Year, 
Certificate, Runtime, Genre, 
IMDB_Rating, @Meta_score, Director, 
Star1, Star2, Star3, Star4, No_of_Votes)
SET Meta_score = IF(@Meta_score REGEXP '^[0-9]+$', @Meta_score, NULL);



SHOW VARIABLES LIKE 'secure_file_priv';









