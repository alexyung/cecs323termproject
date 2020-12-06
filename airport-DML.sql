INSERT INTO airport (FAAAbbreviation, airportName, city,state, country) VALUES ('LGB', 'Long Beach Airport', 'Long Beach', 'California' ,'USA');
INSERT INTO airport (FAAAbbreviation, airportName, city,state, country) VALUES ('LAX', 'Los Angeles International Airport', 'Los Angeles', 'California' ,'USA');
INSERT INTO airport (FAAAbbreviation, airportName, city,state, country) VALUES ('JWA', 'John Wayne Airport', 'Santa Ana', 'California' ,'USA');
INSERT INTO airport (FAAAbbreviation, airportName, city,state, country) VALUES ('JFK', 'John F. Kennedy International Airport', 'Queens', 'New York' ,'USA');
INSERT INTO airport (FAAAbbreviation, airportName, city,state, country) VALUES ('BFI', 'King county International Airport', 'Seattle', 'Washington' ,'USA');
INSERT INTO airport (FAAAbbreviation, airportName, city,state, country) VALUES ('ICN', 'Incheon International Airport', 'Incheon', 'N/A' ,'South Korea');


INSERT INTO airline (airlineName, hqCity, hqState,hqCountry, range) VALUES ('Fly Free', 'Sacramento', 'California', 'USA', 'DOMESTIC');
INSERT INTO airline (airlineName, hqCity, hqState,hqCountry, range) VALUES ('LB Transit', 'Long Beach', 'California', 'USA', 'DOMESTIC');
INSERT INTO airline (airlineName, hqCity, hqState,hqCountry, range) VALUES ('Air Busing', 'Seattle', 'Washington', 'USA', 'LOCAL');
INSERT INTO airline (airlineName, hqCity, hqState,hqCountry, range) VALUES ('Local Queens', 'Queens', 'New York', 'USA', 'LOCAL');
INSERT INTO airline (airlineName, hqCity, hqState,hqCountry, range) VALUES ('Cheap Flights Now International', 'Houston', 'Texas', 'USA', 'INTERNATIONAL');
INSERT INTO airline (airlineName, hqCity, hqState,hqCountry, range) VALUES ('South Korean Flights International', 'Incheon', 'N/A', 'South Korea', 'INTERNATIONAL');


INSERT INTO airlineservice (FAAAbbreviation, airlineName) VALUES ('LGB', 'Fly Free');
INSERT INTO airlineservice (FAAAbbreviation, airlineName) VALUES ('LGB', 'LB Transit');

INSERT INTO airlineservice (FAAAbbreviation, airlineName) VALUES ('LAX', 'Fly Free');
INSERT INTO airlineservice (FAAAbbreviation, airlineName) VALUES ('LAX', 'LB Transit');
INSERT INTO airlineservice (FAAAbbreviation, airlineName) VALUES ('LAX', 'Cheap Flights Now International');
INSERT INTO airlineservice (FAAAbbreviation, airlineName) VALUES ('LAX', 'South Korean Flights International');

INSERT INTO airlineservice (FAAAbbreviation, airlineName) VALUES ('JWA', 'Fly Free');
INSERT INTO airlineservice (FAAAbbreviation, airlineName) VALUES ('JWA', 'LB Transit');

INSERT INTO airlineservice (FAAAbbreviation, airlineName) VALUES ('JFK', 'Fly Free');
INSERT INTO airlineservice (FAAAbbreviation, airlineName) VALUES ('JFK', 'LB Transit');
INSERT INTO airlineservice (FAAAbbreviation, airlineName) VALUES ('JFK', 'Cheap Flights Now International');
INSERT INTO airlineservice (FAAAbbreviation, airlineName) VALUES ('JFK', 'South Korean Flights International');
INSERT INTO airlineservice (FAAAbbreviation, airlineName) VALUES ('JFK', 'Local Queens');

INSERT INTO airlineservice (FAAAbbreviation, airlineName) VALUES ('BFI', 'Fly Free');
INSERT INTO airlineservice (FAAAbbreviation, airlineName) VALUES ('BFI', 'LB Transit');
INSERT INTO airlineservice (FAAAbbreviation, airlineName) VALUES ('BFI', 'Cheap Flights Now International');
INSERT INTO airlineservice (FAAAbbreviation, airlineName) VALUES ('BFI', 'South Korean Flights International');

INSERT INTO airlineservice (FAAAbbreviation, airlineName) VALUES ('ICN', 'South Korean Flights International');
INSERT INTO airlineservice (FAAAbbreviation, airlineName) VALUES ('ICN', 'Cheap Flights Now International');

INSERT INTO plane(FAANumber, airlineName, manufacturer, model, passengerLimit, planeName) VALUES ( 1001,'Fly Free', 'Boeing', 'AB1', 25, 'AirBus1');
INSERT INTO plane(FAANumber, airlineName, manufacturer, model, passengerLimit, planeName) VALUES ( 2001,'LB Transit', 'Boeing', 'AB5', 10, 'Airbus5');
INSERT INTO plane(FAANumber, airlineName, manufacturer, model, passengerLimit, planeName) VALUES ( 500,'Local Queens', 'Boeing', 'AB10', 10, 'Airbus10');
INSERT INTO plane(FAANumber, airlineName, manufacturer, model, passengerLimit, planeName) VALUES ( 5001,'Cheap Flights Now International', 'Boeing', 'AM50', 50, 'AirMax50');
INSERT INTO plane(FAANumber, airlineName, manufacturer, model, passengerLimit, planeName) VALUES ( 5002,'South Korean Flights International', 'Boeing', 'AM80', 80, 'AirMax80');

--  NEeds fixing
--INSERT INTO flightSchedule(scheduleNumber, departureAirport, arrivalAirport, airlineName, DEPARTURETIME, ArrivalTime, flightDuration) VALUES (101, 'LGB', 'LAX','Fly Free', '12:00:00', '14:00:00', {fn TIMESTAMPDIFF(SQL_TSI_MINUTE, arrivalTime, departureTime)} );


--flight instance

-- unchargeableFlgiht
-- chargable flight

INSERT INTO AMENITY (TYPE) VALUES ('Water');
INSERT INTO AMENITY (TYPE) VALUES ('Soda');
INSERT INTO AMENITY (TYPE) VALUES ('Meal Plan 1');
INSERT INTO AMENITY (TYPE) VALUES ('Meal Plan 2');
INSERT INTO AMENITY (TYPE) VALUES ('Meal Plan 3');
INSERT INTO AMENITY (TYPE) VALUES ('PIzza');
INSERT INTO AMENITY (TYPE) VALUES ('Salmon');
INSERT INTO AMENITY (TYPE) VALUES ('TV');
INSERT INTO AMENITY (TYPE) VALUES ('Internet');

-- sale

--crew member fix
--INSERT INTO crewMEMBER (FAACREWNUMBER,SUBSTITUTENUMBER,LASTNAME,FIRSTNAME, BACKGROUNDCHECK, ROLE , SCHEDULENUMBER) VALUES (1,10, 'Bui', 'Taylor', 'True','Flight Attendant', 10);

-- doesnt work because crew member doesnt work

INSERT INTO INCIDENTREPORT (REPORTNUMBER,REPORTER,REPORTED,INCIDENT, TIMESTAMP,DETAIL) VALUES (1, 1, 2, 'Attitude','1:00:00','Crew member 2 was giving crew member 1 attitude');
INSERT INTO INCIDENTREPORT (REPORTNUMBER,REPORTER,REPORTED,INCIDENT, TIMESTAMP,DETAIL) VALUES (2, 2, 1, 'Lazy','1:00:00','Crew member 1 was not doing his work');
INSERT INTO INCIDENTREPORT (REPORTNUMBER,REPORTER,REPORTED,INCIDENT, TIMESTAMP,DETAIL) VALUES (3, 3, 4, 'Skipped work','14:00:00','Crew member 4 skipped work');
INSERT INTO INCIDENTREPORT (REPORTNUMBER,REPORTER,REPORTED,INCIDENT, TIMESTAMP,DETAIL) VALUES (4, 5, 1, 'Not doing his job','5:25:00','Crew member 1 standing around while customers need help');





-- implications


