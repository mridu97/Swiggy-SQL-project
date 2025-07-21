CREATE DATABASE swiggy;

CREATE TABLE swiggy_data (id VARCHAR(20), area TEXT, city TEXT,	restaurant VARCHAR(100), price INT,	avg_ratings	DECIMAL(3,2),
total_ratings INT, food_type VARCHAR(200), address VARCHAR(200), delivery_time INT);

ALTER TABLE swiggy_data
ADD PRIMARY KEY (id);

#Sample data preview
SELECT *
FROM swiggy_data
LIMIT 5;

#Top-rated food types
SELECT food_type, AVG(avg_ratings) AS average
FROM swiggy_data 
GROUP BY food_type
ORDER BY average DESC
LIMIT 10;

#Areas in Bangalore with highest delivery times
SELECT area, AVG(delivery_time) AS del_timing_avg
FROM swiggy_data
WHERE city = 'Bangalore'
GROUP BY area 
ORDER BY del_timing_avg DESC
LIMIT 15;

#Cities with high-priced restaurants
SELECT city, Count(price) AS fancy
FROM swiggy_data
WHERE price > '2000'
GROUP BY city
ORDER BY fancy DESC;

#Cheapest good-rated restaurants
SELECT price, avg_ratings, restaurant, city
FROM swiggy_data
WHERE avg_ratings > 4.5
ORDER BY price ASC
LIMIT 20;

#Fast delivery with great ratings
SELECT restaurant, city, area, delivery_time, avg_ratings
FROM swiggy_data
WHERE delivery_time < 30
AND avg_ratings > 4.5
ORDER BY delivery_time DESC
LIMIT 20;

#Duplicate restaurants across cities
SELECT restaurant, COUNT(DISTINCT city) AS cities_present
FROM swiggy_data
GROUP BY restaurant
HAVING cities_present > 1
ORDER BY cities_present DESC;

#Common cusisine as per city
SELECT city, food_type, COUNT(*) AS total
FROM swiggy_data 
GROUP BY city, food_type
ORDER BY city, total DESC;

#Most popular food type per city
SELECT city, food_type, total
FROM ( SELECT city, food_type, COUNT(*) AS total
  FROM swiggy_data 
  GROUP BY city, food_type) AS city_counts
  WHERE (city, total) IN (SELECT city, MAX(total)
  FROM ( SELECT city, food_type, COUNT(*) AS total
  FROM swiggy_data 
  GROUP BY city, food_type) AS sub
  GROUP BY city);

#Deliverytime vs rating correlation
SELECT FLOOR(delivery_time / 10) * 10 AS delivery_bucket, ROUND(AVG(avg_ratings), 2) AS avg_rating
FROM swiggy_data
GROUP BY delivery_bucket
ORDER BY delivery_bucket DESC;














