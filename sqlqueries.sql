--The list of all airlines for a given airport. 
select name from airline natural join airlineservice natural join airport where FAAAbbreviation = ?;

--The list of all flights schedules for a given airline. You must be able to sort this list by starting location, destination, longest flight or shortest flight. 
select departureAirport, departureTime, arrivalAirport, arrivalTime from flightschedule where airlinename = ?
order by departureAirport asc;

select departureAirport, departureTime, arrivalAirport, arrivalTime from flightschedule where airlinename = ?
order by arrivalAirport asc;

select departureAirport, departureTime, arrivalAirport, arrivalTime from flightschedule where airlinename = ?
order by flightDuration asc;

select departureAirport, departureTime, arrivalAirport, arrivalTime from flightschedule where airlinename = ?
order by flightDuration desc;

--Flight schedules that charge for extras (water, etc.)
select distinct schedulenumber from chargeableflights natural join flightinstance natural join flightschedule;

--The crew roster for each flight schedule for each airline
select airlinename, schedulenumber, role, lastname, firstname from crewmember natural join flightschedule natural join airline
order by airlinename, schedulenumber, role desc;

--The trips that are available if you do make one stop over 
select a.departureAirport, a.arrivalAirport as "Stopover", b.arrivalAirport from flightschedule a inner join flightschedule b on a.arrivalAirport = b.departureAirport;

--Management reports of mifly information that is related to flight schedules, including arriving flights per city, departing flights per city, list of airlines in each service category, crews that fly multiple flights in a single day. 
select city, count(instanceNumber) from airport inner join flightschedule on airport.FAAAbbreviation = flightschedule.arrivalAirport natural join flightinstance group by city;

select city, count(instanceNumber) from airport inner join flightschedule on airport.FAAAbbreviation = flightschedule.departureAirport natural join flightinstance group by city;

select airlinename, range from airline order by range;

--select lastname, firstname, date from crewmember

--A list of all incident reports by flight instance
select instancenumber, reportnumber, reporter, reported, incident, date from incidentreport natural join implication natural join flightinstance
group by instancenumber;

--Flight instances that are scheduled to depart in three days
select schedulenumber, date from flightinstance where {fn datediff(SQL_TSI_DAY, CURRENT_DAY, date)} <= 3;

--All flight instances that arrived in the busiest airport in the last week
select instancenumber from flightinstance where arrivalAirport in
(select arrivalAirport from
(select arrivalAirport, count(instancenumber) as "Arrivals" from flightschedule natural join flightinstance where {fn datediff(SQL_TSI_DAY, CURRENT_DATE, date)} <= 7 group by arrivalAirport) arrivalcount
group by arrivalAirport having count(instancenumber) = max("Arrivals"));

--Flight instances that departed more than 30 minutes late.
select instancenumber from flightinstance natural join flightschedule where {fn timestampdiff(SQL_TSI_MINUTE, departureactual, departuretime)} >30;
                                                                                              
--All incidents that occurred between multiple flight instances departing from different airports.
select reportnumber, reporter, reported from incidentreport where reportnumber in                                                                                              
(select reportnumber from implication group by reportnumber having count(instancenumber) > 1);                                                                                              
                                                                                              
--Return the flight instances with their status
select instancenumber,
case when flightinstance.departureActual <= flightSchedule.departureTime THEN 'ON TIME' 
ELSE 'DELAYED' END AS Status
from flightinstance 
natural join flightschedule

--Return flight instances with departiure time, arrival time, and flight duration
SELECT flightInstance.INSTANCENUMBER AS "FLIGHTINSTANCE", flightInstance.FLIGHTDURATIONACTUAL AS "FLIGHTDURATION",
flightSchedule.DEPARTUREAIRPORT AS "DEP_AIRPORT", flightInstance.DEPARTUREACTUAL AS "DEP_AIRPORT_DEPARTURETIME", 
flightSchedule.ARRIVALAIRPORT As "ARR_AIRPORT", flightInstance.ARRIVALACTUAL AS "ARR_AIRPORT_ARRIVALTIME"
FROM flightInstance
INNER JOIN flightSchedule ON flightSchedule.SCHEDULENUMBER = flightInstance.SCHEDULENUMBER;
                                                                                              
    
-- Returns crew number, last name, first name , subsitute number, subsittute last name, substitue first name                                                                                              
select a.faacrewnumber, a.lastname, a.firstname, b.faacrewnumber as "SUB Number", b.lastname as "Sub LastName", b.firstname as "Sub FirstName" 
from crewmember as a
join crewmember as b
on a.substitutenumber= b.faacrewnumber;

