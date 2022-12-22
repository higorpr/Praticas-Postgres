CREATE DATABASE curso;

CREATE TABLE classes (
    id SERIAL PRIMARY KEY NOT NULL,
    class_code TEXT NOT NULL UNIQUE
);

CREATE TABLE modules (
    id SERIAL PRIMARY KEY NOT NULL,
    "name" TEXT NOT NULL UNIQUE
);

CREATE TABLE students (
    id SERIAL PRIMARY KEY NOT NULL,
    "name" TEXT NOT NULL,
    cpf VARCHAR(11) NOT NULL UNIQUE,
    email TEXT NOT NULL,
    current_class_id INTEGER NOT NULL REFERENCES classes(id)
);

CREATE TYPE "grade_type" AS ENUM (
    'Abaixo das Expectativas',
    'Dentro das Expectativas',
    'Acima das Expectativas'
);

CREATE TABLE projects (
    id SERIAL PRIMARY KEY NOT NULL,
    "name" TEXT NOT NULL,
    student_id INTEGER NOT NULL REFERENCES students(id),
    due_date TIMESTAMP WITHOUT TIME ZONE NOT NULL,
    grade "grade_type",
    module_id INTEGER NOT NULL REFERENCES modules(id)
);

CREATE TABLE student_class_history (
    id SERIAL PRIMARY KEY NOT NULL,
    student_id INTEGER NOT NULL REFERENCES students(id),
    class_id INTEGER NOT NULL REFERENCES classes(id),
    date_in DATE NOT NULL,
    date_out DATE,
    "order" SERIAL NOT NULL
);