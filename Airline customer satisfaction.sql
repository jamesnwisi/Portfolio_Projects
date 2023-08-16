CREATE DATABASE customer_satisfaction;
USE customer_satisfaction;
SELECT * FROM airline_customers;

/*OBJ1: Analyze Overall Airline Customer Satisfaction:
 Calculate and analyze the average satisfaction rating across all passengers
 to assess the overall level of satisfaction with the airline services.*/
 
SELECT DISTINCT satisfaction FROM airline_customers; 
# OVERALL AIRLINE CUSTOMER
SELECT COUNT(satisfaction) AS AIRLINE_CUSTOMER FROM airline_customers; 

# OVERALL SATISFIED AND DISSATISFIED CUSTOMERS
SELECT COUNT(satisfaction) SATISFIED,(SELECT COUNT(satisfaction) AS COUNT FROM airline_customers WHERE satisfaction = 'dissatisfied')DISSATISIED 
FROM airline_customers WHERE satisfaction = 'satisfied';

SELECT * FROM airline_customers;

SELECT DISTINCT Gender FROM airline_customers;
# NUMBER OF CUSTOMERS BY GENDER
SELECT Gender, COUNT(Gender)'NO. OF CUSTOMERS'  FROM airline_customers GROUP BY Gender;

# OVARALL SATISFIED MALE AND FEMALE
SELECT Gender, count(satisfaction) AS 'Satisfied customers' , satisfaction
FROM airline_customers WHERE satisfaction = 'satisfied' GROUP BY satisfaction, gender ORDER BY satisfaction;

# OVARALL DISSATISFIED MALE AND FEMALE
SELECT Gender, count(satisfaction) AS 'Dissatisfied customers' , satisfaction
FROM airline_customers WHERE satisfaction = 'Dissatisfied' GROUP BY satisfaction, gender ORDER BY satisfaction;

# AVERAGE PERCENTGE OF SATISFIED CUSTOMERS
SELECT
	SUM(CASE WHEN satisfaction = 'satisfied' THEN 1 ELSE 0 END) AS Satisfied_count,
    SUM(CASE WHEN satisfaction = 'dissatisfied' THEN 1 ELSE 0 END) AS Dissatisfied_count,
    (SUM(CASE WHEN satisfaction = 'satisfied' THEN 1 ELSE 0 END) / 
    (SUM(CASE WHEN satisfaction = 'satisfied' THEN 1 ELSE 0 END) +
    SUM(CASE WHEN satisfaction = 'dissatisfied' THEN 1 ELSE 0 END))) * 100 AS Satisfaction_percentage
FROM airline_customers;

