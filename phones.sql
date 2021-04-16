CREATE TABLE phones (
  name VARCHAR(50),
  manufacturer VARCHAR(50),
  price INTEGER,
  units_sold INTEGER
);

INSERT INTO phones(name, manufacturer, price, units_sold)
VALUES
  ( 'N1280', 'Nokia', 199, 1925 ),
  ( 'Iphone XII', 'Apple', 399, 9436 ),
  ( 'S21 Plus', 'Samsung', 299, 2359 ),
  ( 'S20 Ultra', 'Samsung', 250, 2385 ),
  ( 'N8', 'Nokia', 150, 7543 );


SELECT * FROM phones;
SELECT name, price * units_sold AS revenue FROM phones;

-- concatenate name, manufacturer
SELECT name || ', ' || manufacturer AS model FROM phones;
SELECT CONCAT(name, ', ', manufacturer) AS model_brand FROM phones;

-- UPPERCASE
SELECT CONCAT(UPPER(name), ', ', UPPER(manufacturer)) AS model_brand FROM phones;
SELECT UPPER(CONCAT(name, ', ', manufacturer)) AS model_brand FROM phones;

-- lowercase
SELECT LOWER(CONCAT(name, ', ', manufacturer)) AS model_brand FROM phones;

-- Exercise

SELECT name, units_sold FROM phones WHERE units_sold > 5000;

SELECT name, manufacturer FROM phones WHERE manufacturer IN ('Samsung', 'Apple');

SELECT name, manufacturer FROM phones WHERE manufacturer = 'Samsung' OR manufacturer = 'Apple';

-- end the exercise

-- Exercise

SELECT name, price * units_sold AS total_revenue FROM phones WHERE price * units_sold > 1000000;

-- end the exercise

-- Exercise

UPDATE phones SET units_sold = 7000 WHERE name = 'N1280';

DELETE FROM phones WHERE manufacturer = 'Samsung';

-- end the Exercise

-- Exercise

SELECT manufacturer, SUM(price*units_sold) as total_revenue
FROM phones
GROUP BY manufacturer
HAVING SUM(price*units_sold) > 2000000;

-- end the exercise

-- Exercise

SELECT name FROM phones
ORDER BY price DESC
LIMIT 2
OFFSET 1;

-- end the exercise