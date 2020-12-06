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

INSERT INTO flightSchedule(scheduleNumber, departureAirport, arrivalAirport, airlineName, departureTime, ArrivalTime) VALUES (101, 'LGB', 'LAX','Fly Free', '12:00:00', '14:00:00', {fn TIMESTAMPDIFF(SQL_TSI_MINUTE, arrivalTime, departureTime)} );

















