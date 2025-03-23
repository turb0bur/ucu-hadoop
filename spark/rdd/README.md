# Spark RDD Movie Analysis

This folder contains Spark RDD projects analyzing the MovieLens dataset using Apache Spark RDD API.

## Notebooks

- `task1_spark_rdd_2025_movie_ratings.zpln`: Analyzes movie ratings data using Spark RDD operations
- `task2_spark_rdd_2025_genre_analysis.zpln`: Performs genre-based analysis using Spark RDD transformations

## Task Requirements

### Task 1: Total Ratings by User
- Map each rating to (userId, 1) pairs
- Use reduceByKey to count ratings per user
- Output format: userId and count of ratings provided

### Task 2: Average Movies Rated
- Calculate total number of users in the dataset
- Sum all ratings counts across users
- Compute average number of movies rated per user

### Task 3: User Rating Statistics
- For each user, find minimum, maximum, and average rating
- Use aggregateByKey with accumulator for combined statistics
- Output format: userId with (min, max, avg) tuple

### Task 4: Top Movies by Rating
- Count and sum ratings for each movie using aggregateByKey
- Filter to movies with at least 100 ratings to ensure reliability
- Join with movie names data for readability
- Sort by average rating and take top 10

### Task 5: User Genre Preferences
- Join ratings data with movie genre data
- Split genres using flatMap to create (userId, genre, rating) records
- Calculate count and average rating per user-genre pair
- Output user genre preferences with rating statistics

## Data Format

The analysis uses two files:
- **movies.csv**: movieId, title, genres (pipe-separated)
- **ratings.csv**: userId, movieId, rating, timestamp

## Implementation Notes

All solutions use Spark RDD operations including:
- Transformations: map, reduceByKey, aggregateByKey, join, flatMap, filter
- Actions: count, take, collect
- Key-value pair processing for efficient aggregations 