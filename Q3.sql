-- Q3
DROP TABLE IF EXISTS PRODUCTS;

-- Step 1: Create the products table
CREATE TABLE PRODUCTS (
	PRODUCT_ID INT PRIMARY KEY,
	PRODUCT_NAME VARCHAR(50),
	CATEGORY VARCHAR(50),
	QUANTITY_SOLD INT
);

-- Step 2: Insert sample records into the products table
INSERT INTO
	PRODUCTS (PRODUCT_ID, PRODUCT_NAME, CATEGORY, QUANTITY_SOLD)
VALUES
	(1, 'Samsung Galaxy S20', 'Electronics', 100),
	(2, 'Apple iPhone 12 Pro', 'Electronics', 150),
	(3, 'Sony PlayStation 5', 'Electronics', 80),
	(4, 'Nike Air Max 270', 'Clothing', 200),
	(5, 'Adidas Ultraboost 20', 'Clothing', 200),
	(6, 'Levis Mens 501 Jeans', 'Clothing', 90),
	(
		7,
		'Instant Pot Duo 7-in-1',
		'Home & Kitchen',
		180
	),
	(
		8,
		'Keurig K-Classic Coffee Maker',
		'Home & Kitchen',
		130
	),
	(
		9,
		'iRobot Roomba 675 Robot Vacuum',
		'Home & Kitchen',
		130
	),
	(
		10,
		'Breville Compact Smart Oven',
		'Home & Kitchen',
		90
	),
	(
		11,
		'Dyson V11 Animal Cordless Vacuum',
		'Home & Kitchen',
		90
	);

/*

Questions : 
Write SQL query to find the top-selling products in each category

assuming products table has column 
product_id, product_name, category, quantity_sold
*/
SELECT
	*
FROM
	PRODUCTS;

SELECT
	*
FROM
	(
		SELECT
			*,
			RANK() OVER (
				PARTITION BY
					CATEGORY
				ORDER BY
					QUANTITY_SOLD DESC
			) RANKS
		FROM
			PRODUCTS
		ORDER BY
			CATEGORY,
			QUANTITY_SOLD DESC
	) AS SUBQ
WHERE
	RANKS = 1;