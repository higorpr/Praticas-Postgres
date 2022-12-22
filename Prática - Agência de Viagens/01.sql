CREATE DATABASE travel_agency;

CREATE TABLE companies (
    id SERIAL PRIMARY KEY NOT NULL,
    acronym VARCHAR(3) NOT NULL UNIQUE,
    name TEXT NOT NULL UNIQUE
);

CREATE TABLE airports (
    id SERIAL PRIMARY KEY NOT NULL,
    name TEXT NOT NULL UNIQUE,
    acronym VARCHAR(3) NOT NULL UNIQUE
);


CREATE TABLE flights (
    id SERIAL PRIMARY KEY NOT NULL,
    flight_number TEXT NOT NULL UNIQUE,
    id_departure_airport INTEGER NOT NULL REFERENCES airports(id),
    id_arrival_airport INTEGER NOT NULL REFERENCES airports(id),
    time_departure TIMESTAMP WITHOUT TIME ZONE NOT NULL,
    time_arrival TIMESTAMP WITHOUT TIME ZONE NOT NULL
);

CREATE TABLE companies_flights (
    id SERIAL PRIMARY KEY NOT NULL,
    company_id INTEGER NOT NULL REFERENCES companies(id),
    flgiht_id INTEGER NOT NULL REFERENCES flights(id)
);