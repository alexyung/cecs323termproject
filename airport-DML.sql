INSERT INTO airport (FAAAbbreviation, airportName, city,state, country) VALUES 
('LGB', 'Long Beach Airport', 'Long Beach', 'California' ,'USA'),
('LAX', 'Los Angeles International Airport', 'Los Angeles', 'California' ,'USA'),
('JWA', 'John Wayne Airport', 'Santa Ana', 'California' ,'USA'),
('JFK', 'John F. Kennedy International Airport', 'Queens', 'New York' ,'USA'),
('BFI', 'King County International Airport', 'Seattle', 'Washington' ,'USA'),
('ICN', 'Incheon International Airport', 'Incheon', 'N/A' ,'South Korea');
('PEK', 'Beijing Capital International Airport', 'Beijing', 'N/A' ,'China');


INSERT INTO airline (airlineName, hqCity, hqState,hqCountry, range) VALUES 
('Fly Free', 'Sacramento', 'California', 'USA', 'LOCAL'),
('LB Transit', 'Long Beach', 'California', 'USA', 'LOCAL'),
('Air Busing', 'Seattle', 'Washington', 'USA', 'DOMESTIC'),
('Local Queens', 'Queens', 'New York', 'USA', 'DOMESTIC'),
('Cheap Flights Now International', 'Houston', 'Texas', 'USA', 'INTERNATIONAL'),
('South Korean Flights International', 'Incheon', 'N/A', 'South Korea', 'INTERNATIONAL');


INSERT INTO airlineservice (FAAAbbreviation, airlineName) VALUES 
('LGB', 'Fly Free'),
('LGB', 'LB Transit'),
('LGB', 'Local Queens'),

('LAX', 'Fly Free'),
('LAX', 'LB Transit'),
('LAX', 'Air Busing'),
('LAX', 'Cheap Flights Now International'),
('LAX', 'South Korean Flights International'),

('JWA', 'Fly Free'),
('JWA', 'LB Transit'),

('JFK', 'LB Transit'),
('JFK', 'Air Busing'),
('JFK', 'Cheap Flights Now International'),
('JFK', 'South Korean Flights International'),
('JFK', 'Local Queens'),

('BFI', 'Air Busing'),
('BFI', 'Local Queens'),
('BFI', 'Cheap Flights Now International'),
('BFI', 'South Korean Flights International'),

('ICN', 'South Korean Flights International'),
('ICN', 'Cheap Flights Now International'),

('PEK', 'Cheap Flights Now International'),
('PEK', 'South Korean Flights International');

INSERT INTO plane(FAANumber, airlineName, manufacturer, model, passengerLimit, planeName) VALUES 
(1001,'Fly Free', 'Boeing', 'AB1', 25, 'AirBus1'),
(2001,'LB Transit', 'Boeing', 'AB5', 10, 'Airbus5'),
(500,'Local Queens', 'Boeing', 'AB10', 10, 'Airbus10'),
(5001,'Cheap Flights Now International', 'Boeing', 'AM50', 50, 'AirMax50'),
(5002,'South Korean Flights International', 'Boeing', 'AM80', 80, 'AirMax80');

--  NEeds fixing
INSERT INTO flightSchedule(scheduleNumber, departureAirport, arrivalAirport, airlineName, DepartureTime, ArrivalTime, flightDuration) VALUES 
(101, 'LGB', 'LAX','Fly Free',     '12:00:00', '13:00:00', INTEGER({fn TIMESTAMPDIFF(SQL_TSI_MINUTE, TIMESTAMP(CURRENT_DATE||' '||'12:00:00'), TIMESTAMP(CURRENT_DATE||' '||'13:00:00'))})),
(102, 'LAX', 'LGB','Fly Free',     '15:00:00', '16:00:00', INTEGER({fn TIMESTAMPDIFF(SQL_TSI_MINUTE, TIMESTAMP(CURRENT_DATE||' '||'15:00:00'), TIMESTAMP(CURRENT_DATE||' '||'16:00:00'))})),
(103, 'LAX', 'JWA','Fly Free',     '10:00:00', '11:30:00', INTEGER({fn TIMESTAMPDIFF(SQL_TSI_MINUTE, TIMESTAMP(CURRENT_DATE||' '||'10:00:00'), TIMESTAMP(CURRENT_DATE||' '||'11:30:00'))})),
(104, 'JWA', 'LAX','Fly Free',     '13:30:00', '15:00:00', INTEGER({fn TIMESTAMPDIFF(SQL_TSI_MINUTE, TIMESTAMP(CURRENT_DATE||' '||'13:30:00'), TIMESTAMP(CURRENT_DATE||' '||'15:00:00'))})),
(105, 'LGB', 'LAX','LB Transit',   '07:30:00', '08:30:00', INTEGER({fn TIMESTAMPDIFF(SQL_TSI_MINUTE, TIMESTAMP(CURRENT_DATE||' '||'07:30:00'), TIMESTAMP(CURRENT_DATE||' '||'08:30:00'))})),
(106, 'LAX', 'LGB','LB Transit',   '09:30:00', '10:30:00', INTEGER({fn TIMESTAMPDIFF(SQL_TSI_MINUTE, TIMESTAMP(CURRENT_DATE||' '||'09:30:00'), TIMESTAMP(CURRENT_DATE||' '||'10:30:00'))})),
(107, 'LGB', 'JWA','LB Transit',   '06:00:00', '07:00:00', INTEGER({fn TIMESTAMPDIFF(SQL_TSI_MINUTE, TIMESTAMP(CURRENT_DATE||' '||'06:00:00'), TIMESTAMP(CURRENT_DATE||' '||'07:00:00'))})),
(108, 'JWA', 'LGB','LB Transit',   '08:00:00', '09:00:00', INTEGER({fn TIMESTAMPDIFF(SQL_TSI_MINUTE, TIMESTAMP(CURRENT_DATE||' '||'08:00:00'), TIMESTAMP(CURRENT_DATE||' '||'09:00:00'))})),
(109, 'BFI', 'LAX','Air Busing',   '08:00:00', '09:30:00', INTEGER({fn TIMESTAMPDIFF(SQL_TSI_MINUTE, TIMESTAMP(CURRENT_DATE||' '||'08:00:00'), TIMESTAMP(CURRENT_DATE||' '||'09:30:00'))})),
(110, 'LAX', 'BFI','Air Busing',   '10:00:00', '11:30:00', INTEGER({fn TIMESTAMPDIFF(SQL_TSI_MINUTE, TIMESTAMP(CURRENT_DATE||' '||'10:00:00'), TIMESTAMP(CURRENT_DATE||' '||'11:30:00'))})),
(111, 'BFI', 'JFK','Air Busing',   '10:00:00', '12:30:00', INTEGER({fn TIMESTAMPDIFF(SQL_TSI_MINUTE, TIMESTAMP(CURRENT_DATE||' '||'10:00:00'), TIMESTAMP(CURRENT_DATE||' '||'12:30:00'))})),
(112, 'JFK', 'BFI','Air Busing',   '13:30:00', '16:00:00', INTEGER({fn TIMESTAMPDIFF(SQL_TSI_MINUTE, TIMESTAMP(CURRENT_DATE||' '||'13:30:00'), TIMESTAMP(CURRENT_DATE||' '||'16:00:00'))})),
(113, 'JFK', 'BFI','Local Queens', '12:00:00', '14:30:00', INTEGER({fn TIMESTAMPDIFF(SQL_TSI_MINUTE, TIMESTAMP(CURRENT_DATE||' '||'12:00:00'), TIMESTAMP(CURRENT_DATE||' '||'14:30:00'))})),
(114, 'BFI', 'JFK','Local Queens', '15:30:00', '18:00:00', INTEGER({fn TIMESTAMPDIFF(SQL_TSI_MINUTE, TIMESTAMP(CURRENT_DATE||' '||'15:30:00'), TIMESTAMP(CURRENT_DATE||' '||'18:00:00'))})),
(115, 'JFK', 'LAX','Local Queens', '02:00:00', '04:30:00', INTEGER({fn TIMESTAMPDIFF(SQL_TSI_MINUTE, TIMESTAMP(CURRENT_DATE||' '||'02:00:00'), TIMESTAMP(CURRENT_DATE||' '||'04:30:00'))})),
(116, 'LAX', 'JFK','Local Queens', '05:30:00', '08:00:00', INTEGER({fn TIMESTAMPDIFF(SQL_TSI_MINUTE, TIMESTAMP(CURRENT_DATE||' '||'05:30:00'), TIMESTAMP(CURRENT_DATE||' '||'08:00:00'))})),
(117, 'LAX', 'ICN','Cheap Flights Now International', '05:30:00', '11:00:00', INTEGER({fn TIMESTAMPDIFF(SQL_TSI_MINUTE, TIMESTAMP(CURRENT_DATE||' '||'05:30:00'), TIMESTAMP(CURRENT_DATE||' '||'11:00:00'))})),
(118, 'ICN', 'LAX','Cheap Flights Now International', '12:00:00', '17:30:00', INTEGER({fn TIMESTAMPDIFF(SQL_TSI_MINUTE, TIMESTAMP(CURRENT_DATE||' '||'12:00:00'), TIMESTAMP(CURRENT_DATE||' '||'17:30:00'))})),
(119, 'JFK', 'PEK','Cheap Flights Now International', '06:00:00', '21:00:00', INTEGER({fn TIMESTAMPDIFF(SQL_TSI_MINUTE, TIMESTAMP(CURRENT_DATE||' '||'06:00:00'), TIMESTAMP(CURRENT_DATE||' '||'21:00:00'))})),
(120, 'PEK', 'JFK','Cheap Flights Now International', '22:00:00', '13:00:00', INTEGER({fn TIMESTAMPDIFF(SQL_TSI_MINUTE, TIMESTAMP(CURRENT_DATE||' '||'22:00:00'), timestamp(DATE({fn TIMESTAMPADD(SQL_TSI_DAY, 1, CURRENT_TIMESTAMP)})||' '||'13:00:00'))}),
(121, 'ICN', 'LAX','South Korean Flights International', '02:00:00', '15:00:00', INTEGER({fn TIMESTAMPDIFF(SQL_TSI_MINUTE, TIMESTAMP(CURRENT_DATE||' '||'02:00:00'), TIMESTAMP(CURRENT_DATE||' '||'15:00:00'))})),
(122, 'LAX', 'ICN','South Korean Flights International', '02:00:00', '15:00:00', INTEGER({fn TIMESTAMPDIFF(SQL_TSI_MINUTE, TIMESTAMP(CURRENT_DATE||' '||'02:00:00'), TIMESTAMP(CURRENT_DATE||' '||'15:00:00'))})),
(123, 'ICN', 'PEK','South Korean Flights International', '10:00:00', '12:00:00', INTEGER({fn TIMESTAMPDIFF(SQL_TSI_MINUTE, TIMESTAMP(CURRENT_DATE||' '||'10:00:00'), TIMESTAMP(CURRENT_DATE||' '||'12:00:00'))})),
(124, 'PEK', 'ICN','South Korean Flights International', '13:00:00', '15:00:00', INTEGER({fn TIMESTAMPDIFF(SQL_TSI_MINUTE, TIMESTAMP(CURRENT_DATE||' '||'13:00:00'), TIMESTAMP(CURRENT_DATE||' '||'15:00:00'))}));




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
INSERT INTO crewMEMBER (FAACREWNUMBER,SUBSTITUTENUMBER,LASTNAME,FIRSTNAME, BACKGROUNDCHECK, ROLE , SCHEDULENUMBER) VALUES 
(1,10, 'Bui', 'Taylor', 'True','Flight Attendant', 10);

-- doesnt work because crew member doesnt work

INSERT INTO INCIDENTREPORT (REPORTNUMBER,REPORTER,REPORTED,INCIDENT, TIMESTAMP,DETAIL) VALUES 
(1, 1, 2, 'Attitude','1:00:00','Crew member 2 was giving crew member 1 attitude'),
(2, 2, 1, 'Lazy','1:00:00','Crew member 1 was not doing his work'),
(3, 3, 4, 'Skipped work','14:00:00','Crew member 4 skipped work'),
(4, 5, 1, 'Not doing his job','5:25:00','Crew member 1 standing around while customers need help');





-- implications


