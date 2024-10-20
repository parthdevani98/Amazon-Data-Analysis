USE amazon_data;
SELECT * FROM amazon_data;

-- 1. What is the count of distinct cities in the dataset?

SELECT COUNT(DISTINCT City) AS distinct_city_count FROM amazon_data;

-- 2. For each branch, what is the corresponding city?

SELECT DISTINCT Branch, City FROM amazon_data;

-- 3.  What is the count of distinct product lines in the dataset?

SELECT COUNT(DISTINCT `Product line`) AS distinct_product_line_count FROM amazon_data;

-- 4. Which payment method occurs most frequently?

SELECT Payment, COUNT(Payment) AS Payment_count 
FROM amazon_data 
GROUP BY Payment 
ORDER BY Payment_count DESC 
LIMIT 1;

-- 5. Which product line has the highest sales?

SELECT `Product line`, ROUND(SUM(Total),2) AS total_sales FROM amazon_data
GROUP BY `Product line`
ORDER BY total_sales DESC
LIMIT 1;

-- 6. How much revenue is generated each month?

SELECT monthname, ROUND(SUM(Total),2) AS Sales_Per_Month FROM amazon_data
GROUP BY month(Date), monthname
ORDER BY month(Date);

-- 7. In which month did the cost of goods sold reach its peak?

SELECT monthname, ROUND(SUM(cogs), 2) AS total_cogs 
FROM amazon_data
GROUP BY monthname
ORDER BY total_cogs DESC
LIMIT 1;

-- 8. Which product line generated the highest revenue?

SELECT `Product line`, ROUND(SUM(Total),2) AS total_revenue FROM amazon_data
GROUP BY `Product line`
ORDER BY total_revenue DESC
LIMIT 1;

-- 9. In which city was the highest revenue recorded?

SELECT city, ROUND(SUM(Total),2) AS total_revenue FROM amazon_data
GROUP BY city
ORDER BY total_revenue DESC
LIMIT 1;

-- 10. Which product line incurred the highest Value Added Tax?

SELECT `Product line`, ROUND(SUM(`Tax 5%`),2) AS total_vat FROM amazon_data
GROUP BY `Product line`
ORDER BY total_vat DESC
LIMIT 1;

-- 11. For each product line, add a column indicating "Good" if its sales are above average, otherwise "Bad."

WITH avg_sales AS (
	SELECT avg(total) AS avg_total
    FROM amazon_data

),
combined_data AS (
	SELECT a.*,
		CASE WHEN a.total > avgs.avg_total THEN 'Good' ELSE 'Bad' END AS performance
        FROM amazon_data a
        INNER JOIN avg_sales avgs ON 1=1
        )
        SELECT * FROM combined_data;
        
-- 12. Identify the branch that exceeded the average number of products sold.

SELECT Branch, SUM(Quantity) AS Total_Products_Sold
FROM amazon_data
GROUP BY Branch
HAVING Total_Products_Sold > (
    SELECT AVG(Total_Sold)
    FROM (
        SELECT SUM(Quantity) AS Total_Sold
        FROM amazon_data
        GROUP BY Branch
    ) AS BranchSales
);

-- 13. Which product line is most frequently associated with each gender?

SELECT Gender, `Product line`, COUNT(*) AS product_count
FROM amazon_data
GROUP BY Gender, `Product line`
ORDER BY product_count DESC;

-- 14. Calculate the average rating for each product line.

SELECT `Product line`, ROUND(AVG(Rating),2) AS Average_Rating
FROM amazon_data
GROUP BY `Product line`;

-- 15. Count the sales occurrences for each time of day on every weekday.

SELECT dayname, timeofday, COUNT(*) AS Sales_Occurrences
FROM amazon_data
GROUP BY dayname, timeofday
ORDER BY dayname, timeofday;

-- 16. Identify the customer type contributing the highest revenue.

SELECT `Customer type`, ROUND(SUM(Total),2) AS Total_Revenue
FROM amazon_data
GROUP BY `Customer type`
ORDER BY Total_Revenue DESC
LIMIT 1;

-- 17. Determine the city with the highest VAT percentage.

SELECT City, MAX(`Tax 5%`) AS Highest_VAT_Percentage
FROM amazon_data
GROUP BY City
ORDER BY Highest_VAT_Percentage DESC
LIMIT 1;

-- 18. Identify the customer type with the highest VAT payments.

SELECT `Customer type`, SUM(`Tax 5%`) AS Total_VAT_Payments
FROM amazon_data
GROUP BY `Customer type`
ORDER BY Total_VAT_Payments DESC
LIMIT 1;

-- 19. What is the count of distinct customer types in the dataset?

SELECT COUNT(DISTINCT `Customer type`) AS Distinct_Customer_Types
FROM amazon_data;

-- 20. What is the count of distinct payment methods in the dataset?

SELECT COUNT(DISTINCT Payment) AS Distinct_Payment_Methods
FROM amazon_data;

-- 21. Which customer type occurs most frequently?

SELECT `Customer type`, COUNT(*) AS Frequency
FROM amazon_data
GROUP BY `Customer type`
ORDER BY Frequency DESC
LIMIT 1;

-- 22. Identify the customer type with the highest purchase frequency.

SELECT `Customer type`, COUNT(*) AS Purchase_Frequency
FROM amazon_data
GROUP BY `Customer type`
ORDER BY Purchase_Frequency DESC
LIMIT 1;

-- 23. Determine the predominant gender among customers.

SELECT Gender, COUNT(*) AS Gender_Count
FROM amazon_data
GROUP BY Gender
ORDER BY Gender_Count DESC
LIMIT 1;

-- 24. Examine the distribution of genders within each branch.

SELECT Branch, Gender, COUNT(*) AS Gender_Count
FROM amazon_data
GROUP BY Branch, Gender
ORDER BY Branch, Gender;

-- 25. Identify the time of day when customers provide the most ratings.

SELECT timeofday, COUNT(Rating) AS Rating_Count
FROM amazon_data
WHERE Rating IS NOT NULL
GROUP BY timeofday
ORDER BY Rating_Count DESC
LIMIT 1;

-- 26. Determine the time of day with the highest customer ratings for each branch.

SELECT Branch, timeofday, COUNT(Rating) AS Rating_Count
FROM amazon_data
WHERE Rating IS NOT NULL
GROUP BY Branch, timeofday
ORDER BY Branch, Rating_Count DESC;

-- 27. Identify the day of the week with the highest average ratings.

SELECT dayname, AVG(Rating) AS Average_Rating
FROM amazon_data
WHERE Rating IS NOT NULL
GROUP BY dayname
ORDER BY Average_Rating DESC
LIMIT 1;

-- 28. Determine the day of the week with the highest average ratings for each branch.

WITH AverageRatings AS (
    SELECT Branch, dayname, AVG(Rating) AS Average_Rating
    FROM amazon_data
    WHERE Rating IS NOT NULL
    GROUP BY Branch, dayname
)

SELECT Branch, dayname, Average_Rating
FROM AverageRatings
WHERE (Branch, Average_Rating) IN (
    SELECT Branch, MAX(Average_Rating)
    FROM AverageRatings
    GROUP BY Branch
);














