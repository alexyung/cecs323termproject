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