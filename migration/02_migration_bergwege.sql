delete from alw_strukturverbesserungen.raeumlicheelemnte_wegebau_linie;
delete from alw_strukturverbesserungen.raeumlicheelemnte_werkseigentum;
insert into alw_strukturverbesserungen.raeumlicheelemnte_werkseigentum 
select 
  nextval('alw_strukturverbesserungen.t_ili2db_seq') as t_id,
  uuid_generate_v4() AS t_ili_tid,
  werkeigentuemer as aname,
  'unbekannt' as adresse
from alw_migration.alw_bergwege
 where archive = 0 and werkeigentuemer != '1'
 group by werkeigentuemer;

insert into alw_strukturverbesserungen.raeumlicheelemnte_wegebau_linie
select 
 nextval('alw_strukturverbesserungen.t_ili2db_seq') as t_id,
 uuid_generate_v4() AS t_ili_tid,
 case when belag = 1 then 'Bituminoeser_Weg'
      when belag = 2 then 'Kiesweg'
 end as typ,
 case when letzte_pwi is not null and letzte_pwi != 0 then 'PWI' else 'Neubau' end as bautyp,
 null as fahrbahnbreite,
 wkb_geometry as geometry,
 'Nebenwege_fahrbar' as funktionstyp,
 null as bezeichnung,
 100 as anteil_lw,
 null as techn_schwierigkeit,
 Round(ST_Length(wkb_geometry) / 5)*5 as laenge_gerundet,
 'unbekannt' as astatus,
 case when letzte_pwi is not null and letzte_pwi != 0 then to_date(letzte_pwi::text || '-01-01','YYYY-MM-DD') else to_date('1800-01-01','YYYY-MM-DD') end as status_datum,
 null as bauabnahme_datum,
 null as werksid,
 null as unterhaltsid,
 null as projekt,
 (select we.t_id from alw_strukturverbesserungen.raeumlicheelemnte_werkseigentum we where we.aname = bw.werkeigentuemer) as werkeigentum
from 
 alw_migration.alw_bergwege bw
where belag in (1,2) and archive = 0