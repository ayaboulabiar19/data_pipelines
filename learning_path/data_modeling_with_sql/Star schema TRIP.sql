--create database trip 
create database trip ; 
use trip;

--Create Tables for the Star Schema

-- CLIENT table
CREATE TABLE CLIENT (
    idClient INT PRIMARY KEY,
    name NVARCHAR(100),
    age INT,
    numChildren INT,
    city NVARCHAR(50),
    country NVARCHAR(50),
    income DECIMAL(10,2)
);

CREATE TABLE DESTINATION (
    idDestination INT PRIMARY KEY,
    hotel NVARCHAR(100),
    city NVARCHAR(50),
    country NVARCHAR(50)
);

CREATE TABLE AIRLINE (
    idAirline INT PRIMARY KEY,
    airlineName NVARCHAR(100),
    airlineCountry NVARCHAR(50)
);

CREATE TABLE DATE (
    idDate INT PRIMARY KEY,
    day INT,
    month INT,
    year INT,
    quarter INT
);


-- FACT_TRIPS table
CREATE TABLE FACT_TRIPS (
    idTrip INT PRIMARY KEY,
    idClient INT FOREIGN KEY REFERENCES CLIENT(idClient),
    idDestination INT FOREIGN KEY REFERENCES DESTINATION(idDestination),
    idAirline INT FOREIGN KEY REFERENCES AIRLINE(idAirline),
    idDate INT FOREIGN KEY REFERENCES DATE(idDate),
    amountSpent DECIMAL(10, 2),
    daysSpent INT
);


-- Inserting sample data into CLIENT table
INSERT INTO CLIENT (idClient, name, age, numChildren, city, country, income)
VALUES (1, 'John Doe', 30, 2, 'Paris', 'France', 50000);


INSERT INTO DESTINATION (idDestination, hotel, city, country)
VALUES (1, 'Hotel Ritz', 'Paris', 'France');

INSERT INTO AIRLINE (idAirline, airlineName, airlineCountry)
VALUES (1, 'Air France', 'France');

INSERT INTO DATE (idDate, day, month, year, quarter)
VALUES (1, 15, 3, 2023, 1);


INSERT INTO FACT_TRIPS (idTrip, idClient, idDestination, idAirline, idDate, amountSpent, daysSpent)
VALUES (1, 1, 1, 1, 1, 2000.00, 5);


SELECT
    CLIENT.name,
    DESTINATION.hotel,
    AIRLINE.airlineName,
    DATE.month,
    FACT_TRIPS.amountSpent,
    FACT_TRIPS.daysSpent
FROM FACT_TRIPS
JOIN CLIENT ON FACT_TRIPS.idClient = CLIENT.idClient
JOIN DESTINATION ON FACT_TRIPS.idDestination = DESTINATION.idDestination
JOIN AIRLINE ON FACT_TRIPS.idAirline = AIRLINE.idAirline
JOIN DATE ON FACT_TRIPS.idDate = DATE.idDate;






