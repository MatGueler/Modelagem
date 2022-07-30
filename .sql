-- Cria banco
CREATE DATABASE "Pratice-modelagem"

-- Cria tabela states

CREATE TABLE "states" (
	"id" SERIAL PRIMARY KEY,
	"name" TEXT UNIQUE NOT NULL,
);

-- Cria tabela cities

CREATE TABLE "cities" (
	"id" SERIAL PRIMARY KEY,
	"name" TEXT UNIQUE NOT NULL,
	"stateId" INTEGER NOT NULL REFERENCES "states"("id"),
);

-- Cria tabela customers

CREATE TABLE "customers" (
	"id" SERIAL PRIMARY KEY,
	"fullName" TEXT NOT NULL,
	"cpf" INTEGER UNIQUE NOT NULL,
	"email" TEXT UNIQUE NOT NULL,
	"password" TEXT NOT NULL
);

-- Cria tabela customersAdresses

CREATE TABLE "customerAddresses" (
	"id" SERIAL PRIMARY KEY,
	"customerId" INTEGER NOT NULL REFERENCES "customers"("id"),
	"street" TEXT NOT NULL,
	"number" INTEGER NOT NULL,
	"complement" TEXT,
	"postalCode" TEXT UNIQUE NOT NULL,
	"cityId" INTEGER NOT NULL REFERENCES "cities"("id")
);

-- Cria tabela bankAccount

CREATE TABLE "bankAccount" (
	"id" SERIAL PRIMARY KEY,
	"customerId" INTEGER NOT NULL REFERENCES "customers"("id"),
	"accountNumber" INTEGER UNIQUE NOT NULL,
	"agency" INTEGER NOT NULL,
	"openDate" TIMESTAMP WITHOUT TIME ZONE NOT NULL,
	"closeDate" TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT NOW()
);

-- Cria tabela transations

CREATE TABLE "transations" (
	"id" SERIAL PRIMARY KEY,
	"bankAccountId" INTEGER NOT NULL REFERENCES "bankAccount"("id"),
	"amount" INTEGER NOT NULL,
	"type" TEXT NOT NULL,
	"time" TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT NOW(),
	"description" TEXT,
	"canceled" BOOLEAN NOT NULL DEFAULT FALSE
);

-- Cria tabela transations

CREATE TABLE "creditCards" (
	"id" SERIAL PRIMARY KEY,
	"bankAccountId" INTEGER NOT NULL REFERENCES "bankAccount"("id"),
	"name" TEXT NOT NULL,
	"number" INTEGER NOT NULL,
	"securityCode" TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT NOW(),
	"expirationMounth" TIMESTAMP WITHOUT TIME ZONE NOT NULL,
	"expirationYear" TIMESTAMP WITHOUT TIME ZONE NOT NULL,
	"pasword" "password" TEXT NOT NULL
	"limit" INTEGER NOT NULL
);