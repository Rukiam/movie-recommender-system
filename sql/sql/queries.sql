-- Movie Recommender System
-- Required SQL Queries

-- 1. Highest rated movies (minimum 10 ratings)

SELECT m.titles, AVG(r.rating) as avg_rating, count(r.rating) as total_ratings
FROM ratings r
JOIN movies m ON r.movieId = m.movieId
GROUPBY r.movieId
HAVING total_ratings >= 10
ORDER BY avg_rating DESC
LIMIT 10;


-- 2. Most popular genres
SELECT genres, COUNT(*) as movie_count
FROM movies
GROUP BY genres
ORDER BY movie_count DESC
LIMIT 10;

-- 3. Average rating per genre
SELECT m.genres, AVG(r.rating) as avg_rating
FROM ratings r
JOIN movies m ON r.movieId = m.movieId
GROUP BY m.genres
ORDER BY avg_rating DESC
LIMIT 10;

-- 4. Top active users
SELECT userId, COUNT(rating) as total_ratings
FROM ratings
GROUP BY userId
ORDER BY total_ratings DESC
LIMIT 10;

-- 5. Movies released by year
SELECT 
    SUBSTR(title, LENGTH(title)-4, 4) as year,
    COUNT(*) as movie_count
FROM movies
WHERE title LIKE '%(____)'
GROUP BY year
ORDER BY year DESC
LIMIT 15;