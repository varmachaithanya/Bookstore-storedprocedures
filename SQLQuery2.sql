select * from detailemp


create index Ix_detailsemp_id
on detailemp(id)

select age from detailemp

drop index detailemp.Ix_detailsemp_id

create nonclustered index Ix_ep_id
on detailemp(age desc)
