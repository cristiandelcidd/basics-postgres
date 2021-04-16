CREATE TABLE cities (
  name VARCHAR(50),
  country VARCHAR(50),
  population INTEGER,
  area INTEGER
);

/* Insert a single value */
INSERT INTO cities (name, country, population, area)
VALUES ('Tegucigalpa', 'Honduras', 123456, 504);

/* Insert multiple values at once */
INSERT INTO cities (name, country, population, area)
VALUES
  ('San Pedro Sula', 'Honduras', 987654, 504),
  ('Monterrey', 'Mexico', 135790, 521),
  ('San Salvador', 'El Salvador', 864219, 502);

/* Query the data stored in the cities table */
SELECT * FROM cities;

SELECT name FROM cities;

SELECT name, country FROM cities;

SELECT name, population / name AS population_density FROM cities;

SELECT name, area FROM cities WHERE area = 504

SELECT name, area FROM cities WHERE country = 'Honduras'

SELECT name, population FROM cities WHERE population BETWEEN 20000 AND 25000;

SELECT name, population FROM cities WHERE name IN ('San Pedro Sula', 'Querétaro');

SELECT name, population FROM cities WHERE name NOT IN ('San Pedro Sula', 'Querétaro');

SELECT name, population FROM cities WHERE population NOT IN (20302, 59324);

SELECT name, population FROM cities WHERE population NOT IN (20302, 59324) AND name = 'San Pedro Sula';

SELECT name, population FROM cities WHERE population NOT IN (20302, 59324) OR name = 'San Pedro Sula';

SELECT name, population FROM cities WHERE population NOT IN (20302, 59324) OR name = 'San Pedro Sula' OR name = 'Tegucigalpa';

-- Update a field in a table
UPDATE cities SET name = 'Tegucigalpa' WHERE country = 'Honduras';

-- Delete a item from a table
DELETE FROM cities WHERE name = 'San Salvador';