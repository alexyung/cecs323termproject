INSERT INTO airport (FAAAbbreviation, airportName, city,state, country) VALUES 
('LGB', 'Long Beach Airport', 'Long Beach', 'California' ,'USA'),
('LAX', 'Los Angeles International Airport', 'Los Angeles', 'California' ,'USA'),
('JWA', 'John Wayne Airport', 'Santa Ana', 'California' ,'USA'),
('JFK', 'John F. Kennedy International Airport', 'Queens', 'New York' ,'USA'),
('BFI', 'King county International Airport', 'Seattle', 'Washington' ,'USA'),
('ICN', 'Incheon International Airport', 'Incheon', 'N/A' ,'South Korea');


INSERT INTO airline (airlineName, hqCity, hqState,hqCountry, range) VALUES 
('Fly Free', 'Sacramento', 'California', 'USA', 'DOMESTIC'),
('LB Transit', 'Long Beach', 'California', 'USA', 'DOMESTIC'),
('Air Busing', 'Seattle', 'Washington', 'USA', 'LOCAL'),
('Local Queens', 'Queens', 'New York', 'USA', 'LOCAL'),
('Cheap Flights Now International', 'Houston', 'Texas', 'USA', 'INTERNATIONAL'),
('South Korean Flights International', 'Incheon', 'N/A', 'South Korea', 'INTERNATIONAL');


INSERT INTO airlineservice (FAAAbbreviation, airlineName) VALUES 
('LGB', 'Fly Free'),
('LGB', 'LB Transit'),

('LAX', 'Fly Free'),
('LAX', 'LB Transit'),
('LAX', 'Cheap Flights Now International'),
('LAX', 'South Korean Flights International'),

('JWA', 'Fly Free'),
('JWA', 'LB Transit'),

('JFK', 'Fly Free'),
('JFK', 'LB Transit'),
('JFK', 'Cheap Flights Now International'),
('JFK', 'South Korean Flights International'),
('JFK', 'Local Queens'),

('BFI', 'Fly Free'),
('BFI', 'LB Transit'),
('BFI', 'Cheap Flights Now International'),
('BFI', 'South Korean Flights International'),

('ICN', 'South Korean Flights International'),
('ICN', 'Cheap Flights Now International');

INSERT INTO plane(FAANumber, airlineName, manufacturer, model, passengerLimit, planeName) VALUES 
(1001,'Fly Free', 'Boeing', 'AB1', 25, 'AirBus1'),
(2001,'LB Transit', 'Boeing', 'AB5', 10, 'Airbus5'),
(500,'Local Queens', 'Boeing', 'AB10', 10, 'Airbus10'),
(5001,'Cheap Flights Now International', 'Boeing', 'AM50', 50, 'AirMax50'),
(5002,'South Korean Flights International', 'Boeing', 'AM80', 80, 'AirMax80');

--  NEeds fixing
INSERT INTO flightSchedule(scheduleNumber, departureAirport, arrivalAirport, airlineName, DepartureTime, ArrivalTime, flightDuration) VALUES 
(101, 'LGB', 'LAX','Fly Free', '12:00:00', '14:00:00', INTEGER({fn TIMESTAMPDIFF(SQL_TSI_MINUTE, TIMESTAMP(CURRENT_DATE||' '||ArrivalTime), TIMESTAMP(CURRENT_DATE||' '||DepartureTime))}));


--flight instance

-- unchargeableFlgiht
-- chargable flight

INSERT INTO AMENITY (TYPE) VALUES 
('Water'),
('Soda'),
('Meal Plan 1'),
('Meal Plan 2'),
('Meal Plan 3'),
('Pizza'),
('Salmon'),
('TV'),
('Internet');

-- sale

--crew member fix
INSERT INTO crewMEMBER (FAACREWNUMBER,SUBSTITUTENUMBER,LASTNAME,FIRSTNAME, BACKGROUNDCHECK, ROLE , SCHEDULENUMBER) VALUES (1,10, 'Bui', 'Taylor', 'True','Flight Attendant', 10);

-- doesnt work because crew member doesnt work

INSERT INTO INCIDENTREPORT (REPORTNUMBER,REPORTER,REPORTED,INCIDENT, TIMESTAMP,DETAIL) VALUES 
(1, 1, 2, 'Attitude','1:00:00','Crew member 2 was giving crew member 1 attitude'),
(2, 2, 1, 'Lazy','1:00:00','Crew member 1 was not doing his work'),
(3, 3, 4, 'Skipped work','14:00:00','Crew member 4 skipped work'),
(4, 5, 1, 'Not doing his job','5:25:00','Crew member 1 standing around while customers need help');





-- implications


