/* Retrieve the start times of members' bookings */
select starttime from
cd.members inner join cd.bookings
on
cd.members.memid = cd.bookings.memid
where
surname = 'Farrell'
and
firstname = 'David'

/*Work out the start times of bookings for tennis courts*/
select starttime, name from
cd.bookings inner join cd.facilities
on cd.bookings.facid = cd.facilities.facid
where
name like 'Tennis%'
and
starttime >= '2012-09-21 00:00:00'
and
starttime < '2012-09-22 00:00:00'

/*Produce a list of all members who have recommended another member*/
select distinct a.firstname, a.surname from cd.members a
inner join cd.members b
on a.memid = b.recommendedby
order by a.surname, a.firstname