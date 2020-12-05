INSERT INTO airport (FAAAbbreviation, airportName, city,state, country) VALUES ('LGB', 'Long Beach Airport', 'Long Beach', 'California' ,'USA')
INSERT INTO airport (FAAAbbreviation, airportName, city,state, country) VALUES ('LAX', 'Los Angeles International Airport', 'Los Angeles', 'California' ,'USA')
INSERT INTO airport (FAAAbbreviation, airportName, city,state, country) VALUES ('JWA', 'John Wayne Airport', 'Santa Ana', 'California' ,'USA')
INSERT INTO airport (FAAAbbreviation, airportName, city,state, country) VALUES ('JFK', 'John F. Kennedy International Airport', 'Queens', 'New York' ,'USA')
INSERT INTO airport (FAAAbbreviation, airportName, city,state, country) VALUES ('BFI', 'King county International Airport', 'Seattle', 'Washington' ,'USA')
INSERT INTO airport (FAAAbbreviation, airportName, city,state, country) VALUES ('ICN', 'Incheon International Airport', 'Incheon', 'N/A' ,'South Korea')


INSERT INTO airline (airlineName, hqCity, hqState,hqCountry, range) VALUES ('Fly Free', 'Sacramento', 'California', 'USA', 'Domestic')
INSERT INTO airline (airlineName, hqCity, hqState,hqCountry, range) VALUES ('LB Transit', 'Long Beach', 'California', 'USA', 'Domestic')
INSERT INTO airline (airlineName, hqCity, hqState,hqCountry, range) VALUES ('Air Busing', 'Seattle', 'Washington', 'USA', 'Local')
INSERT INTO airline (airlineName, hqCity, hqState,hqCountry, range) VALUES ('Local Queens', 'Queens', 'New York', 'USA', 'Local')
INSERT INTO airline (airlineName, hqCity, hqState,hqCountry, range) VALUES ('Cheap Flights Now International', 'Houston', 'Texas', 'USA', 'International')
INSERT INTO airline (airlineName, hqCity, hqState,hqCountry, range) VALUES ('South Korean Flights International', 'Incheon', 'N/A', 'South Korea', 'International')


INSERT INTO airlineservice (FAAAbreviation, airlineName) VALUES ('LGB', 'Fly Free')
INSERT INTO airlineservice (FAAAbreviation, airlineName) VALUES ('LGB', 'LB Transit')

INSERT INTO airlineservice (FAAAbreviation, airlineName) VALUES ('LAX', 'Fly Free')
INSERT INTO airlineservice (FAAAbreviation, airlineName) VALUES ('LAX', 'LB Transit')
INSERT INTO airlineservice (FAAAbreviation, airlineName) VALUES ('LAX', 'Cheap Flights Now International')
INSERT INTO airlineservice (FAAAbreviation, airlineName) VALUES ('LAX', 'South Korean Flights International')

INSERT INTO airlineservice (FAAAbreviation, airlineName) VALUES ('JWA', 'Fly Free')
INSERT INTO airlineservice (FAAAbreviation, airlineName) VALUES ('JWA', 'LB Transit')

INSERT INTO airlineservice (FAAAbreviation, airlineName) VALUES ('JFK', 'Fly Free')
INSERT INTO airlineservice (FAAAbreviation, airlineName) VALUES ('JFK', 'LB Transit')
INSERT INTO airlineservice (FAAAbreviation, airlineName) VALUES ('JFK', 'Cheap Flights Now International')
INSERT INTO airlineservice (FAAAbreviation, airlineName) VALUES ('JFK', 'South Korean Flights International')
INSERT INTO airlineservice (FAAAbreviation, airlineName) VALUES ('JFK', 'Local Queens')

INSERT INTO airlineservice (FAAAbreviation, airlineName) VALUES ('BFI', 'Fly Free')
INSERT INTO airlineservice (FAAAbreviation, airlineName) VALUES ('BFI', 'LB Transit')
INSERT INTO airlineservice (FAAAbreviation, airlineName) VALUES ('BFI', 'Cheap Flights Now International')
INSERT INTO airlineservice (FAAAbreviation, airlineName) VALUES ('BFI', 'South Korean Flights International')

INSERT INTO airlineservice (FAAAbreviation, airlineName) VALUES ('ICN', 'South Korean Flights International')
INSERT INTO airlineservice (FAAAbreviation, airlineName) VALUES ('ICN', 'Cheap Flights Now International')

INSERT INTO plane(FAANumber, airlineName, manufacturer, model, passengerLimit, planeName) VALUES ( 1001,'Fly Free', 'Boeing', 'AB1', 50, 'AirBus1')
INSERT INTO plane(FAANumber, airlineName, manufacturer, model, passengerLimit, planeName) VALUES ( 2001,'LB Transit', 'Boeing', 'LBT1', 50, 'Airbus5')

INSERT INTO plane(FAANumber, airlineName, manufacturer, model, passengerLimit, planeName) VALUES ( 3001,'Air Busing', 'Boeing', 'LBT1', 50, 'Airbus5')



INSERT INTO plane(FAANumber, airlineName, manufacturer, model, passengerLimit, planeName) VALUES ( 2001,'LB Transit', 'Boeing', 'LBT1', 50, 'Airbus5')

--to be added more planes











