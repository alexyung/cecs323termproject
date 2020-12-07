--The list of all airlines for a given airport. 
select airportname, airlinename from airline natural join airlineservice natural join airport where FAAAbbreviation = 'LAX';

--The list of all flights schedules for a given airline. You must be able to sort this list by starting location, destination, longest flight or shortest flight. 
select airlinename, departureAirport, departureTime, arrivalAirport, arrivalTime from flightschedule where airlinename = 'Air Busing'
order by departureAirport asc;

select airlinename, arrivalAirport, arrivalTime, departureAirport, departureTime from flightschedule where airlinename = 'Air Busing'
order by arrivalAirport asc;

select airlinename, departureAirport, departureTime, arrivalAirport, arrivalTime, flightduration from flightschedule where airlinename = 'Air Busing'
order by flightDuration desc;

select airlinename, departureAirport, departureTime, arrivalAirport, arrivalTime, flightduration from flightschedule where airlinename = 'Air Busing'
order by flightDuration asc;

--Flight schedules that charge for extras (water, etc.)
select distinct schedulenumber, type, departureAirport, departureTime, arrivalAirport, arrivalTime from sale natural join chargeableflight natural join flightinstance natural join flightschedule
order by schedulenumber asc;

--The crew roster for each flight schedule for each airline
select airlinename, schedulenumber, role, lastname, firstname from crewmember natural join flightschedule natural join airline
order by airlinename, schedulenumber, role desc;

--The trips that are available if you do make one stop over 
select distinct a.departureAirport, a.arrivalAirport as "Stopover", b.arrivalAirport from flightschedule a inner join flightschedule b on a.arrivalAirport = b.departureAirport 
where a.departureAirport != b.arrivalAirport;

--Management reports of mifly information that is related to flight schedules, including arriving flights per city, departing flights per city, list of airlines in each service category, crews that fly multiple flights in a single day. 
--arriving flights per city
select city, count(instanceNumber) as "Arriving Flights" from airport inner join flightschedule on airport.FAAAbbreviation = flightschedule.arrivalAirport natural join flightinstance group by city;

--departing flights per city
select city, count(instanceNumber) as "Departing Flights" from airport inner join flightschedule on airport.FAAAbbreviation = flightschedule.departureAirport natural join flightinstance group by city;

--airlines by service category
select range, airlinename from airline order by range;

--all airlines with flights that conflict with their locality
--get international airlines with local/domestic flights
select airlinename, range, schedulenumber
from airline inner join flightschedule using (airlinename)
inner join airport arr on flightschedule.ARRIVALAIRPORT = arr.FAAABBREVIATION
inner join airport dep on flightschedule.DEPARTUREAIRPORT = dep.FAAABBREVIATION
where range = 'INTERNATIONAL' and arr.country = dep.country
union
    --union with domestic airlines that have local/international flights
select airlinename, range, schedulenumber
from airline inner join flightschedule using (airlinename)
inner join airport arr on flightschedule.ARRIVALAIRPORT = arr.FAAABBREVIATION
inner join airport dep on flightschedule.DEPARTUREAIRPORT = dep.FAAABBREVIATION
where range = 'DOMESTIC' and (coalesce(arr.state, 'N/A') = coalesce(dep.state, 'N/A') or arr.country != dep.country)
union
    --union with local airlines that have domestic/international flights
select airlinename, range, schedulenumber
from airline inner join flightschedule using (airlinename)
inner join airport arr on flightschedule.ARRIVALAIRPORT = arr.FAAABBREVIATION
inner join airport dep on flightschedule.DEPARTUREAIRPORT = dep.FAAABBREVIATION
where range = 'LOCAL' and (arr.country != dep.country or coalesce(arr.state, 'N/A') != coalesce(dep.state, 'N/A'));

--get all flight schedules with too many or too few crew members
select * from
(select schedulenumber, count(faacrewnumber) as "Attendant Count" from flightschedule fs inner join crewmember cm using (schedulenumber) where role = 'Flight Attendant' group by schedulenumber) count1 natural join
(select schedulenumber, count(faacrewnumber) as "Navigator Count" from flightschedule fs inner join crewmember cm using (schedulenumber) where role = 'Navigator' group by schedulenumber) count2 natural join
(select schedulenumber, count(faacrewnumber) as "Co-Pilot Count" from flightschedule fs inner join crewmember cm using (schedulenumber) where role = 'Co-Pilot' group by schedulenumber) count3 natural join
(select schedulenumber, count(faacrewnumber) as "Pilot Count" from flightschedule fs inner join crewmember cm using (schedulenumber) where role = 'Pilot' group by schedulenumber) count4
where "Attendant Count" not between 2 and 5 or "Navigator Count" != 1 or "Co-Pilot Count" != 1 or "Pilot Count" != 1;


--A list of all incident reports by flight instance
select instancenumber, reportnumber, rr.FIRSTNAME as "REPORTER FIRST NAME", rr.LASTNAME as "REPORTER LAST NAME", rd.FIRSTNAME as "REPORTED FIRST NAME", rd.LASTNAME as "REPORTED LAST NAME", incident, date from incidentreport natural join implication natural join flightinstance
inner join crewmember rr on incidentreport.reporter = rr.FAACREWNUMBER
inner join crewmember rd on incidentreport.reporter = rd.FAACREWNUMBER
order by instancenumber;

--Flight instances that are scheduled to depart in three days
select instancenumber, date, departureAirport, departureTime, arrivalAirport, arrivalTime from flightinstance natural join flightschedule where {fn TIMESTAMPDIFF(SQL_TSI_DAY, TIMESTAMP(CURRENT_DATE||' 00:00:00'), TIMESTAMP(date||' '||'00:00:00'))} <= 3;

--All flight instances that arrived in the busiest airport in the last week
select date, departureAirport, departureActual, arrivalAirport, arrivalActual 
from flightinstance natural join flightschedule 
where arrivalAirport in
    (select arrivalAirport from
        (select arrivalAirport, count(instancenumber) as "Arrivals" from flightschedule natural join flightinstance where {fn TIMESTAMPDIFF(SQL_TSI_DAY, timestamp(CURRENT_DATE||' 00:00:00'), timestamp(date||' 00:00:00'))} <= 7 group by arrivalAirport) arrivalcount
    group by arrivalAirport having count(instancenumber) = max("Arrivals"))
and {fn TIMESTAMPDIFF(SQL_TSI_DAY, timestamp(CURRENT_DATE||' 00:00:00'), timestamp(date||' 00:00:00'))} <= 7;

--Flight instances that departed more than 30 minutes late.
select instancenumber, departureActual, departureTime, {fn TIMESTAMPDIFF(SQL_TSI_MINUTE, timestamp(date||' '||departureTime), timestamp(date||' '||departureActual))} as "LATE BY" 
from flightinstance natural join flightschedule 
where {fn TIMESTAMPDIFF(SQL_TSI_MINUTE, timestamp(date||' '||departureTime), timestamp(date||' '||departureActual))} > 30;
                                                                                              
--All incidents that occurred between multiple flight instances and their flight instances.
select reportnumber, rr.firstname||' '||rr.lastname as "REPORTER NAME", rs.instancenumber as "REPORTER INSTANCE", rd.FIRSTNAME||' '||rd.lastname as "REPORTED NAME", ds.instancenumber as "REPORTED INSTANCE", incident, detail
from incidentreport inc inner join crewmember rr ON inc.REPORTER = rr.FAACREWNUMBER
inner join crewmember rd on inc.REPORTED = rd.FAACREWNUMBER
inner join flightinstance rs on rr.SCHEDULENUMBER = rs.SCHEDULENUMBER
inner join flightinstance ds on rd.SCHEDULENUMBER = ds.SCHEDULENUMBER
where reportnumber in                                                                                              
    (select reportnumber from implication group by reportnumber having count(instancenumber) > 1);   
                                                                           
                                                                                              
--Return the flight instances with their status
select instancenumber, departuretime, departureActual, arrivaltime, arrivalactual,
case when flightinstance.departureActual <= flightSchedule.departureTime THEN 'ON TIME' 
ELSE 'DELAYED' END AS Status
from flightinstance 
natural join flightschedule
order by status, instancenumber;

--Return flight instances with departure time, arrival time, and flight duration
SELECT flightInstance.INSTANCENUMBER AS "INSTANCE NUMBER", flightInstance.FLIGHTDURATIONACTUAL AS "FLIGHT DURATION",
flightSchedule.DEPARTUREAIRPORT AS "DEPARTURE AIRPORT", flightInstance.DEPARTUREACTUAL AS "DEPARTURE TIME", 
flightSchedule.ARRIVALAIRPORT As "ARRIVAL AIRPORT", flightInstance.ARRIVALACTUAL AS "ARRIVAL TIME"
FROM flightInstance
INNER JOIN flightSchedule ON flightSchedule.SCHEDULENUMBER = flightInstance.SCHEDULENUMBER
order by flightduration asc;

-- Returns crew number, last name, first name , subsitute number, substitute last name, substitute first name                                                                                              
select a.faacrewnumber, a.lastname, a.firstname, b.faacrewnumber as "SUB Number", b.lastname as "Sub LastName", b.firstname as "Sub FirstName" 
from crewmember as a
join crewmember as b
on a.substitutenumber= b.faacrewnumber;
