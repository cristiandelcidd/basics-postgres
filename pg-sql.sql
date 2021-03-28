CREATE TABLE cities (
  name VARCHAR(50),
  country VARCHAR(50),
  population INTEGER,
  area INTEGER
)

/* Insert a single value */
INSERT INTO cities (name, country, population, area)
VALUES ('Tegucigalpa', 'Honduras', 123456, 504)

/* Insert multiple values at once */
INSERT INTO cities (name, country, population, area)
VALUES
  ('San Pedro Sula', 'Honduras', 987654, 504),
  ('Monterrey', 'Mexico', 135790, 521),
  ('San Salvador', 'El Salvador', 864219, 502)

/* Query the data stored in the cities table */
SELECT * FROM cities

SELECT name FROM cities

SELECT name, country FROM cities

SELECT name, population / name AS population_density FROM cities;

-- Exercise

CREATE TABLE phones (
  name VARCHAR(50),
  manufacturer VARCHAR(50),
  price INTEGER,
  units_sold INTEGER
)

INSERT INTO phones(name, manufacturer, price, units_sold)
VALUES
  ( 'N1280', 'Nokia', 199, 1925 ),
  ( 'Iphone XII', 'Apple', 399, 9436 ),
  ( 'S21 Plus', 'Samsung', 299, 2359 ),
  ( 'S20 Ultra', 'Samsung', 250, 2385 ),
  ( 'N8', 'Nokia', 150, 7543 )

SELECT * FROM phones

SELECT name, price * units_sold AS revenue FROM phones;

-- end the Exercise

-- concatenate name, manufacturer
SELECT name || ', ' || manufacturer AS model FROM phones;

SELECT CONCAT(name, ', ', manufacturer) AS model_brand FROM phones;

-- UPPERCASE
SELECT CONCAT(UPPER(name), ', ', UPPER(manufacturer)) AS model_brand FROM phones;
SELECT UPPER(CONCAT(name, ', ', manufacturer)) AS model_brand FROM phones;

-- lowercase
SELECT LOWER(CONCAT(name, ', ', manufacturer)) AS model_brand FROM phones;

-- length (10) in this case
SELECT LENGTH('Hola Mundo');
