-- ------------------------------< O'CHIRISH >---------------------------

DROP TABLE IF EXISTS library_book;
DROP TABLE IF EXISTS book_publisher;
DROP TABLE IF EXISTS author_book;
DROP TABLE IF EXISTS libraries;
DROP TABLE IF EXISTS publishers;
DROP TABLE IF EXISTS books;
DROP TABLE IF EXISTS authors;

-- ------------------------------< YARATISH >----------------------------

CREATE TABLE IF NOT EXISTS authors(
	auth_id UUID DEFAULT uuid_generate_v4() UNIQUE,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	bio TEXT,
	created_at TIMESTAMP
);

CREATE TABLE IF NOT EXISTS books(
	book_id UUID DEFAULT uuid_generate_v4() UNIQUE,
	title VARCHAR(100),
	summary TEXT,
	published_date DATE,
	metadata JSON,
	updated_at TIMESTAMP
);

CREATE TABLE IF NOT EXISTS publishers(
	pub_id UUID DEFAULT uuid_generate_v4() UNIQUE,
	p_name VARCHAR(100),
	country CHAR(2),
	founded_year INTEGER,
	details JSON,
	created_at TIMESTAMP
);

CREATE TABLE IF NOT EXISTS libraries(
	lib_id UUID DEFAULT uuid_generate_v4() UNIQUE,
	lib_name VARCHAR(100),
	lib_location TEXT,
	open_time TIME,
	close_time TIME,
	facilities JSON,
	lib_created_at TIMESTAMP
);

-- ---------------------------------< ULASH >---------------------------------------

CREATE TABLE IF NOT EXISTS author_book(
	auth_id INTEGER REFERENCES authors(auth_id), 
	book_id INTEGER REFERENCES books(book_id)
);

CREATE TABLE IF NOT EXISTS book_publisher(
	book_id INTEGER REFERENCES books(book_id),
	pub_id INTEGER REFERENCES publishers(pub_id)
);

CREATE TABLE IF NOT EXISTS library_book(
	lib_id INTEGER REFERENCES libraries(lib_id),
	book_id INTEGER REFERENCES books(book_id) 
);