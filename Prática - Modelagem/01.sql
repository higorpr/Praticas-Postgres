-- Create database
CREATE DATABASE practice_modeling
 -- Create clients table
CREATE TABLE clients (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    password TEXT NOT NULL
);
-- Create purchases table
CREATE TABLE purchases (
    id SERIAL PRIMARY KEY,
    client_id INTEGER NOT NULL REFERENCES "clients"("id"),
    state TEXT NOT NULL,
    purchase_date TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT NOW()
);
-- Create products table
CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    price INTEGER NOT NULL,
    picture TEXT NOT NULL,
    category TEXT NOT NULL,
    size TEXT NOT NULL
);
-- Create middle table that links purchases and products
CREATE TABLE purchase_product (
    id SERIAL PRIMARY KEY,
    purchase_id INTEGER NOT NULL REFERENCES "purchases"("id"),
    product_id INTEGER NOT NULL REFERENCES "products"("id")
);