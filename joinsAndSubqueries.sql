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

/*Produce a list of all members, along with their recommender*/
select *  from cd.members a
left outer join cd.members b
on
b.memid = a.recommendedby
order by a.surname, a.firstname

/*Produce a list of all members who have used a tennis court*/
select * from cd.bookings b
inner join cd.facilities f
on
b.facid = f.facid
inner join cd.members m
on
b.memid = m.memid
where
b.bookid=1

/*Produce a list of costly bookings*/
select
firstname ||' ' || surname, name,
case
when cd.members.memid = 0 then slots*guestcost
else slots*membercost
end as cost
from cd.bookings join cd.facilities
on
cd.bookings.facid=cd.facilities.facid
join cd.members
on
cd.bookings.memid = cd.members.memid
where
starttime >= '2012-09-14 00:00:00'
and
starttime < '2012-09-15 00:00:00'
and
((
  cd.members.memid = 0 and slots*guestcost > 30
  )or(
	cd.members.memid !=0 and slots*membercost > 30
	))
order by cost desc

/*Produce a list of all members, along with their recommender, using no joins*/
select distinct firstname || ' ' || surname as member, (
  select firstname || ' ' || surname as recommender from cd.members b where m.recommendedby = b.memid
)
from cd.members m
order by member asc, recommender asc
