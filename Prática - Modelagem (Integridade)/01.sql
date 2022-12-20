CREATE TABLE "customers" (
    id SERIAL PRIMARY KEY NOT NULL,
    "fullName" TEXT NOT NULL,
    cpf VARCHAR(11) NOT NULL UNIQUE,
    email TEXT NOT NULL UNIQUE,
    password TEXT NOT NULL
);

CREATE TABLE "bankAccount" (
    id SERIAL PRIMARY KEY NOT NULL,
    "customerId" INTEGER NOT NULL,
    "accountNumber" TEXT NOT NULL UNIQUE,
    agency TEXT NOT NULL,
    "openDate" DATE NOT NULL DEFAULT NOW(),
    "clodeDate" DATE
);

CREATE TYPE "transactionType" AS ENUM ('deposit', 'withdraw');

CREATE TABLE "transactions" (
    id SERIAL PRIMARY KEY NOT NULL,
    "bankAccountId" INTEGER NOT NULL,
    amount INTEGER NOT NULL,
    "type" "transactionType" NOT NULL DEFAULT 'withdraw',
    "time" TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT NOW(),
    description TEXT NOT NULL,
    cancelled BOOLEAN
);

CREATE TABLE "creditCards" (
    id SERIAL PRIMARY KEY NOT NULL,
    "bankAccountId" INTEGER NOT NULL,
    name TEXT NOT NULL,
    number TEXT NOT NULL UNIQUE,
    "securityCode" TEXT NOT NULL,
    "expirationMonth" INTEGER NOT NULL,
    "expirationYear" INTEGER NOT NULL,
    password TEXT NOT NULL,
    "limit" INTEGER NOT NULL
);

CREATE TABLE "states" (
    id SERIAL PRIMARY KEY NOT NULL,
    name TEXT NOT NULL
);

CREATE TABLE "cities" (
    id SERIAL PRIMARY KEY NOT NULL,
    name TEXT NOT NULL,
    "stateId" INTEGER NOT NULL
);

CREATE TABLE "customerAddresses" (
    id SERIAL NOT NULL PRIMARY KEY,
    "customerId" INTEGER NOT NULL UNIQUE,
    street TEXT NOT NULL,
    number INTEGER NOT NULL,
    complement TEXT,
    "postalCode" TEXT NOT NULL,
    "cityId" INTEGER NOT NULL
);

CREATE TYPE "phoneType" AS ENUM ('landline', 'mobile');

CREATE TABLE "customerPhones" (
    id SERIAL PRIMARY KEY NOT NULL,
    "customerId" INTEGER NOT NULL,
    number TEXT NOT NULL,
    "type" "phoneType" NOT NULL
);

ALTER TABLE
    "transactions"
ADD
    CONSTRAINT "transactions_fk0" FOREIGN KEY ("bankAccountId") REFERENCES "bankAccount"(id);

ALTER TABLE
    "creditCards"
ADD
    CONSTRAINT "creditCards" FOREIGN KEY ("bankAccountId") REFERENCES "bankAccount"(id);

ALTER TABLE
    "bankAccount"
ADD
    CONSTRAINT "bankAccount_fk0" FOREIGN KEY ("customerId") REFERENCES "customers"(id);

ALTER TABLE
    "customerAddresses"
ADD
    CONSTRAINT "customerAddresses_fk0" FOREIGN KEY ("customerId") REFERENCES "customers"(id);

ALTER TABLE
    "customerAddresses"
ADD
    CONSTRAINT "customerAddresses_fk1" FOREIGN KEY ("cityId") REFERENCES "cities"(id);

ALTER TABLE
    "customerPhones"
ADD
    CONSTRAINT "customerPhones_fk0" FOREIGN KEY ("customerId") REFERENCES "customers"(id);

ALTER TABLE
    "cities"
ADD
    CONSTRAINT "cities_fk0" FOREIGN KEY ("stateId") REFERENCES "states"(id);