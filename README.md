# cecs323termproject
A Derby SQL group project involving modelling a worldwide flight recording database.

Project requirements/specifications:

You are designing a database to track airline related information. I'm a frequent flyer and have found that existing airline reservation systems just don't provide the data and reports that I need to handle all my travel so I've hired you to create a specialized airline database just for me. Let's name this system "mifly". 
In my travels, I have flown into and out of many different airports. Each of these airports has a name, a location, and an FAA-approved abbreviation. For example: Dulles Airport, Washington DC, IAD or Kennedy Airport, New York, JFK. Sometimes an area is so large that is can be serviced by multiple airports. If my destination again happens to be the Washington DC area, I can fly into Dulles airport, Reagan National Airport or Baltimore Washington International Airport. New York is serviced by Kennedy, La Guardia and Newark. 

An airline can fly into and out of many airports. Each airline has a name and is headquartered in one particular city. An airline headquartered in the United States can either fly locally (limited to a portion of the country), domestic (the entire United States) or International (outside of the United States). 
An airline can own any number of planes. These planes are made by a specific manufacturer with a specific model number (ex. Boeing 747) and hold a set number of passengers. Each of these airplanes have a tail number assigned by the FAA (ex. TB134). Some of the airplanes are even given names. Recently JetBlue airline had a contest to name each of their planes (ex. Bluebird). 

Travel on an airplane is referred to as a flight schedule. Each flight schedule is arranged to leave a particular airport and return to a different airport. The flight schedule is identified by the airline and a number assigned by the airline itself. This flight schedule is associated with a specific departure time and an arrival time. The same flight schedule is used any day of the week that an airlines flies between the same airports at the same time. For example, JetBlue flight 87 leaves from the Long Beach airport at 7am and arrives at JFK airport in New York at 3pm on the same day. This is a flight schedule.
The actual occurrence of a flight on a specific date should be considered a flight instance. The instance of JetBlue fight 87 that occurs on August 10, 2019 is a flight instance. Instances of a flight schedule are the actual flight instances from one airport to another on a specific date. Although instances of a flight are set to arrive and depart at specific times, the actual times can be different.

An airplane is assigned to a flight instance.

Each flight schedule is assigned a specific crew. Each crew is composed of one pilot, one co-pilot, one navigator, and anywhere from two to five flight attendants according to the number of passengers an airplane holds and the length of the flight. 
Due to the tightened security restrictions, each crew member undergoes a background check by the FAA and is assigned an FAA number before being allowed on an airplane. 

With the rising cost of gasoline, some airlines are now charging for water, pillows and blankets, and checking bags on a per flight basis on local or domestic flight. 
You will also need to support generation of an Incident report - this allows a flight crew employee to file a report related to any type of incident that occurred on a flight. It could be a problem, a concern, an emergency, or recognition of good customer service. This report involves a flight instance, the type of incident, a description of the incident, the crew member reporting the incident, and the crew member involved in the incident. 

You may assume that all flights are non-stop. You don't need to worry about changing planes or detailing portions of a flight.
Model this enterprise using only the information supplied here. Do not model any processes not mentioned here such as payments, travel agents, customers, etc. 
You should use your knowledge of airlines and flying in general, and you may want to pay new, closer attention to details of the operation of any airline or airport sites you may visit on the web as you are working on this assignment. 

Each team member will add one more business rules (requirements) to the above business rules.  You will have to provide some means to enforce these business rules in your database, either by means database constraint such as referential integrity, uniqueness constraint, not null constraint, trigger, function, stored procedure or the like.  The business rule needs to be something that will show up in the model of your design.  None of your additional business rules can contradict any of the business rules provided in the project definition.

Each team member will also have to create one more query related to those business rules.
