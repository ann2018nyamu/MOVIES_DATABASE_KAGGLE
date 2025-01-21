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

 

















