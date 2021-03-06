--DROP ALL TABLES AND INDICES
DROP INDEX flightschedule_CK;
DROP INDEX flightinstance_CK;
DROP INDEX incidentreport_CK;
DROP TABLE airlineservice;
DROP TABLE sale;
DROP TABLE implication;
DROP TABLE unchargeableFlight;
DROP TABLE chargeableFlight;
DROP TABLE flightInstance;
DROP TABLE incidentReport;
DROP TABLE crewMember;
DROP TABLE flightSchedule;
DROP TABLE airport;
DROP TABLE plane;
DROP TABLE airline;
DROP TABLE amenity;


CREATE TABLE airport ( 
    FAAAbbreviation VARCHAR(5),
    airportName VARCHAR(50) NOT NULL, 
    city VARCHAR(50) NOT NULL,
    state VARCHAR(50),
    country VARCHAR(50) NOT NULL,
    CONSTRAINT airport_PK PRIMARY KEY (FAAAbbreviation)
);

CREATE TABLE airline (
    airlineName VARCHAR(50), 
    hqCity VARCHAR(50) NOT NULL,
    hqState VARCHAR(50),
    hqCountry VARCHAR(50) NOT NULL,
    range VARCHAR (15) NOT NULL CONSTRAINT RANGE_CONSTRAINT
        CHECK (range in ('LOCAL', 'DOMESTIC', 'INTERNATIONAL')),
    CONSTRAINT airline_PK PRIMARY KEY (airlineName)
);

CREATE TABLE airlineservice (
    FAAAbbreviation VARCHAR(5) NOT NULL,
    airlineName VARCHAR(50) NOT NULL,
    CONSTRAINT airlineservice_PK PRIMARY KEY (FAAAbbreviation, airlineName),
    CONSTRAINT as_ap_FK FOREIGN KEY (FAAAbbreviation)
        REFERENCES airport (FAAAbbreviation),
    CONSTRAINT as_al_FK FOREIGN KEY (airlineName)
        REFERENCES airline (airlineName)
);

CREATE TABLE plane (
    FAANumber INTEGER, 
    airlineName VARCHAR(50) NOT NULL, 
    manufacturer VARCHAR (50) NOT NULL,
    model VARCHAR (50) NOT NULL,
    passengerLimit INTEGER NOT NULL, 
    planeName VARCHAR(50),
    CONSTRAINT plane_PK PRIMARY KEY (FAANumber),
    CONSTRAINT p_al_FK FOREIGN KEY (airlineName)
        REFERENCES airline (airlineName)
);

CREATE TABLE flightSchedule(
    scheduleNumber INTEGER, 
    departureAirport VARCHAR(5) NOT NULL, 
    arrivalAirport VARCHAR(5) NOT NULL,
    CONSTRAINT nosameairport CHECK (departureAirport != arrivalAirport),
    airlineName VARCHAR (50) NOT NULL,
    departureTime TIME NOT NULL, 
    arrivalTime TIME NOT NULL, 
    flightDuration INTEGER NOT NULL,
    CONSTRAINT flightschedule_PK PRIMARY KEY (scheduleNumber),
    CONSTRAINT fs_dap_FK FOREIGN KEY (departureAirport)
        REFERENCES airport (FAAAbbreviation),
    CONSTRAINT fs_aap_FK FOREIGN KEY (arrivalAirport)
        REFERENCES airport (FAAAbbreviation),
    CONSTRAINT fs_al_FK FOREIGN KEY (airlineName)
        REFERENCES airline (airlineName)
);

CREATE UNIQUE INDEX flightschedule_CK ON flightschedule (departureAirport, arrivalAirport, airlineName, departureTime, arrivalTime);

CREATE TABLE flightInstance (
    instanceNumber INTEGER,
    scheduleNumber INTEGER NOT NULL, 
    date DATE NOT NULL, 
    departureActual TIME NOT NULL,
    arrivalActual TIME NOT NULL,
    flightDurationActual INTEGER NOT NULL,
    status BOOLEAN NOT NULL,
    planeNumber INTEGER NOT NULL,
    CONSTRAINT flightinstance_PK PRIMARY KEY(instanceNumber),
    CONSTRAINT fi_fs_FK FOREIGN KEY (scheduleNumber)
        REFERENCES flightschedule (scheduleNumber),
    CONSTRAINT fi_p_FK FOREIGN KEY (planeNumber)
        REFERENCES plane (FAANumber)
);

CREATE UNIQUE INDEX flightinstance_CK ON flightinstance (schedulenumber, date);

CREATE TABLE unchargeableFlight (
    instanceNumber INTEGER NOT NULL,
    CONSTRAINT unchargeableflight_PK PRIMARY KEY(instanceNumber),
    CONSTRAINT uf_fi_FK FOREIGN KEY (instanceNumber)
        REFERENCES flightinstance (instanceNumber)
);

CREATE TABLE chargeableFlight (
    instanceNumber INTEGER NOT NULL,
    CONSTRAINT chargeableflight_PK PRIMARY KEY(instanceNumber),
    CONSTRAINT cf_fi_FK FOREIGN KEY (instanceNumber)
        REFERENCES flightinstance (instanceNumber)
);

CREATE TABLE amenity (
    type VARCHAR(50),
    CONSTRAINT amenity_PK PRIMARY KEY(type)
);

CREATE TABLE sale (
    instanceNumber INTEGER NOT NULL, 
    type VARCHAR(50) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    CONSTRAINT sale_PK PRIMARY KEY(instanceNumber, type),
    CONSTRAINT s_cf_FK FOREIGN KEY (instanceNumber)
        REFERENCES chargeableflight (instanceNumber),
    CONSTRAINT s_a_FK FOREIGN KEY (type)
        REFERENCES amenity (type)
);

CREATE TABLE crewMember (
    FAACrewNumber INTEGER, 
    substituteNumber INTEGER,
    CONSTRAINT noselfsub CHECK (substituteNumber != FAACrewNumber),
    lastName VARCHAR(40) NOT NULL,
    firstName VARCHAR(40) NOT NULL, 
    backgroundCheck BOOLEAN NOT NULL, 
    role VARCHAR (50) NOT NULL,
    CONSTRAINT role_check CHECK (role in ('Pilot', 'Co-Pilot', 'Navigator', 'Flight Attendant')),
    scheduleNumber INTEGER NOT NULL,
    CONSTRAINT crewmember_PK PRIMARY KEY(FAACrewNumber),
    CONSTRAINT cm_cm_FK FOREIGN KEY (substituteNumber)
        REFERENCES crewMember (FAACrewNumber),
    CONSTRAINT cm_fs_FK FOREIGN KEY (scheduleNumber)
        REFERENCES flightschedule (scheduleNumber)
);

CREATE TABLE incidentReport (
    reportNumber INTEGER, 
    reporter INTEGER NOT NULL, 
    reported INTEGER NOT NULL, 
    CONSTRAINT noselfreport CHECK (reporter != reported),
    incident VARCHAR(20), 
    duration INTEGER NOT NULL, 
    detail VARCHAR(300) NOT NULL,
    CONSTRAINT incidentreport_PK PRIMARY KEY(reportNumber),
    CONSTRAINT ir_cma_FK FOREIGN KEY (reporter)
        REFERENCES crewmember (FAACrewNumber),
    CONSTRAINT ir_cmb_FK FOREIGN KEY (reported)
        REFERENCES crewmember (FAACrewNumber)
);

CREATE UNIQUE INDEX incidentreport_CK ON incidentreport (reporter, reported, incident, duration);

CREATE TABLE implication (
    instanceNumber INTEGER NOT NULL, 
    reportNumber INTEGER NOT NULL,
    CONSTRAINT implication_PK PRIMARY KEY(instanceNumber, reportNumber),
    CONSTRAINT i_fi_FK FOREIGN KEY (instanceNumber)
        REFERENCES flightinstance (instanceNumber),
    CONSTRAINT i_ir_FK FOREIGN KEY (reportNumber)
        REFERENCES incidentreport (reportNumber)
);