-- Movie Recommender System
-- Schema Design

CREATE TABLE IF NOT EXISTS movies ( 
    movieId INTEGER PRIMARY KEY,
    title   TEXT NOT NULL,
    genres  TEXT
);

-- Creates a table called 'movies' ONLY if it doesn't already exist
-- Prevents errors if you run the script multiple times

CREATE TABLE IF NOT EXISTS ratings (
    userId    INTEGER,
    movieId   INTEGER,
    rating    REAL,
    timestamp INTEGER,
    FOREIGN KEY (movieId) REFERENCES movies(movieId)
);