CREATE TABLE airport ( FAAAbreviation VARCHAR(5) PRIMARY KEY,airportName varchar(50) NOT NULL, city varchar(50) NOT NULL,[state] varchar(50) NOT NULL,country varchar(50) NOT NULL )

CREATE TABLE airline (airlinename varchar(50) PRIMARY KEY, headquarters varchar(50) not null, [range] VARCHAR (15) not null);

CREATE TABLE airlineservice (FAAAbreviation VARCHAR(5) FOREIGN KEY REFERENCES airport(FAAAbreviation) not null,airlinename VARCHAR(50) FOREIGN KEY REFERENCES airline(airlinename) not null , PRIMARY KEY (FAAAbreviation, airlinename))

CREATE TABLE plane (FAANumber INT PRIMARY KEY, airlinename varchar(50) FOREIGN KEY REFERENCES airline(airlinename) not null, manufacturer VARCHAR (50) not null,model VARCHAR (50) not null,passengerLimit INT NOT NULL, planeName varchar(50))

CREATE TABLE flightSchedule(scheduleNumber INT PRIMARY KEY, departureAirport varchar(5) FOREIGN KEY REFERENCES airport(FAAAbreviation) not null, arrivalAirport varchar(5) FOREIGN KEY REFERENCES airport(FAAAbreviation) not null,airlineName varchar (50) FOREIGN KEY REFERENCES airline(airlinename) not null,departureTime TIME not null, arrivalTime TIME not null, flightDuration time not null)

CREATE TABLE flightInstance (instanceNumber INT PRIMARY KEY, scheduleNumber INT FOREIGN KEY REFERENCES flightSchedule(scheduleNumber) NOT NULL, [date] DATE not null, departureActual TIME,arivalActual TIME,planeNumber int Foreign Key REFERENCES plane (FAANumber) not null)

CREATE TABLE unchargeableFlight (instanceNumber int FOREIGN KEY references flightInstance(instanceNumber) Not null, Primary key (instanceNumber))

CREATE TABLE chargeableFlight (instanceNumber int FOREIGN KEY references flightInstance(instanceNumber) Not null, Primary key (instanceNumber))

CREATE TABLE amenity ([type] varchar(50) primary key)

CREATE TABLE  sale (instanceNumber int FOREIGN KEY references chargeableFlight(instanceNumber) not null, [type] varchar(50) FOREIGN KEY REFERENCES amenity(type) not null, PRIMARY KEY (instanceNumber, [type] ))

CREATE TABLE crewMember (faacrewNumber int primary key, substituteNumber int references crewMember(faacrewNumber),lastName VARCHAR(40) not null,firstName VARCHAR(40)not null, backgroundCheck bit not null, [role] varChar (50) not null, scheduleNumber int FOREIGN KEY REFERENCES flightSchedule(scheduleNumber) not null)

CREATE TABLE incidentReport (reportNumber int primary key, reporter int Foreign key references crewMember (faaCrewNumber) not null, reported int Foreign key references crewMember (faaCrewNumber) not null, incident varchar(20), [timestamp] DateTime  not null, detail varchar (300) not null)

CREATE TABLE implication (instanceNmber int foreign key references flightInstance(instanceNumber) not null, reportNumber int foreign key references incidentReport(reportNumber)  not null)