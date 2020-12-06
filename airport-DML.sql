INSERT INTO airport (FAAAbbreviation, airportName, city,state, country) VALUES 
('LGB', 'Long Beach Airport', 'Long Beach', 'California' ,'USA'),
('LAX', 'Los Angeles International Airport', 'Los Angeles', 'California' ,'USA'),
('JWA', 'John Wayne Airport', 'Santa Ana', 'California' ,'USA'),
('JFK', 'John F. Kennedy International Airport', 'Queens', 'New York' ,'USA'),
('BFI', 'King County International Airport', 'Seattle', 'Washington' ,'USA'),
('ICN', 'Incheon International Airport', 'Incheon', 'N/A' ,'South Korea'),
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

INSERT INTO plane(FAANumber, airlineName, manufacturer, model, passengerLimit) VALUES 
(300, 'LB Transit', 'Airbus', 'A321', 200),
(321, 'Air Busing', 'Airbus', 'A322', 250),
(340, 'Cheap Flights Now International', 'Airbus', 'A380', 500),
(203, 'South Korean Flights International', 'Airbus', 'A380', 583);

--  NEeds fixing
/*
INSERT INTO flightSchedule(scheduleNumber, departureAirport, arrivalAirport, airlineName, DepartureTime, ArrivalTime, flightDuration) VALUES 
(101, 'LGB', 'LAX','Fly Free',     '12:00:00', '13:00:00', INTEGER({fn TIMESTAMPDIFF(SQL_TSI_MINUTE, TIMESTAMP(CURRENT_DATE||' '||'12:00:00'), TIMESTAMP(CURRENT_DATE||' '||'13:00:00'))}));
*/
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
(120, 'PEK', 'JFK','Cheap Flights Now International', '22:00:00', '13:00:00', INTEGER({fn TIMESTAMPDIFF(SQL_TSI_MINUTE, TIMESTAMP(CURRENT_DATE||' '||'22:00:00'), TIMESTAMP(DATE({fn TIMESTAMPADD(SQL_TSI_DAY, 1, CURRENT_TIMESTAMP)})||' '||'13:00:00'))})),
(121, 'ICN', 'LAX','South Korean Flights International', '02:00:00', '15:00:00', INTEGER({fn TIMESTAMPDIFF(SQL_TSI_MINUTE, TIMESTAMP(CURRENT_DATE||' '||'02:00:00'), TIMESTAMP(CURRENT_DATE||' '||'15:00:00'))})),
(122, 'LAX', 'ICN','South Korean Flights International', '02:00:00', '15:00:00', INTEGER({fn TIMESTAMPDIFF(SQL_TSI_MINUTE, TIMESTAMP(CURRENT_DATE||' '||'02:00:00'), TIMESTAMP(CURRENT_DATE||' '||'15:00:00'))})),
(123, 'ICN', 'PEK','South Korean Flights International', '10:00:00', '12:00:00', INTEGER({fn TIMESTAMPDIFF(SQL_TSI_MINUTE, TIMESTAMP(CURRENT_DATE||' '||'10:00:00'), TIMESTAMP(CURRENT_DATE||' '||'12:00:00'))})),
(124, 'PEK', 'ICN','South Korean Flights International', '13:00:00', '15:00:00', INTEGER({fn TIMESTAMPDIFF(SQL_TSI_MINUTE, TIMESTAMP(CURRENT_DATE||' '||'13:00:00'), TIMESTAMP(CURRENT_DATE||' '||'15:00:00'))}));


--flight instance
/*
INSERT INTO flightInstance(instancenumber, schedulenumber, date, departureactual, arrivalactual, flightDurationActual, status, planeNumber) VALUES
(205, 101, '2020-12-21', '12:00:00', '13:00:00', INTEGER({fn TIMESTAMPDIFF(SQL_TSI_MINUTE, TIMESTAMP('2020-12-21'||' '||'12:00:00'), TIMESTAMP('2020-12-21'||' '||'13:00:00'))}), TRUE, planenumber),
(206, 102, '2020-12-21', '15:03:00', '16:10:00', INTEGER({fn TIMESTAMPDIFF(SQL_TSI_MINUTE, TIMESTAMP('2020-12-21'||' '||'15:03:00'), TIMESTAMP('2020-12-21'||' '||'15:03:00'))}), FALSE, planenumber),
(207, 103, '2020-12-15', '10:10:00', '11:32:00', INTEGER({fn TIMESTAMPDIFF(SQL_TSI_MINUTE, TIMESTAMP('2020-12-21'||' '||'10:10:00'), TIMESTAMP('2020-12-21'||' '||'11:32:00'))}), FALSE, planenumber),
(208, 104, '2020-12-15', '10:10:00', '11:32:00', INTEGER({fn TIMESTAMPDIFF(SQL_TSI_MINUTE, TIMESTAMP('2020-12-21'||' '||'10:10:00'), TIMESTAMP('2020-12-21'||' '||'11:32:00'))}), FALSE, planenumber),
(209, 105, '2020-12-21', '07:30:00', '08:30:00', INTEGER({fn TIMESTAMPDIFF(SQL_TSI_MINUTE, TIMESTAMP('2020-12-21'||' '||'07:30:00'), TIMESTAMP('2020-12-21'||' '||'13:00:00'))}), TRUE, planenumber),
(210, 106, '2020-12-21', '09:30:00', '10:30:00', INTEGER({fn TIMESTAMPDIFF(SQL_TSI_MINUTE, TIMESTAMP('2020-12-21'||' '||'09:30:00'), TIMESTAMP('2020-12-21'||' '||'10:30:00'))}), TRUE, planenumber),
(211, 107, '2020-12-15', '06:00:00', '07:00:00', INTEGER({fn TIMESTAMPDIFF(SQL_TSI_MINUTE, TIMESTAMP('2020-12-21'||' '||'06:00:00'), TIMESTAMP('2020-12-21'||' '||'07:00:00'))}), TRUE, planenumber),
(212, 108, '2020-12-15', '08:00:00', '09:00:00', INTEGER({fn TIMESTAMPDIFF(SQL_TSI_MINUTE, TIMESTAMP('2020-12-21'||' '||'08:00:00'), TIMESTAMP('2020-12-21'||' '||'09:00:00'))}), TRUE, planenumber),
(213, 109, '2020-12-21', '08:00:00', '09:30:00', INTEGER({fn TIMESTAMPDIFF(SQL_TSI_MINUTE, TIMESTAMP('2020-12-21'||' '||'08:00:00'), TIMESTAMP('2020-12-21'||' '||'09:30:00'))}), TRUE, planenumber),
(214, 110, '2020-12-21', '10:00:00', '11:30:00', INTEGER({fn TIMESTAMPDIFF(SQL_TSI_MINUTE, TIMESTAMP('2020-12-21'||' '||'10:00:00'), TIMESTAMP('2020-12-21'||' '||'11:30:00'))}), TRUE, planenumber),
(215, 111, '2020-12-15', '10:00:00', '12:30:00', INTEGER({fn TIMESTAMPDIFF(SQL_TSI_MINUTE, TIMESTAMP('2020-12-21'||' '||'13:30:00'), TIMESTAMP('2020-12-21'||' '||'16:00:00'))}), FALSE, planenumber),
(216, 112, '2020-12-15', '13:30:00', '16:00:00', INTEGER({fn TIMESTAMPDIFF(SQL_TSI_MINUTE, TIMESTAMP('2020-12-21'||' '||'10:00:00'), TIMESTAMP('2020-12-21'||' '||'12:30:00'))}), FALSE, planenumber),
(217, 113, '2020-12-21', '12:00:00', '14:30:00', INTEGER({fn TIMESTAMPDIFF(SQL_TSI_MINUTE, TIMESTAMP('2020-12-21'||' '||'12:00:00'), TIMESTAMP('2020-12-21'||' '||'14:30:00'))}), TRUE, planenumber),
(218, 114, '2020-12-21', '15:30:00', '18:00:00', INTEGER({fn TIMESTAMPDIFF(SQL_TSI_MINUTE, TIMESTAMP('2020-12-21'||' '||'3:30:00'), TIMESTAMP('2020-12-21'||' '||'6:00:00'))}), FALSE, planenumber),
(219, 115, '2020-12-15', '02:00:00', '04:30:00', INTEGER({fn TIMESTAMPDIFF(SQL_TSI_MINUTE, TIMESTAMP('2020-12-21'||' '||'02:00:00'), TIMESTAMP('2020-12-21'||' '||'04:30:00'))}), TRUE, planenumber),
(220, 116, '2020-12-15', '05:30:00', '08:00:00', INTEGER({fn TIMESTAMPDIFF(SQL_TSI_MINUTE, TIMESTAMP('2020-12-21'||' '||'05:30:00'), TIMESTAMP('2020-12-21'||' '||'08:00:00'))}), TRUE, planenumber),
(221, 117, '2020-12-21', '05:30:00', '11:00:00', INTEGER({fn TIMESTAMPDIFF(SQL_TSI_MINUTE, TIMESTAMP('2020-12-21'||' '||'05:30:08'), TIMESTAMP('2020-12-21'||' '||'11:00:17'))}), FALSE, planenumber),
(222, 118, '2020-12-21', '12:00:00', '17:30:00', INTEGER({fn TIMESTAMPDIFF(SQL_TSI_MINUTE, TIMESTAMP('2020-12-21'||' '||'12:00:08'), TIMESTAMP('2020-12-21'||' '||'17:30:17'))}), FALSE, planenumber),
(223, 119, '2020-12-15', '06:00:00', '21:00:00', INTEGER({fn TIMESTAMPDIFF(SQL_TSI_MINUTE, TIMESTAMP('2020-12-21'||' '||'06:00:08'), TIMESTAMP('2020-12-21'||' '||'21:00:17'))}), FALSE, planenumber),
(224, 120, '2020-12-15', '22:00:00', '13:00:00', INTEGER({fn TIMESTAMPDIFF(SQL_TSI_MINUTE, TIMESTAMP('2020-12-21'||' '||'22:00:08'), TIMESTAMP('2020-12-21'||' '||'13:00:17'))}), FALSE, planenumber),
(225, 121, '2020-12-21', '02:00:00', '15:00:00', INTEGER({fn TIMESTAMPDIFF(SQL_TSI_MINUTE, TIMESTAMP('2020-12-21'||' '||'02:00:00'), TIMESTAMP('2020-12-21'||' '||'15:00:00'))}), TRUE, planenumber),
(226, 122, '2020-12-21', '02:00:00', '15:00:00', INTEGER({fn TIMESTAMPDIFF(SQL_TSI_MINUTE, TIMESTAMP('2020-12-21'||' '||'15:00:00'), TIMESTAMP('2020-12-21'||' '||'02:00:00'))}), FALSE, planenumber),
(227, 123, '2020-12-15', '10:00:00', '12:00:00', INTEGER({fn TIMESTAMPDIFF(SQL_TSI_MINUTE, TIMESTAMP('2020-12-21'||' '||'10:00:00'), TIMESTAMP('2020-12-21'||' '||'12:00:00'))}), TRUE, planenumber),
(228, 124, '2020-12-15', '13:00:00', '15:00:00', INTEGER({fn TIMESTAMPDIFF(SQL_TSI_MINUTE, TIMESTAMP('2020-12-21'||' '||'13:00:00'), TIMESTAMP('2020-12-21'||' '||'15:00:00'))}), TRUE, planenumber);
*/


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
INSERT INTO crewMember (FAACrewNumber, firstName, lastName, backgroundCheck, role, scheduleNumber) VALUES 
(1,   'Taylor', 'Bui',         'True', 'Flight Attendant', 101),
(2,   'Mickie', 'Kissel',      'True', 'Flight Attendant', 101),
(3,   'Luetta', 'Falcon',         'True', 'Flight Attendant', 101),
(4,   'Kirk', 'Minks',            'True', 'Flight Attendant', 102),
(5,   'Elinore', 'Woodberry',     'True', 'Flight Attendant', 102),
(6,   'Magdalena', 'Reamer',      'True', 'Flight Attendant', 102),
(7,   'Violet', 'Carr',        'True', 'Flight Attendant', 103),
(8,   'Hugo', 'Reulet',        'True', 'Flight Attendant', 103),
(9,   'Dotty', 'Gory',         'True', 'Flight Attendant', 103),
(10,  'Berta', 'Rueda',        'True', 'Flight Attendant', 103),
(11,  'Hang', 'Burmeister',    'True', 'Flight Attendant', 104),
(12,  'Floretta', 'Dentler',   'True', 'Flight Attendant', 104),
(13,  'Enrique', 'Trotta',     'True', 'Flight Attendant', 105),
(14,  'Breana', 'Basilio',     'True', 'Flight Attendant', 105),
(15,  'Wesley', 'Calandra',    'True', 'Flight Attendant', 106),
(16,  'Hope', 'Hegarty',       'True', 'Flight Attendant', 107),
(17,  'Terisa', 'Ankney',      'True', 'Flight Attendant', 108),
(18,  'Darrin', 'Seiter',      'True', 'Flight Attendant', 108),
(19,  'Khalilah', 'Landon',    'True', 'Flight Attendant', 108),
(20,  'Nolan', 'Haran',        'True', 'Flight Attendant', 108),
(21,  'Charity', 'Bissonette', 'True', 'Flight Attendant', 109),
(22,  'Noelle', 'Huffstetler', 'True', 'Flight Attendant', 109),
(23,  'Grazyna', 'Molder',     'True', 'Flight Attendant', 110),
(24,  'Melva', 'Wetter',       'True', 'Flight Attendant', 111),
(25,  'Bridgette', 'Nowicki',  'True', 'Flight Attendant', 112),
(26,  'Un', 'Boudreaux',       'True', 'Flight Attendant', 113),
(27,  'Raisa', 'Upton',        'True', 'Flight Attendant', 114),
(28,  'Melany', 'Rhode',       'True', 'Flight Attendant', 115),
(29,  'Owen', 'Tolleson',      'True', 'Flight Attendant', 116),
(30,  'Malik', 'Meininger',    'True', 'Flight Attendant', 117),
(62,  'Jennie', 'Shope',       'True', 'Co-Pilot',         101),
(63,  'Concetta', 'Salsman',   'True', 'Co-Pilot',         102),
(64,  'Reita', 'Asbury',       'True', 'Co-Pilot',         103),
(65,  'Lou', 'Settle',         'True', 'Co-Pilot',         104),
(66,  'Hwa', 'Whited',         'True', 'Co-Pilot',         105),
(92,  'Breanna', 'Frenz',      'True', 'Co-Pilot',         111),
(93,  'Dallas', 'Archuleta',   'True', 'Co-Pilot',         112),
(94,  'Shera', 'Shotwell',     'True', 'Co-Pilot',         113),
(95,  'Tyrell', 'Edmonds',     'True', 'Co-Pilot',         114),
(96,  'Jammie', 'Gaspar',      'True', 'Co-Pilot',         115),
(97,  'Vikki', 'Lackey',       'True', 'Co-Pilot',         116),
(98,  'Wally', 'Reuther',      'True', 'Co-Pilot',         117),
(72,  'Felica', 'Matt',        'True', 'Navigator',        101),
(73,  'Zula', 'Goodlow',       'True', 'Navigator',        102),
(74,  'Shanell', 'Nunley',     'True', 'Navigator',        103),
(75,  'Savannah', 'Ogilvie',   'True', 'Navigator',        104),
(76,  'Nena', 'Redman',        'True', 'Navigator',        105),
(99,  'Jeane', 'Bostic',       'True', 'Navigator',        111),
(101, 'Denisha', 'Bouyer',     'True', 'Navigator',        112),
(102, 'Aida', 'Chaput',        'True', 'Navigator',        113),
(103, 'Kami', 'Constant',      'True', 'Navigator',        114),
(104, 'Talia', 'Conlan',       'True', 'Navigator',        115),
(105, 'Bari', 'Mccuin',        'True', 'Navigator',        116),
(106, 'Delpha', 'Rall',        'True', 'Navigator',        117),
(82,  'Leena', 'Bay',          'True', 'Pilot',            101),
(83,  'Rina', 'Standley',      'True', 'Pilot',            102),
(84,  'Armandina', 'Isaac',    'True', 'Pilot',            103),
(85,  'Gay', 'Mena',           'True', 'Pilot',            104),
(86,  'Treva', 'Spector',      'True', 'Pilot',            105),
(107, 'Edwina', 'Favero',      'True', 'Pilot',            111),
(108, 'Deon', 'Pariseau',      'True', 'Pilot',            112),
(109, 'Analisa', 'Calaway',    'True', 'Pilot',            113),
(110, 'Raguel', 'Bristow',     'True', 'Pilot',            114),
(111, 'Francene', 'Desoto',    'True', 'Pilot',            115),
(112, 'Helga', 'Savard',       'True', 'Pilot',            116),
(113, 'Buddy', 'Hawkinson',    'True', 'Pilot',            117);

INSERT INTO crewMember (FAACrewNumber, substituteNumber, firstName, lastName, backgroundCheck, role, scheduleNumber) VALUES 
(31,  1,   'Tracee', 'Boddie',      'True', 'Flight Attendant', 101),
(32,  2,   'Ivette', 'Vankirk',     'True', 'Flight Attendant', 101),
(33,  3,   'Kiesha', 'Pelchat',     'True', 'Flight Attendant', 102),
(34,  4,   'Chasity', 'Natal',      'True', 'Flight Attendant', 103),
(35,  5,   'Eusebio', 'Casanova',   'True', 'Flight Attendant', 104),
(36,  6,   'Christa', 'Garlick',    'True', 'Flight Attendant', 104),
(37,  7,   'Cinthia', 'Delacerda',  'True', 'Flight Attendant', 104),
(38,  8,   'Berneice', 'Lieberman', 'True', 'Flight Attendant', 105),
(39,  9,   'Arlena', 'Lagrange',    'True', 'Flight Attendant', 106),
(40,  10,  'Ismael', 'Sell',        'True', 'Flight Attendant', 107),
(41,  11,  'Carlton', 'Rubino',     'True', 'Flight Attendant', 107),
(42,  12,  'Shakita', 'Vanzile',    'True', 'Flight Attendant', 118),
(43,  13,  'Loreta', 'Haymond',     'True', 'Flight Attendant', 118),
(44,  14,  'Minta', 'Beem',         'True', 'Flight Attendant', 118),
(45,  15,  'Sunshine', 'Ronald',    'True', 'Flight Attendant', 119),
(46,  16,  'Carisa', 'Burnam',      'True', 'Flight Attendant', 119),
(47,  17,  'Hilma', 'Sainz',        'True', 'Flight Attendant', 119),
(48,  18,  'Melva', 'Alexander',    'True', 'Flight Attendant', 120),
(49,  19,  'Ashleigh', 'Croston',   'True', 'Flight Attendant', 120),
(50,  20,  'Dusti', 'Deforge',      'True', 'Flight Attendant', 120),
(51,  21,  'Jarrett', 'Morrisette', 'True', 'Flight Attendant', 120),
(52,  22,  'Spencer', 'Falbo',      'True', 'Flight Attendant', 120),
(53,  23,  'Lenna', 'Posey',        'True', 'Flight Attendant', 121),
(54,  24,  'Claretta', 'Brousseau', 'True', 'Flight Attendant', 121),
(55,  25,  'Mercedes', 'Linthicum', 'True', 'Flight Attendant', 122),
(56,  26,  'Charise', 'Helberg',    'True', 'Flight Attendant', 122),
(57,  27,  'Lisha', 'Westlake',     'True', 'Flight Attendant', 123),
(58,  28,  'Karri', 'Moller',       'True', 'Flight Attendant', 123),
(59,  29,  'Dionna', 'Bartlow',     'True', 'Flight Attendant', 123),
(60,  30,  'Nanette', 'Nipper',     'True', 'Flight Attendant', 124),
(61,  31,  'Emil', 'Streets',       'True', 'Flight Attendant', 124),
(67,  62,  'Loretta', 'Taylor',     'True', 'Co-Pilot',         106),
(68,  63,  'Mckenzie', 'Laporta',   'True', 'Co-Pilot',         107),
(69,  64,  'Mellie', 'Grignon',     'True', 'Co-Pilot',         108),
(70,  65,  'Diana', 'Mantle',       'True', 'Co-Pilot',         109),
(71,  66,  'Rudolph', 'Roundtree',  'True', 'Co-Pilot',         110),
(114,  92,  'Kristel', 'Grindle',    'True', 'Co-Pilot',         118),
(115,  93,  'Carlena', 'Hebb',       'True', 'Co-Pilot',         119),
(116,  94,  'Ciera', 'Astin',        'True', 'Co-Pilot',         120),
(117,  95,  'Jazmin', 'Tutor',       'True', 'Co-Pilot',         121),
(118,  96,  'Winford', 'Tomlinson',  'True', 'Co-Pilot',         122),
(119,  97,  'Magaly', 'Bax',         'True', 'Co-Pilot',         123),
(120,  98,  'Luanna', 'Boring',      'True', 'Co-Pilot',         124),
(77,  72,  'Bethel', 'Rayfield',    'True', 'Navigator',        106),
(78,  73,  'Jake', 'Starr',         'True', 'Navigator',        107),
(79,  74,  'Robt', 'Mcentee',       'True', 'Navigator',        108),
(80,  75,  'Arden', 'Wallin',       'True', 'Navigator',        109),
(81,  99,  'Genevive', 'Chivers',   'True', 'Navigator',        110),
(121,  101,  'Elton', 'Vigo',         'True', 'Navigator',        118),
(122,  101,  'Hillary', 'Flythe',     'True', 'Navigator',        119),
(123,  102,  'Earnestine', 'Marconi', 'True', 'Navigator',        120),
(124,  103,  'Diane', 'Makowski',     'True', 'Navigator',        121),
(125,  104,  'Sasha', 'Hendrie',      'True', 'Navigator',        122),
(126,  105,  'Earline', 'Hollowell',  'True', 'Navigator',        123),
(127,  106,  'Chong', 'Earley',       'True', 'Navigator',        124),
(87,  82,  'Lorenzo', 'Byford',     'True', 'Pilot',            106),
(88,  83,  'Elli', 'Bal',           'True', 'Pilot',            107),
(89,  84,  'Dexter', 'Klingbeil',   'True', 'Pilot',            108),
(90,  85,  'Tomasa', 'Dull',        'True', 'Pilot',            109),
(91,  86,  'Titus', 'Brazeau',      'True', 'Pilot',            110),
(128,  107,  'Emerson', 'Purifoy',    'True', 'Pilot',            118),
(129,  108,  'Aiko', 'Tompkins',      'True', 'Pilot',            119),
(130,  109,  'Marge', 'Hiers',        'True', 'Pilot',            120),
(131,  110,  'Rodrick', 'Anwar',      'True', 'Pilot',            121),
(132,  111,  'Melia', 'Shea',         'True', 'Pilot',            122),
(133,  112,  'Cherlyn', 'Oxner',      'True', 'Pilot',            123),
(134,  113,  'Lorinda', 'Perret',     'True', 'Pilot',            124);


-- doesnt work because crew member doesnt work

INSERT INTO INCIDENTREPORT (REPORTNUMBER,REPORTER,REPORTED,INCIDENT, TIMESTAMP,DETAIL) VALUES 
(1, 1, 2, 'Attitude','1:00:00','Crew member 2 was giving crew member 1 attitude'),
(2, 2, 1, 'Lazy','1:00:00','Crew member 1 was not doing his work'),
(3, 3, 4, 'Skipped work','14:00:00','Crew member 4 skipped work'),
(4, 5, 1, 'Not doing his job','5:25:00','Crew member 1 standing around while customers need help');





-- implications


