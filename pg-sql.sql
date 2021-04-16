-- length (10) in this case
SELECT LENGTH('Hola Mundo');

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

--
CREATE TABLE users(
	id SERIAL PRIMARY KEY,
  username VARCHAR(250)
);

INSERT INTO users (username)
VALUES
	('pedro123'),
  ('fran4d'),
  ('federrico8g'),
  ('reinaldo'),
  ('fakundra');

CREATE TABLE photos(
	id SERIAL PRIMARY KEY,
  url VARCHAR(250),
  user_id INTEGER REFERENCES users(id)
);

INSERT INTO photos(url, user_id)
VALUES
	('https://image1.jpg', 1),
  ('https://image2.jpg', 2),
  ('https://image3.jpg', 3),
  ('https://image4.jpg', 4);

CREATE TABLE comments(
	id SERIAL PRIMARY KEY,
  contents VARCHAR(250),
  user_id INTEGER REFERENCES users(id),
  photo_id INTEGER REFERENCES photos(id)
);

INSERT INTO comments(contents, user_id, photo_id)
VALUES
	('Integer tristique volutpat diam ut.', 1, 1),
  ('Morbi eu justo at magna.', 2, 3),
  ('In eu tincidunt ex. Ut.', 3, 2),
  ('Etiam volutpat orci aliquam metus.', 4, 4),
  ('Vestibulum eleifend quam felis, ut.', 4, 3),
  ('Maecenas nisl leo, dictum eget.', 1, 1),
  ('Phasellus id velit metus. In.', 2, 3),
  ('Vestibulum aliquam nibh sed augue.', 3, 1),
  ('Integer tristique volutpat diam ut.', 5, 2);

SELECT photo_id, COUNT(*) FROM comments GROUP BY photo_id;

-- exercise

CREATE TABLE authors (
	id SERIAL PRIMARY KEY,
  name VARCHAR(240)
);

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

SELECT author_id, COUNT(*) as books_authored
FROM books
GROUP BY author_id;

-- Grouping with JOIN
SELECT name, COUNT(*) as books_authored
FROM books
JOIN authors ON authors.id = books.author_id
GROUP BY authors.name;

-- end the exercise

-- Using HAVING with GROUP BY
SELECT photo_id, COUNT(*)
FROM comments
WHERE photo_id < 3
GROUP BY photo_id
HAVING COUNT(*) > 2;

SELECT user_id, COUNT(*)
FROM comments WHERE photo_id <= 3
GROUP BY user_id
HAVING COUNT(*) >= 2