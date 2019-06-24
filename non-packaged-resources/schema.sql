create table facet_base(
    fid serial,
    hub text,
    slot0 text,
    slot1 text,
    slot2 text,
    slot3 text,
    slot4 text,
    slot5 text
    );
    
create view facet as select
    fid,
    hub,
    regexp_replace(slot0||'/'||coalesce(slot1,'')||'/'||coalesce(slot2,'')||'/'||coalesce(slot3,'')||'/'||coalesce(slot4,'')||'/'||coalesce(slot5,''), '/+$','') as path,
    slot0,
    slot1,
    slot2,
    slot3,
    slot4,
    slot5
from facet_base;
