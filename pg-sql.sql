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

SELECT name, area FROM cities WHERE area = 504

SELECT name, area FROM cities WHERE country = 'Honduras'

SELECT name, population FROM cities WHERE population BETWEEN 20000 AND 25000;

SELECT name, population FROM cities WHERE name IN ('San Pedro Sula', 'Querétaro');

SELECT name, population FROM cities WHERE name NOT IN ('San Pedro Sula', 'Querétaro');

SELECT name, population FROM cities WHERE population NOT IN (20302, 59324);

SELECT name, population FROM cities WHERE population NOT IN (20302, 59324) AND name = 'San Pedro Sula';

SELECT name, population FROM cities WHERE population NOT IN (20302, 59324) OR name = 'San Pedro Sula';

SELECT name, population FROM cities WHERE population NOT IN (20302, 59324) OR name = 'San Pedro Sula' OR name = 'Tegucigalpa';

-- Exercise

SELECT name, units_sold FROM phones WHERE units_sold > 5000;

SELECT name, manufacturer FROM phones WHERE manufacturer IN ('Samsung', 'Apple');

SELECT name, manufacturer FROM phones WHERE manufacturer = 'Samsung' OR manufacturer = 'Apple';

-- end the exercise

-- Exercise

SELECT name, price * units_sold AS total_revenue FROM phones WHERE price * units_sold > 1000000;

-- Update a field in a table
UPDATE cities SET name = 'Tegucigalpa' WHERE country = 'Honduras';

-- Delete a item from a table
DELETE FROM cities WHERE name = 'San Salvador';

-- Exercise

UPDATE phones SET units_sold = 7000 WHERE name = 'N1280';

DELETE FROM phones WHERE manufacturer = 'Samsung';

-- end the Exercise

CREATE TABLE users (
	id SERIAL PRIMARY KEY,
  username VARCHAR(50)
);

INSERT INTO users (username)
VALUES
	('pedro123'),
  ('fran4d'),
  ('federrico8g'),
  ('reinaldo'),
  ('fakundra');

SELECT * FROM users;

CREATE TABLE photos(
	id SERIAL PRIMARY KEY,
  url VARCHAR(200),
  user_id INTEGER REFERENCES users(id)
);

INSERT INTO photos(url, user_id)
VALUES
	('https://image1.jpg', 1),
  ('https://image2.jpg', 2),
  ('https://image3.jpg', 3),
  ('https://image4.jpg', 4);

SELECT * FROM photos;

SELECT * FROM photos WHERE user_id = 2;

SELECT * FROM photos JOIN users ON users.id = photos.user_id;

-- Exercise

CREATE TABLE boats (
  id SERIAL PRIMARY KEY,
  name VARCHAR
);

INSERT INTO boats(name)
VALUES
	('Rogue Wave'),
  ('Harbor Master');

CREATE TABLE crew_members (
	id SERIAL PRIMARY KEY,
  first_name VARCHAR,
  boat_id INTEGER REFERENCES boats(id)
);

INSERT INTO crew_members(first_name, boat_id)
VALUES ('Patricio', 1), ('Eliza', 2), ('Marcos', 1);

SELECT * FROM crew_members
JOIN boats ON boats.id = crew_members.boat_id;

-- end the exercise

INSERT INTO photos (url, user_id)
VALUES ('https://image.jpg', NULL);

DROP TABLE photos;

CREATE TABLE photos(
	id SERIAL PRIMARY KEY,
  url VARCHAR(200),
  user_id INTEGER REFERENCES users(id) ON DELETE CASCADE
);

INSERT INTO photos(url, user_id)
VALUES
	('https://image1.jpg', 1),
  ('https://image2.jpg', 2),
  ('https://image3.jpg', 3),
  ('https://image4.jpg', 2);


DELETE FROM users WHERE id = 1


CREATE TABLE photos(
	id SERIAL PRIMARY KEY,
  url VARCHAR(200),
  user_id INTEGER REFERENCES users(id) ON DELETE SET NULL
);


CREATE TABLE comments(
	id SERIAL PRIMARY KEY,
  contents VARCHAR(240),
  user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
  photo_id INTEGER REFERENCES photos(id) ON DELETE CASCADE
);

INSERT INTO comments(contents, user_id, photo_id)
VALUES
	('Integer tristique volutpat diam ut.', 1, 1),
  ('Morbi eu justo at magna.', 2, 3),
  ('In eu tincidunt ex. Ut.', 3, 2),
  ('Etiam volutpat orci aliquam metus.', 4, 4),
  ('Vestibulum eleifend quam felis, ut.', 5, 6),
  ('Maecenas nisl leo, dictum eget.', 1, 5),
  ('Phasellus id velit metus. In.', 2, 8),
  ('Vestibulum aliquam nibh sed augue.', 3, 7);

SELECT contents, username FROM COMMENTS JOIN users ON users.id = comments.user_id;

SELECT * FROM comments JOIN users ON users.id = comments.user_id;

SELECT contents, url FROM comments JOIN photos ON photos.id = comments.photo_id;

-- Exercise

CREATE TABLE authors (
	id SERIAL PRIMARY KEY,
  name VARCHAR(240)
)

INSERT INTO authors(name)
VALUES
	('JK Rowling'),
  ('Stephen King'),
  ('Jorge Montenegro'),
  ('Ramon Amaya Amador');

CREATE TABLE books (
  id SERIAL PRIMARY KEY,
  title VARCHAR(240),
  author_id INTEGER REFERENCES authors(id) ON DELETE CASCADE
);

INSERT INTO books (title, author_id)
VALUES
  ('It', 2),
  ('Harry Potter', 1),
  ('Prision verde', 4),
  ('Cuentos y leyendas de Honduras', 3);

SELECT title, name FROM books JOIN authors ON authors.id = books.author_id;

-- end the exercise

-- SELECT b.id AS book_id,	title, name FROM books b JOIN authors ON authors.id = b.author_id;
SELECT b.id AS book_id,	title, name FROM books AS b JOIN authors ON authors.id = b.author_id;

INSERT INTO books(title, author_id)
VALUES
	('Jacinta Peralta', NULL)


-- Four kinds of Joins

-- INNER JOIN
SELECT * FROM books JOIN authors ON authors.id = books.author_id;
SELECT * FROM books INNER JOIN authors ON authors.id = books.author_id;

-- LEFT OUTER JOIN
SELECT * FROM books LEFT JOIN authors ON authors.id = books.author_id;

-- RIGHT OUTER JOIN
SELECT * FROM books RIGHT JOIN authors ON authors.id = books.author_id;

-- FULL JOIN
SELECT * FROM books FULL JOIN authors ON authors.id = books.author_id;


-- Exercise
SELECT name, title FROM authors LEFT JOIN books ON books.author_id = authors.id;

SELECT name, title FROM books RIGHT JOIN authors ON  authors.id = books.author_id;

-- end the exercise

SELECT url, contents, username FROM comments
JOIN photos ON photos.id = comments.photo_id
JOIN users ON users.id = photos.user_id AND users.id = comments.user_id;


-- Exercise
CREATE TABLE reviews (
	id SERIAL PRIMARY KEY,
  rating INTEGER,
  reviewer_id INTEGER REFERENCES authors(id) ON DELETE CASCADE,
  book_id INTEGER REFERENCES books(id) ON DELETE CASCADE
)

INSERT INTO reviews(rating, reviewer_id, book_id)
VALUES
	(4, 1, 4),
  (5, 3, 2),
  (3, 2, 3),
  (2, 4, 1);

-- end the exercise


-- Using GROUP BY
SELECT reviewer_id
FROM reviews
GROUP BY reviewer_id;

--
SELECT MAX(id) FROM reviews; -- Max
SELECT MIN(id) FROM reviews; -- Min
SELECT AVG(id) FROM reviews; -- Average
SELECT COUNT(id) FROM reviews; -- How many id's are there
SELECT SUM(id) FROM reviews; -- Sum of id's

SELECT reviewer_id, MAX(id) FROM reviews GROUP BY reviewer_id;

SELECT reviewer_id, COUNT(id) FROM reviews GROUP BY reviewer_id;

SELECT COUNT(author_id) FROM books;

SELECT COUNT(*) FROM books;

SELECT reviewer_id, COUNT(*) FROM reviews GROUP BY reviewer_id;