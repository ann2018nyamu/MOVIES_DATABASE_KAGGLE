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


CREATE TABLE Shippers_Table(
ShipperID INT primary key,
ShipperName VARCHAR(255),
Phone CHAR (10)
);

CREATE TABLE Clients_Table(
ClientID INT Primary key,
ClientName VARCHAR(255),
ContactName VARCHAR(255),
Address VARCHAR(255),
City VARCHAR(255),
PostalCode INT,
Country VARCHAR(255)
);

CREATE TABLE Suppliers_Table(
SupplierID INT primary key,
SupplierName VARCHAR(255),
ContactName VARCHAR(255),
Address VARCHAR(255),
City VARCHAR(255),
PostalCode VARCHAR(255),
Country VARCHAR(255)
);


INSERT INTO Clients_Table(ClientID, ClientName, ContactName, Address, City, PostalCode, Country)
VALUES
(1, 'Alfreds Futterkiste', 'Maria Anders', 'Obere Str. 57', 'Berlin', 12209, 'Germany' ),
(2, 'Ana Trujillo Helados', 'Ana Trujillo', 'Avda. de la Constitution 2222', 'Mexico D.F', 05021, 'Mexico'),
(3, 'Antonio Moreno Taqueria', 'Antonio Moreno', 'Mataderos 2312', 'Mexico D.F', 06023, 'Mexico');


INSERT INTO Suppliers_Table(SupplierID, SupplierName, ContactName, Address, City, PostalCode, Country)
VALUES
(1, 'Exotic Liquid', 'Charlotte Cooper', '49 Gilbert St.', 'London', 'EC1 4SD', 'UK'),
(2, 'New Orleans Cajun Delights', 'Shelley Burke', 'P.O Box 78934', 'New Orleans', '70117', 'USA'),
(3, 'Grandma Kellys Homestead', 'Regina Murphy', '707 Oxford Rd.', 'Ann Arbor', '48104', 'USA');
 
INSERT INTO Clients_Table(ClientID, ClientName, ContactName, Address, City, PostalCode, Country)
VALUES 
(4, 'Anatonio Moreno Taqueria', 'Antonio Moreno', 'Mataderos 2412', 'Mexico R.F', 07023, 'Kenya'),
(5, 'Annitonio Moreno Taqueria', 'Antonio Moreno', 'Mataderos 2512', 'Mexico L.F', 08023, 'USA'),
(6, 'Moreno Taqueria', 'Antonio Moreno', 'Mataderos 2612', 'Mexico T.F', 09023, 'Mexico'),
(7, 'Trontonio Moreno Taqueria', 'Antonio Moreno', 'Mataderos 2712', 'Mexico M.F', 10023, 'Mexico');

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

INSERT INTO Shippers_Table(ShipperID, ShipperName, Phone)
VALUES
(1, 'Speedy Express', 5035559831),
(2, 'United Package', 5035553199),
(3, 'Federal Shipping', 5035559931);


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









