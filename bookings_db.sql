select * from cd.bookings;

select * from cd.facilities;

select * from cd.members;

-- retrieve all data from cd.facilities
select * from  cd.facilities;

-- retrieve a list of facility names and cost

select name,membercost from cd.facilities;

--list of facilities that charge a fee to members.

select * from cd.facilities;

select name from cd.facilities
where membercost != 0;

-- list of facilities that charge a fee to members, and fee is less than 1/50th of the monthly maintananace cost
select * from cd.facilities;

select name, facid, membercost, monthlymaintenance from cd.facilities

where membercost  > 0
and 
(membercost < monthlymaintenance/50.0);

--- a list of all facilities with the word tennis in theri name

select * from cd.facilities

where name like '%Tennis%';

---retrieve id for facilities with id 1 and 5 without using the OR operator.

select * from cd.facilities where facid in(1,5);

-- list of members who joined after september 2012, memid, surname, firstname, and joindate
select * from cd.members;

select memid,surname,firstname, joindate from cd.members

where joindate >= '2012-09-01';

-- ordered list of first 10 surnames in the members table.

select distinct  surname from cd.members
order by surname
limit 10;

-- retrieve the last signup date of member.

select max(joindate) as last_signup from cd.members;

--- count facilities that have cost to guests of 10 or more

select count(name) from cd.facilities
where guestcost >= 10;

-- retrieve the list of total slots boked per facility in the month of september 2012, 
--output should contain facility id and slots, sorted by slots.
--faceid,slots,orderby, month,
select * from cd.bookings;

select facid,sum(slots) as totalslots from cd.bookings
where starttime >= '2012-09-01' and starttime < '2012-10-01'
group by facid
order by sum(slots);

-- list of facilities with more than 1000 slots booked , output table should consist
-- faceid, total slots, sorted by facid

select facid,sum(slots) as total_slots from cd.bookings
group by facid  having sum(slots) > 1000
order by facid;
--- list of booking dates for tennis courts for the date 2012-09-21, return starttime and facility name
SELECT cd.bookings.starttime AS start, cd.facilities.name 
AS name 
FROM cd.facilities 
INNER JOIN cd.bookings
ON cd.facilities.facid = cd.bookings.facid 
WHERE cd.facilities.facid IN (0,1) 
AND cd.bookings.starttime >= '2012-09-21' 
AND cd.bookings.starttime < '2012-09-22' 
ORDER BY cd.bookings.starttime;

-- starttime for boking members name Davis Farell

SELECT cd.bookings.starttime 
FROM cd.bookings 
INNER JOIN cd.members ON 
cd.members.memid = cd.bookings.memid 
WHERE cd.members.firstname='David' 
AND cd.members.surname='Farrell';


--- review data type, pkey, fkey and constraints documentation in postgresql


-- create Table
-- create table _name( column_name TYPE Column_constraint, column_name TYPE column_constraint, table_constraint
--table_constraint)
--inherits existing_table_name;
-- serial data type, creates a sequence object 












































