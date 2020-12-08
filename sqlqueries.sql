--1. The list of all airlines for a given airport. 
select airportname, airlinename 
from airline natural join airlineservice 
natural join airport 
where FAAAbbreviation = 'LAX';


--2. The list of all flight schedules for a given airline. You must be able to sort this list by starting location, destination, longest flight or shortest flight. 
--a. sorted by starting location
select departureAirport, departureTime, airlinename, arrivalAirport, arrivalTime 
from flightschedule 
where airlinename = 'Air Busing'
order by departureAirport asc;

--b. sorted by destination
select  arrivalAirport, arrivalTime, departureAirport, departureTime, airlinename 
from flightschedule 
where airlinename = 'Air Busing'
order by arrivalAirport asc;

--c. sorted by longest flight
select flightduration, airlinename, departureAirport, departureTime, arrivalAirport, arrivalTime 
from flightschedule 
where airlinename = 'Air Busing'
order by flightDuration desc;

--d. sorted by shortest flight
select flightduration, airlinename, departureAirport, departureTime, arrivalAirport, arrivalTime
from flightschedule 
where airlinename = 'Air Busing'
order by flightDuration asc;


--3. Flight schedules that charge for extras (water, etc.)
select distinct schedulenumber, type, price, departureAirport, departureTime, arrivalAirport, arrivalTime 
from sale 
natural join chargeableflight 
natural join flightinstance 
natural join flightschedule
order by schedulenumber asc;


--4. The crew roster for each flight schedule for each airline
select airlinename, schedulenumber, role, lastname, firstname 
from crewmember 
natural join flightschedule 
natural join airline
order by airlinename, schedulenumber, role desc;


--5. The trips that are available if you do make one stop over 
select distinct a.departureAirport, a.arrivalAirport as "Stopover", b.arrivalAirport 
from flightschedule a 
inner join flightschedule b on a.arrivalAirport = b.departureAirport 
where a.departureAirport != b.arrivalAirport;


--6. Management reports of mifly information that is related to flight schedules, including arriving flights per city, departing flights per city, list of airlines in each service category, crews that fly multiple flights in a single day. 
--a. arriving flights per city
select city, instancenumber, arrivalActual, arrivalAirport, departureActual, departureAirport, date
from airport 
inner join flightschedule on airport.FAAAbbreviation = flightschedule.arrivalAirport 
natural join flightinstance
order by city;

--b. departing flights per city
select city, instancenumber, departureActual, departureAirport, arrivalActual, arrivalAirport, date
from airport 
inner join flightschedule on airport.FAAAbbreviation = flightschedule.departureAirport 
natural join flightinstance
order by city;

--c. airlines by service category
select range, airlinename 
from airline 
order by range;

--d. crews that fly multiple flights in a single day
--NOTE: we discussed on December 07 during your office hours, 
-- and found that our database model was incorrectly modeled and unable to deal with this query.
--We agreed on a different query:
--d. Get all flight schedules who have an incorrect number of crew members.
select schedulenumber, "Pilot Count", "Co-Pilot Count", "Navigator Count", "Attendant Count" from
(select schedulenumber, count(faacrewnumber) as "Attendant Count" from flightschedule fs inner join crewmember cm using (schedulenumber) where role = 'Flight Attendant' group by schedulenumber) count1 natural join
(select schedulenumber, count(faacrewnumber) as "Navigator Count" from flightschedule fs inner join crewmember cm using (schedulenumber) where role = 'Navigator' group by schedulenumber) count2 natural join
(select schedulenumber, count(faacrewnumber) as "Co-Pilot Count" from flightschedule fs inner join crewmember cm using (schedulenumber) where role = 'Co-Pilot' group by schedulenumber) count3 natural join
(select schedulenumber, count(faacrewnumber) as "Pilot Count" from flightschedule fs inner join crewmember cm using (schedulenumber) where role = 'Pilot' group by schedulenumber) count4
where "Attendant Count" not between 2 and 5 or "Navigator Count" != 1 or "Co-Pilot Count" != 1 or "Pilot Count" != 1;


--7. A list of all incident reports by flight instance
select instancenumber, reportnumber, rr.FIRSTNAME as "REPORTER FIRST NAME", rr.LASTNAME as "REPORTER LAST NAME", rd.FIRSTNAME as "REPORTED FIRST NAME", rd.LASTNAME as "REPORTED LAST NAME", incident, date from incidentreport natural join implication natural join flightinstance
inner join crewmember rr on incidentreport.reporter = rr.FAACREWNUMBER
inner join crewmember rd on incidentreport.reported = rd.FAACREWNUMBER
order by instancenumber;


--8. Flight instances that are scheduled to depart in three days
select instancenumber, date, departureAirport, departureTime, arrivalAirport, arrivalTime, {fn TIMESTAMPDIFF(SQL_TSI_DAY, TIMESTAMP(CURRENT_DATE||' 00:00:00'), TIMESTAMP(date||' '||'00:00:00'))} as "DAYS TO DEPART"
from flightinstance natural join flightschedule 
where {fn TIMESTAMPDIFF(SQL_TSI_DAY, TIMESTAMP(CURRENT_DATE||' 00:00:00'), TIMESTAMP(date||' '||'00:00:00'))} between 0 and 3;


--9. All flight instances that arrived in the busiest airport in the last week
select date, arrivalAirport, arrivalActual, departureAirport, departureActual, {fn TIMESTAMPDIFF(SQL_TSI_DAY, timestamp(date||' 00:00:00'), timestamp(CURRENT_DATE||' 00:00:00'))} as "DAYS SINCE ARRIVAL"
from flightinstance natural join flightschedule
where arrivalAirport in
(select arrivalAirport from
    (select arrivalAirport, count(instancenumber) as "Arrivals" from flightschedule natural join flightinstance where {fn TIMESTAMPDIFF(SQL_TSI_DAY, timestamp(date||' 00:00:00'), timestamp(CURRENT_DATE||' 00:00:00'))} between 0 and 7 group by arrivalAirport) arrivalCount
 where "Arrivals" =
    (select max("Arrivals") from
        (select arrivalAirport, count(instancenumber) as "Arrivals" from flightschedule natural join flightinstance where {fn TIMESTAMPDIFF(SQL_TSI_DAY, timestamp(date||' 00:00:00'), timestamp(CURRENT_DATE||' 00:00:00'))} between 0 and 7 group by arrivalAirport) arrivalcount))
and {fn TIMESTAMPDIFF(SQL_TSI_DAY, timestamp(date||' 00:00:00'), timestamp(CURRENT_DATE||' 00:00:00'))} between 0 and 7;


--10. Flight instances that departed more than 30 minutes late.
select instancenumber, departureActual, departureTime, {fn TIMESTAMPDIFF(SQL_TSI_MINUTE, timestamp(date||' '||departureTime), timestamp(date||' '||departureActual))} as "LATE BY" 
from flightinstance natural join flightschedule 
where {fn TIMESTAMPDIFF(SQL_TSI_MINUTE, timestamp(date||' '||departureTime), timestamp(date||' '||departureActual))} > 30;
         

--11. Personal business rule queries                                                                                     
--a. All incidents that occurred between multiple flight instances and their flight instances.
select e.reportnumber, d.instancenumber as "INSTANCE 1", d.departureactual as "DEPARTURE 1", a.departureairport as "ORIGIN 1",
 d.ARRIVALACTUAL as "ARRIVAL 1", a.ARRIVALAIRPORT as "DESTINATION 1",
 f.instancenumber as "INSTANCE 2", f.DEPARTUREACTUAL as "DEPARTURE 2", b.DEPARTUREAIRPORT as "ORIGIN 2",
 f.ARRIVALACTUAL as "ARRIVAL 2", b.ARRIVALAIRPORT as "DESTINATION 2", incident, detail
from (implication c natural join flightinstance d natural join flightschedule a)
inner join (implication e natural join flightinstance f natural join flightschedule b) using (reportnumber)
natural join incidentreport
where reportnumber in(
    select reportnumber
    from incidentreport natural join implication
    group by reportnumber
    having count(instancenumber)>1)
and d.INSTANCENUMBER > f.INSTANCENUMBER;
                                             
                                                                                                                                           
--b. Return the flight instances with their status
select instancenumber, departuretime, departureActual, arrivaltime, arrivalactual,
case when flightinstance.departureActual <= flightSchedule.departureTime THEN 'ON TIME' 
ELSE 'DELAYED' END AS Status
from flightinstance 
natural join flightschedule
order by status, instancenumber;


--c. Return flight instances with departure time, arrival time, and flight duration
SELECT flightInstance.INSTANCENUMBER AS "INSTANCE NUMBER", flightInstance.FLIGHTDURATIONACTUAL AS "FLIGHT DURATION",
flightSchedule.DEPARTUREAIRPORT AS "DEPARTURE AIRPORT", flightInstance.DEPARTUREACTUAL AS "DEPARTURE TIME", 
flightSchedule.ARRIVALAIRPORT As "ARRIVAL AIRPORT", flightInstance.ARRIVALACTUAL AS "ARRIVAL TIME"
FROM flightInstance
INNER JOIN flightSchedule ON flightSchedule.SCHEDULENUMBER = flightInstance.SCHEDULENUMBER
order by flightduration asc;


--d. Returns crew number, last name, first name , subsitute number, subsittute last name, substitue first name                                                                                              
select a.faacrewnumber, a.lastname, a.firstname, b.faacrewnumber as "SUB Number", b.lastname as "Sub LastName", b.firstname as "Sub FirstName" 
from crewmember as a
join crewmember as b
on a.substitutenumber= b.faacrewnumber;