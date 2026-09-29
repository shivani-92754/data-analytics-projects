# 1. Create a database named AirCargo and import ticket_details.csv, routes.csv, passengers_on_flights.csv, and 
# customer.csv from the given resources into it.

CREATE DATABASE AirCargo;

USE AirCargo;

# 2. Create an ER diagram for the given airlines' database : COMPLETED

# 3. Write a query to display all the passengers who have traveled on routes 01 to 25 from the passengers_on_flights table.

SELECT * FROM passengers_on_flights
WHERE route_id BETWEEN 1 AND 25;

# 4. Write a query to identify the number of passengers and total revenue in business class from the ticket_details table.

SELECT 
	SUM(no_of_tickets) AS total_passengers,
    SUM(no_of_tickets * Price_per_ticket) AS total_revenue
FROM ticket_details
WHERE class_id = 'Business';

# 5. Write a query to display the full name of the customer by extracting the first name and last name from the customer table.

SELECT
	CONCAT(first_name, ' ', last_name)
AS full_name FROM customer;

# 6. Write a query to extract the customers who have registered and booked a ticket from the customer and ticket_details tables.

SELECT
	c. customer_id,
	c. first_name,
	c. last_name,
	t. p_date,
	t. no_of_tickets
FROM customer c
INNER JOIN ticket_details t
ON c.customer_id = t.customer_id;

# 7. Write a query to identify the customer’s first name and last name based on their customer ID and brand 
# (Emirates) from the ticket_details table.

SELECT
	c. customer_id,
	c. first_name,
	c. last_name,
	t. brand
FROM customer c
INNER JOIN ticket_details t
ON c.customer_id = t.customer_id
WHERE t.brand = 'Emirates';


# 8. Write a query to identify the customers who have traveled by Economy Plus class using the sub-query 
# on the passengers_on_flights table.

SELECT *
FROM customer
WHERE customer_id IN
(
SELECT customer_id
FROM passengers_on_flights
WHERE class_id = 'Economy Plus'
);


# 9. Write a query to determine whether the revenue has crossed 10000 using the IF clause on the 
# ticket_details table.

SELECT
	SUM(no_of_tickets * price_per_ticket) AS total_revenue,
    IF(SUM(no_of_tickets * price_per_ticket) > 10000,
		'Revenue crossed 10000',
        'Revenue did not cross 10000'
	) AS revenue_status
FROM ticket_details;


# 10. Write a query to create and grant access to a new user to perform database operations.

CREATE USER 'aircargo_user'@'localhost'
IDENTIFIED BY 'AirCargo@123';

GRANT ALL PRIVILEGES
ON AirCargo.*
TO 'aircargo_user'@'localhost';

FLUSH PRIVILEGES;

# 11. Write a query to find the maximum ticket price for each class using window functions on the 
# ticket_details table.

SELECT
	class_id,
    price_per_ticket,
    MAX(Price_per_ticket) OVER
(PARTITION BY class_id) AS
max_ticket_price
FROM ticket_details;

# 12. Write a query to extract the passengers whose route ID is 4 by improving the speed and performance 
# of the passengers_on_flights table using the index.

CREATE INDEX idx_route_id
ON passengers_on_flights(route_id);

SELECT * FROM passengers_on_flights
WHERE route_id = 4;

# 13. For route ID 4, write a query to view the execution plan of the passengers_on_flights table.

EXPLAIN
SELECT * FROM passengers_on_flights
WHERE route_id = 4;

# 14. Write a query to calculate the total price of all tickets booked by a customer across different aircraft 
# IDs using the rollup function.

SELECT
	customer_id,
    aircraft_id,
    SUM(no_of_tickets * Price_per_ticket) AS total_price
    FROM ticket_details
    GROUP BY customer_id, aircraft_id WITH ROLLUP;

# 15. Write a query to create a view with only business class customers and the airline brand.

CREATE VIEW business_class_customers AS 
SELECT
	customer_id,
    class_id,
    brand
FROM ticket_details
WHERE class_id = 'Business';

SELECT * FROM business_class_customers;


# 16. Write a query to create a stored procedure that extracts all the details from the routes table where the 
# traveled distance is more than 2000 miles.

USE `aircargo`;
DROP procedure IF EXISTS `Get_Long_Distance_Routes`;

DELIMITER $$
USE `aircargo`$$
CREATE PROCEDURE Get_Long_Distance_Routes ()
BEGIN
	SELECT * FROM routes
    WHERE distance_miles > 2000;
    
END;$$

DELIMITER ;

CALL Get_Long_Distance_Routes();


# 17. Using GROUP BY, determine the total number of tickets purchased by each customer and the total price paid.

SELECT
	customer_id,
    SUM(no_of_tickets) AS total_tickets, 
    SUM(no_of_tickets * Price_per_ticket) AS total_price_paid
FROM ticket_details
GROUP BY customer_id;

# 18. Calculate the average number of passengers per flight route.

SELECT
	route_id,
    ROUND(COUNT(customer_id) / 
    COUNT(DISTINCT flight_num), 2) 
AS average_passengers
FROM passengers_on_flights
GROUP BY route_id;


