/* Retrieve the start times of members' bookings */
select starttime from
cd.members inner join cd.bookings
on
cd.members.memid = cd.bookings.memid
where
surname = 'Farrell'
and
firstname = 'David'

