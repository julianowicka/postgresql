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

/*Basic string searches*/

select * from cd.facilities
where name like '%Tennis%'

/*Matching against multiple possible values*/
select * from cd.facilities
where facid IN ( '1','5')

/*Classify results into buckets*/

select name,
       case
           WHEN monthlymaintenance >100 then 'expensive'
           else 'cheap'
           END as cost,
       facid
from cd.facilities

/*Working with dates*/

select memid, surname, firstname, joindate
from cd.members
where joindate >= '2012-09-01'

/*Removing duplicates, and ordering results*/

select distinct surname from cd.members
order by surname limit 10

/*Combining results from multiple queries*/

select surname from cd.members
union
select name from cd.facilities

/*Simple aggregation*/

select MIN(joindate) as oldest, MAX (joindate)
as latest
from cd.members