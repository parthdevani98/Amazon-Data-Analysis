# Amazon Sales Data Analysis Project

## Project Description

The primary aim of this project is to gain insights into the sales data of Amazon to understand the various factors that influence sales across different branches. This dataset contains sales transactions from three branches of Amazon located in Mandalay, Yangon, and Naypyitaw. It consists of 17 columns and 1,000 rows of transactional data.

### Dataset Overview

The dataset includes the following columns:

| Column                     | Description                                  | Data Type          |
|---------------------------|----------------------------------------------|---------------------|
| invoice_id                | Invoice of the sales made                    | VARCHAR(30)         |
| branch                    | Branch at which sales were made              | VARCHAR(5)          |
| city                      | The location of the branch                   | VARCHAR(30)         |
| customer_type             | The type of the customer                     | VARCHAR(30)         |
| gender                    | Gender of the customer making the purchase   | VARCHAR(10)         |
| product_line              | Product line of the product sold             | VARCHAR(100)        |
| unit_price                | The price of each product                    | DECIMAL(10, 2)      |
| quantity                  | The amount of the product sold               | INT                 |
| VAT                       | The amount of tax on the purchase            | FLOAT(6, 4)         |
| total                     | The total cost of the purchase               | DECIMAL(10, 2)      |
| date                      | The date on which the purchase was made      | DATE                |
| time                      | The time at which the purchase was made      | TIMESTAMP           |
| payment_method            | The total amount paid                        | DECIMAL(10, 2)      |
| cogs                      | Cost Of Goods sold                           | DECIMAL(10, 2)      |
| gross_margin_percentage    | Gross margin percentage                       | FLOAT(11, 9)        |
| gross_income              | Gross Income                                 | DECIMAL(10, 2)      |
| rating                    | Rating                                       | FLOAT(2, 1)         |

## Analysis Objectives

1. **Product Analysis**: Understand the different product lines, identify the best-performing product lines, and highlight areas for improvement.
   
2. **Sales Analysis**: Analyze sales trends to measure the effectiveness of sales strategies and identify necessary modifications for increasing sales.
   
3. **Customer Analysis**: Uncover different customer segments, their purchase trends, and profitability.

## Approach Used

### Data Wrangling
- Building a database and creating a table to insert the data.
- Inspecting the data for NULL values and applying methods to replace missing values.

### Feature Engineering
- Adding new columns to derive insights:
  - **timeofday**: Classifying sales into Morning, Afternoon, and Evening.
  - **dayname**: Extracting the day of the week for each transaction.
  - **monthname**: Extracting the month of the year for sales analysis.

### Exploratory Data Analysis (EDA)
Conducting EDA to answer the following business questions:

## Business Questions

1. What is the count of distinct cities in the dataset?
2. For each branch, what is the corresponding city?
3. What is the count of distinct product lines in the dataset?
4. Which payment method occurs most frequently?
5. Which product line has the highest sales?
6. How much revenue is generated each month?
7. In which month did the cost of goods sold reach its peak?
8. Which product line generated the highest revenue?
9. In which city was the highest revenue recorded?
10. Which product line incurred the highest Value Added Tax?
11. For each product line, add a column indicating "Good" if its sales are above average, otherwise "Bad."
12. Identify the branch that exceeded the average number of products sold.
13. Which product line is most frequently associated with each gender?
14. Calculate the average rating for each product line.
15. Count the sales occurrences for each time of day on every weekday.
16. Identify the customer type contributing the highest revenue.
17. Determine the city with the highest VAT percentage.
18. Identify the customer type with the highest VAT payments.
19. What is the count of distinct customer types in the dataset?
20. What is the count of distinct payment methods in the dataset?
21. Which customer type occurs most frequently?
22. Identify the customer type with the highest purchase frequency.
23. Determine the predominant gender among customers.
24. Examine the distribution of genders within each branch.
25. Identify the time of day when customers provide the most ratings.
26. Determine the time of day with the highest customer ratings for each branch.
27. Identify the day of the week with the highest average ratings.
28. Determine the day of the week with the highest average ratings for each branch.

## Conclusion

This project aims to provide actionable insights into the sales data of Amazon, enhancing decision-making and strategy formulation across different branches.
