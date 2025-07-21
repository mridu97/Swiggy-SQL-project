# 🧾 Swiggy food delivery data analysis with SQL

This repository showcases SQL-based exploratory data analysis performed on a cleaned dataset of Swiggy food delivery data. The aim of the project is to uncover meaningful insights about food types, restaurant performance, delivery times, and city-wise cuisine preferences using SQL queries.

---

## 📂 Project overview

- **Database used:** MySQL  
- **Dataset name:** `swiggy_data`
- **Data Cleaning & Preprocessing**: Python (Pandas) 
- **Source:** Assumed synthetic dataset structured similarly to Swiggy's real-world restaurant listings and delivery information.

The dataset contains fields such as:
- `id` (Primary Key)
- `area`, `city`, `restaurant`
- `price`, `avg_ratings`, `total_ratings`
- `food_type`, `address`, `delivery_time`

---

##  Project workflow

**Data cleaning**
   - Removed null values and outliers.
   - Standardized columns like delivery times and ratings.
   - Normalized cuisine data for consistency.

**Exploratory data analysis**
   - Identified trends in ratings, delivery times, pricing, and restaurant distribution.
   - Analyzed user-friendly metrics such as quick delivery options and affordable high-rated restaurants.

**Business insights**
   - Found top-performing cuisines per city.
   - Discovered cities with high-end restaurants.
   - Examined correlation between delivery time and customer ratings.
   - Certain restaurants have expanded across multiple cities, indicating strong brand presence.
   - Higher-rated restaurants do not always mean higher prices.
   - Fast delivery and high customer ratings can co-exist, revealing efficient operations in certain areas.
   - Certain areas have consistently slower delivery — a potential logistics improvement area.
   - Certain restaurants have expanded across multiple cities, indicating strong brand presence.


## Database & table setup

CREATE DATABASE swiggy;

CREATE TABLE swiggy_data (id VARCHAR(20), area TEXT, city TEXT,	restaurant VARCHAR(100), price INT,	avg_ratings	DECIMAL(3,2),
total_ratings INT, food_type VARCHAR(200), address VARCHAR(200), delivery_time INT);

ALTER TABLE swiggy_data
ADD PRIMARY KEY (id);


# Note: 
The food_type column originally contained multiple cuisines in a single string (e.g., "Chinese, North Indian"). Before running the query for *Most popular food type per city*, I used Python (Pandas) to split these multi-cuisine strings into separate rows for accurate analysis. I have mentioned the code below.

<pre>```
df['food_type'] = df['food_type'].fillna('')
df = df.assign(food_type=df['food_type'].str.split(',')).explode('food_type')
df['food_type'] = df['food_type'].str.strip()
df.to_sql('swiggy_data', con=engine, if_exists='replace', index=False) ```</pre>

