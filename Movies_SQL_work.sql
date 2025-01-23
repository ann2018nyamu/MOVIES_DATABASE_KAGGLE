SELECT  *
FROM movies_table;

SELECT Series_Title, IMDB_Rating
FROM movies_table;

SELECT *
FROM movies_table
WHERE Released_Year = 2000;

SELECT *
FROM movies_table
WHERE IMDB_Rating > 8.5;

SELECT Series_Title, Runtime
FROM movies_table
WHERE Runtime > 150;

SELECT Series_Title, Director
FROM movies_table
WHERE Director = 'Christopher Nolan';

SELECT Series_Title, IMDB_Rating
FROM movies_table
ORDER BY IMDB_Rating ASC
LIMIT 10;

SELECT Series_Title, IMDB_Rating
FROM movies_table
ORDER BY IMDB_Rating DESC
LIMIT 10;

SELECT Series_Title, Released_Year
FROM movies_table
ORDER BY Released_Year DESC;

SELECT COUNT(*) AS Series_Title, Released_Year, Director
FROM movies_table
GROUP BY Series_Title, Released_Year, Director;

SELECT Series_Title, IMDB_Rating 
FROM movies_table
WHERE IMDB_Rating > 9.0;

SELECT Series_Title, Released_Year
FROM movies_table
WHERE Series_Title LIKE '%Godfather%';

SELECT Series_Title, Genre
FROM movies_table
WHERE Genre LIKE '%Drama%';

SELECT AVG(IMDB_Rating) AS Series_Title, Genre
FROM movies_table
GROUP BY Series_Title, Genre;

SELECT SUM(No_of_Votes)
FROM movies_table
WHERE Genre LIKE '%Action%';

SELECT * 
FROM movies_table
WHERE Genre IN ('Comedy',  'Drama');

SELECT *
FROM movies_table
WHERE Genre NOT IN ('Comedy',  'Drama');

-- BETWEEN AND & NOTBETWEEN --
SELECT  Series_Title, Genre, Released_Year
FROM movies_table
WHERE Released_Year BETWEEN 2000 AND 2010;

SELECT Series_Title, Genre, IMDB_Rating
FROM movies_table
WHERE IMDB_Rating BETWEEN 8 AND 9;

SELECT Series_Title, Genre, IMDB_Rating
FROM movies_table
WHERE IMDB_Rating NOT BETWEEN 8 AND 9;

SELECT * 
FROM movies_table
WHERE  Released_Year BETWEEN 1997 AND 2000
AND IMDB_Rating IN (7, 8, 9);


SELECT Runtime, Series_Title, Genre
FROM movies_table
WHERE Runtime BETWEEN 140 AND 150;

SELECT Series_Title, Genre, Runtime
FROM movies_table
WHERE Runtime NOT BETWEEN 140 AND 150;

-- USE OF ALIAS--
-- SQL aliases are used to give a table, or a column in a table, a temporary name.
-- Aliases are often used to make column names more readable.
-- An alias only exists for the duration of that query.
-- An alias is created with the AS keyword.--

SELECT Series_Title AS Title, IMDB_Rating AS Rating, 
Released_Year AS Year, Genre AS "Genre Type"
FROM movies_table;

SELECT Series_Title Title
FROM movies_table;

SELECT Series_Title, Director + '' + Star1 + '' + 
Star2 + ',' + Star3 + ',' + Star4  AS CREW
FROM movies_table;

-- SQL JOIN --
-- Join clause is used to
-- combine rows from two or more tables based on a related column between them. --
-- (INNER) JOIN: Returns records that matching values in both tables.--alter--
-- LEFT (OUTER) JOIN: Returns all records from the left table, 
-- and the matched records from the right table --
-- RIGHT (OUTER) JOIN: Returns all records from the right table, 
-- and the matched records from the left table --
-- FULL(OUTER) JOIN: Returns all records when 
-- there is a match in either left or right table --

SELECT ProductID, ProductName, CategoryName
FROM product_table
INNER JOIN categories_table ON 
product_table.CategoryID = categories_table.CategoryID;

SELECT  Column_name(s)
FROM table1
INNER JOIN table2
ON table1.column_name = table2.column_name;

-- JOIN & INNER JOIN will return the same results --

SELECT ProductID, ProductName, CategoryName
FROM product_table
JOIN categories_table ON product_table.CategoryID = categories_table.CategoryID;

-- JOIN 3 TABLES --
SELECT Prod
FROM product_table 
INNER JOIN categories_table ON product_table.CategoryID = category_table.CategoryID;

-- SQL LEFT JOIN returns all records from the left table (table1), 
-- and the matching records from the right table (table2). 
-- The result is 0 records from the right side if there is no match  --

SELECT Column_Name(s)
FROM table1
LEFT JOIN table2
ON table1.column_name = table2.column_name;

SELECT ProductID, ProductName, CategoryName
FROM product_table
LEFT JOIN categories_table
ON product_table.CategoryID = categories_table.CategoryID;

-- SQL RIGHT JOIN --
-- The RIGHT JOIN keyword returns all records from the right table(table2),
-- and the matching records from the left table(table1).
-- The result is 0 records from the left side, if there is no match.--

SELECT ProductID, ProductName, CategoryName, Description, Price
FROM product_table
RIGHT JOIN categories_table
ON product_table.CategoryID = categories_table.CategoryID;

-- SQL FULL OUTER JOIN --
-- The FULL OUTER JOINkeyword returns all records when
-- there is a match in left (table1) or right (table2) table records.--

-- MySQL does not natively support FULL OUTER JOIN.--
-- If you're using MySQL, you can emulate a FULL OUTER JOIN 
-- using a combination of LEFT JOIN and RIGHT JOIN with a UNION. Here's how:

SELECT column_name(s)
FROM table1
LEFT JOIN table2 ON table1.column_name = table2.column_name
UNION
SELECT column_name(s)
FROM table1
RIGHT JOIN table2 ON table1.column_name = table2.column_name;

SELECT ProductID, ProductName, CategoryName, Description
FROM product_table
LEFT JOIN categories_table ON product_table.CategoryID = categories_table.CategoryID
UNION
SELECT ProductID, ProductName, CategoryName, Description
FROM product_table
RIGHT JOIN categories_table ON product_table.CategoryID = categories_table.CategoryID;


-- SELF JOIN --
-- A self join is a regular join, but the table is joined with itself.--

SELECT column_name(s)
FROM table1 T1, table1 T2
WHERE T1.column_name = T2.other_column; -- WHERE Condition --
-- T1 & T2 are different table aliases for the same table --

SELECT 
ProTable.ProductID AS Pro_ProductID,
ProdTable.ProductName AS Pro_ProductName,
ProTable.Price As Pro_Price,
ProdTable.ProductID AS Prod_ProductID,
ProdTable.ProductName AS Prod_ProductName,
ProdTable.Price AS Prod_Price
FROM product_table ProTable, product_table ProdTable
WHERE ProTable.ProductID <> ProdTable.ProductID;

-- The SQL UNION Operator --
-- The UNION operator is used to combine the result-set of two or more SELECT statements.
-- Every SELECT statement within UNION must have the same number of columns.
-- The columns must also have similar data types
-- The columns in every SELECT statement must also be in the same order.

SELECT ProductID, ProductName 
FROM product_table
UNION
SELECT CategoryID, CategoryName
FROM categories_table;

-- UNION ALL --
-- The UNION operator selects only distinct values by default.
-- To allow duplicate values, use UNION ALL.

SELECT column_name(s) FROM table1
UNION ALL
SELECT column_name(s) FROM table2;

SELECT ProductID, ProductName
FROM product_table
UNION ALL 
SELECT CategoryID, CategoryName
FROM categories_table; 

SELECT City 
FROM Clients_Table
UNION 
SELECT city FROM Suppliers_Table
ORDER BY City;

SELECT City, ClientName, Country
FROM Clients_Table
UNION ALL
SELECT City, SupplierName, ContactName
FROM Suppliers_Table
ORDER BY City, ClientName, Country;

-- SQL UNION With WHERE --
SELECT City, Country, ClientName
FROM clients_table
WHERE Country= 'Germany'
UNION
SELECT City, Country, SupplierName
FROM suppliers_table
WHERE Country= 'Germany'
ORDER BY City, Country, ClientName;

-- SQL UNION ALL With WHERE --
SELECT City, Country 
FROM clients_table
WHERE Country= 'Mexico'
UNION ALL
SELECT City, Country
FROM suppliers_table
WHERE Country= 'Mexico'
ORDER BY City, Country;

-- Another UNION Example--
SELECT 'Client' AS Type, ContactName, City, Country
FROM clients_table
UNION
SELECT 'Supplier', ContactName, City, Country
FROM suppliers_table;

-- SQL GROUP BY Statemnet --
-- The GROUP BY statement groups rows that have the same value into summary rows,
-- like "find the number of customers in each country"
-- The GROUP BY statement is often used with aggregate functions (COUNT(), MAX(), MIN(), SUM(), AVG())
-- to group the result-set by one or more columns.
-- GROUP BY Syntax --

SELECT *
FROM clients_table
WHERE ClientName LIKE '%AN%'
AND City LIKE '%Mexi%'
GROUP BY ClientID, ClientName, ContactName, Address, City
ORDER BY ClientID ASC;

SELECT Released_Year, Genre, SUM(IMDB_Rating) AS Total_rating 
FROM movies_table
WHERE Genre LIKE '%Drama%'
GROUP BY Released_Year, Genre;

SELECT Certificate, SUM(No_of_Votes) AS Total_Votes
FROM movies_table
GROUP BY Certificate;

SELECT Genre, SUM(NO_of_Votes) As Total_Votes
FROM movies_table
WHERE IMDB_Rating > 8.5
GROUP BY Genre;

SELECT Released_Year, Genre,  SUM(No_of_Votes) AS Total_Votes
FROM movies_table
WHERE Released_Year > 2010
AND Released_Year <= 2015
Group BY Released_Year, Genre;

-- Total Votes for Movies with High IMDB Ratings
SELECT Genre, SUM(No_of_Votes) AS Total_Votes
FROM movies_table
WHERE IMDB_Rating >= 9.0
GROUP BY Genre, IMDB_Rating;

-- Total Runtime of All Movies by Certification
SELECT Genre, Certificate, SUM(Runtime) AS Runtime_Total
FROM movies_table
WHERE Certificate IS NOT NULL
AND Genre LIKE '%Drama%'
GROUP BY Genre, Certificate;

-- Total Votes for Each Director for Movies Released After 1990
SELECT Genre, Director, SUM(No_of_Votes) As Total_Votes
FROM movies_table
WHERE Released_Year > 1990
GROUP BY Genre, Director;

-- Sum of Votes for Movies in Specific Genres --
SELECT Genre, SUM(No_of_Votes) AS Total_Votes
FROM movies_table
WHERE Genre IN ('Drama', 'Comedy')
GROUP BY Genre;

-- Total Votes for Top-Rated Movies Grouped by Year --
SELECT Series_Title, IMDB_Rating, SUM(No_of_Votes) AS All_Votes
FROM movies_table
WHERE IMDB_Rating > 8.7
GROUP BY Series_Title, IMDB_Rating, Released_Year;

-- Total Number of Votes for Movies Based on Meta Scores --
SELECT Genre, Meta_score, SUM(No_of_Votes) AS Total_Votes
FROM movies_table
WHERE Meta_score IS NOT NULL AND Meta_score >= 85
AND Genre IN ('Drama', 'Comedy')
GROUP BY Genre, Meta_score;

-- Total Votes by Genre for Movies Directed by a Specific Director --
SELECT Genre, Director, SUM(No_of_Votes) AS Total_Votes
FROM movies_table
WHERE Director LIKE ('Alfred Hitchcock')
GROUP BY Genre, Director;

-- Total Votes by Genre for Movies Released Between 1990 and 2000 --
SELECT Genre, Released_Year, SUM(No_of_Votes) AS Total_Votes
FROM movies_table
WHERE Released_Year BETWEEN 1995 AND 2000
GROUP BY Genre, Released_Year;

-- Total Votes for Movies by Certification and Release Year --
SELECT Genre, Released_Year, Certificate, SUM(No_of_Votes) AS Total_Votes
FROM movies_table
WHERE Released_Year BETWEEN 2000 AND 2005
AND Certificate IN ('A', 'UA')
GROUP BY Genre, Released_Year, Certificate;

-- SQL HAVING Clause --
-- Having clause is used because the WHERE keyboard is used with aggregate functions--
SELECT column_name(s)
FROM table_name
WHERE table_name LIKE '%a%'
GROUP BY column_name(s)
Having table_name LIKE '%a%'
ORDER BY column_name(s);

-- Lists the number of customers in each country.
-- Only includes countries with more than 5 Customers 
SELECT COUNT(ClientID), Country
FROM clients_table
GROUP BY Country
HAVING COUNT(ClientID) > 1;

SELECT COUNT(ClientID), City
FROM clients_table
GROUP BY City
HAVING COUNT(ClientID) > 1;

SELECT COUNT(ClientID), ContactName
FROM clients_table
GROUP BY ContactName
HAVING COUNT(ClientID) > 1
ORDER BY COUNT(ClientID) DESC;

SELECT COUNT(Series_Title), Released_Year
FROM movies_table
GROUP BY Released_Year
HAVING COUNT(Series_Title) >5
ORDER BY COUNT(Series_Title) DESC;

-- More HAVING Examples --
SELECT movies_table.


































 

















