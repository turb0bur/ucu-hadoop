# Hive Data Analysis Projects

This folder contains Hive projects using the Movie_Ratings_Dataset to analyze movie data using Apache Zeppelin notebooks.

## Notebooks

- `task4_hive_2025_count_movies_by_genre.zpln`: Analyzes movie genre distribution
- `task5_hive_2025_top_movies_by_rating_with_tags.zpln`: Identifies top-rated movies by specific tags

## Task Requirements

### Task 4: Count Movies by Genre
- Write a query to count the number of movies by genre and sort counts in descending order
- Output format: Genre and count (e.g., "Comedy 1234")
- Output only genres with occurrence more than 200
- Use lateral view and explode as described in: http://www.ericlin.me/how-to-use-hive-lateral-view-in-your-query

### Task 5: Top Movies by Rating with Tags
- Write a query to show top 5 movies with the highest average rating with tag "based on a book" and with tag "based on a play"
- Use ratings table joined with tags table
- Use DENSE_RANK analytical function partitioned by tag

## Data Tables

- `genre_counts_task4`: Stores genres and their movie counts (Task 4)
- `top_movies_by_tag_task5`: Stores top-rated movies by tags (Task 5)

## Configuration

Both notebooks use Hive with Tez execution engine and dynamic partitioning. 