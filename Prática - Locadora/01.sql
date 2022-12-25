CREATE TABLE movies (
    id SERIAL PRIMARY KEY NOT NULL,
    "name" TEXT NOT NULL UNIQUE
);

CREATE TABLE discs(
    id SERIAL PRIMARY KEY NOT NULL,
    serial_number INTEGER NOT NULL,
    bar_code INTEGER NOT NULL,
    movie_id INTEGER NOT NULL REFERENCES movies(id)
);

CREATE TABLE categories (
    id SERIAL PRIMARY KEY NOT NULL,
    "name" TEXT NOT NULL UNIQUE
);

CREATE TABLE movies_categories (
    id SERIAL PRIMARY KEY NOT NULL,
    movie_id INTEGER NOT NULL REFERENCES movies(id),
    category_id INTEGER NOT NULL REFERENCES categories(id)
);

CREATE TABLE actors(
    id SERIAL PRIMARY KEY NOT NULL,
    "name" TEXT NOT NULL UNIQUE,
    origin TEXT NOT NULL,
    birth DATE NOT NULL
);

CREATE TABLE movies_actors (
    id SERIAL PRIMARY KEY NOT NULL,
    movie_id INTEGER NOT NULL REFERENCES movies(id),
    actor_id INTEGER NOT NULL REFERENCES actors(id)
);

CREATE TABLE states (
    id SERIAL PRIMARY KEY NOT NULL,
    "name" TEXT NOT NULL
);

CREATE TABLE cities (
    id SERIAL PRIMARY KEY NOT NULL,
    "name" TEXT NOT NULL,
    state_id INTEGER NOT NULL REFERENCES states(id)
);

CREATE TABLE districts (
    id SERIAL PRIMARY KEY NOT NULL,
    "name" TEXT NOT NULL,
    city_id INTEGER NOT NULL REFERENCES cities(id)
);

CREATE TABLE addresses (
    id SERIAL PRIMARY KEY NOT NULL,
    street TEXT NOT NULL,
    "number" INTEGER NOT NULL,
    complement TEXT,
    district_id INTEGER NOT NULL REFERENCES districts(id),
    zip_code TEXT NOT NULL
);

CREATE TABLE clients (
    id SERIAL PRIMARY KEY NOT NULL,
    "name" TEXT NOT NULL UNIQUE,
    cpf INTEGER NOT NULL UNIQUE,
    address_id INTEGER NOT NULL
);

CREATE TABLE phones (
    id SERIAL PRIMARY KEY NOT NULL,
    "number" TEXT NOT NULL UNIQUE
);

CREATE TABLE clients_phones (
    id SERIAL PRIMARY KEY NOT NULL,
    client_id INTEGER NOT NULL,
    phone_id INTEGER NOT NULL
);

CREATE TABLE rentals (
    id SERIAL PRIMARY KEY NOT NULL,
    client_id INTEGER NOT NULL REFERENCES clients(id),
    rental_date DATE NOT NULL,
    delivery_date DATE,
    service_rating INTEGER
);

CREATE TABLE discs_rentals (
    id SERIAL PRIMARY KEY NOT NULL,
    disc_id INTEGER NOT NULL REFERENCES discs(id),
    rental_id INTEGER NOT NULL REFERENCES rentals(id),
    movie_rating INTEGER NOT NULL
);