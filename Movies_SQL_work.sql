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















