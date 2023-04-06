/*Retrieve everything from a table*/

SELECT * from cd.facilities

/*Retrieve specific columns from a table*/

select name, membercost from cd.facilities

/*Control which rows are retrieved*/

select * from cd.facilities where membercost > 0

/*Control which rows are retrieved - part 2*/

select facid, name, membercost, monthlymaintenance
from cd.facilities
where membercost < 1.0/50*(monthlymaintenance)
  and membercost > 0