# LEGO Data Analysis Project

## Overview

This project involves the analysis of a LEGO dataset to uncover insights and trends related to LEGO sets, themes, and parts. SQL (Structured Query Language) was used extensively to perform various data manipulations and aggregations, showcasing key SQL skills commonly utilized by data analysts.

## SQL Skills Utilized

### 1. Data Retrieval and Transformation

SQL was used to extract data from multiple tables, join them, and create a simplified view (`analysis_main`). This view allowed for easier querying and analysis by combining relevant information from different tables.

### 2. Data Aggregation

Aggregation functions such as `COUNT`, `SUM`, and 'AVG' were applied to summarize and analyze data. For example, we calculated the average number of parts per set and identified the total amount of lego parts produced per year.

### 3. Grouping and Group By

The `GROUP BY` clause was extensively employed to group data based on specific attributes, such as theme names, years, or release months. This allowed for the aggregation of data within each group, enabling trend analysis and comparisons.

### 4. Case Statements

The `CASE` statement was used to categorize data, such as classifying sets into 20th or 21st-century categories based on their release years.

### 5. Sorting and Ordering

The `ORDER BY` clause helped in arranging data in a meaningful way, facilitating the identification of top themes, most produced colors, and other patterns.

### 6. Subqueries and Common Table Expressions (CTEs)

CTEs and subqueries were employed to break down complex analysis into manageable steps. For instance, a CTE was used to calculate the percentage of Star Wars-themed sets released in the 21st century.

### 7. Window Functions

Window functions were utilized for tasks like ranking themes by popularity within each year of the 21st century. These functions allowed for more advanced analytical tasks by providing access to data within a specific "window" of rows.

## Additional Analysis

In addition to the SQL skills mentioned above, the project explored various aspects of the LEGO dataset, including the distribution of set sizes, the most popular themes, and the most produced color. These analyses were conducted to gain valuable insights into the LEGO world.

## Conclusion

This project demonstrates the application of SQL skills in a data analysis context, showcasing the power of SQL in retrieving, transforming, aggregating, and analyzing data to derive meaningful insights. By utilizing SQL effectively, we were able to uncover patterns and trends within the LEGO dataset, offering valuable information for decision-making and future exploration.
