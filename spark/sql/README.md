# Spark SQL Movie Analysis

This folder contains Spark SQL projects analyzing the MovieLens dataset using both DataFrame API and SQL queries in Zeppelin notebooks.

## Notebooks

- `homework1_sql_2025_basics.zpln`: Analyzes basic movie data using SQL queries
- `homework1_dataframe_2025_basics.zpln`: Analyzes basic movie data using DataFrame API
- `homework2_sql_2025_operations.zpln`: Performs rating analysis using SQL queries
- `homework2_dataframe_2025_operations.zpln`: Performs rating analysis using DataFrame API

## Task Requirements

### Task 1: For each user, find total number of ratings provided
- Group ratings by userId using SQL GROUP BY or DataFrame groupBy
- Count ratings for each user
- Output format: userId and count of ratings provided

### Task 2: Calculate how many movies an average user has ranked
- Count total users in the dataset
- Sum all rating counts across users
- Compute average number of ratings per user

### Task 3: User Rating Statistics
- For each user, find minimum, maximum, and average rating
- Use SQL aggregate functions (MIN, MAX, AVG) or DataFrame agg()
- Output format: userId with min_rating, max_rating, avg_rating

### Task 4: Top Movies by Rating
- Calculate average rating and count for each movie
- Filter to movies with at least 100 ratings
- Join with movie names for readability
- Sort by average rating and take top 10

### Task 5: User Genre Preferences
- Explode movie genres using SQL EXPLODE or DataFrame explode()
- Join ratings data with movie genre data
- Group by userId and genre
- Calculate count and average rating per user-genre pair
- Output user genre preferences with rating statistics

## Data Format

The analysis uses two files:
- **movies.csv**: movieId, title, genres (pipe-separated)
- **ratings.csv**: userId, movieId, rating, timestamp

## Implementation Notes

All solutions use Spark SQL capabilities including:
- **DataFrame API Operations**: select, filter, groupBy, join, orderBy, withColumn
- **SQL Functions**: COUNT, MIN, MAX, AVG, SUM, EXPLODE, SPLIT
- **Transformations**: Both declarative DataFrame transformations and SQL queries
- **Schema-based Processing**: Leveraging schema information for optimized execution

## Differences Between RDD and SQL Approaches

### Advantages of Spark SQL:
1. **Conciseness**: SQL implementations are more concise and readable
2. **Performance**: Uses Catalyst optimizer for better query execution
3. **Higher-level abstractions**: No need to manage key-value pairs manually
4. **Schema enforcement**: Provides schema validation and type checking
5. **Integration**: Easy to integrate with other data processing systems

## Original RDD Implementations

The original implementations in the RDD API can be found in:
- `spark/rdd/homework1_rdd_2025_basics.zpln`
- `spark/rdd/homework2_rdd_2025_pair_operations.zpln` 