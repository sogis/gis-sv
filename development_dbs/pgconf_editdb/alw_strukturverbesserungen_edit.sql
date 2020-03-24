CREATE SCHEMA IF NOT EXISTS alw_strukturverbesserungen;
CREATE SEQUENCE alw_strukturverbesserungen.t_ili2db_seq;;
-- GeometryCHLV95_V1.LineStructure
CREATE TABLE alw_strukturverbesserungen.linestructure (
  T_Id bigint PRIMARY KEY DEFAULT nextval('alw_strukturverbesserungen.t_ili2db_seq')
  ,T_Seq bigint NULL
  ,line geometry(LINESTRING,2056) NULL
  ,multiline_lines bigint NULL
)
;
CREATE INDEX linestructure_line_idx ON alw_strukturverbesserungen.linestructure USING GIST ( line );
CREATE INDEX linestructure_multiline_lines_idx ON alw_strukturverbesserungen.linestructure ( multiline_lines );
-- GeometryCHLV95_V1.MultiLine
CREATE TABLE alw_strukturverbesserungen.multiline (
  T_Id bigint PRIMARY KEY DEFAULT nextval('alw_strukturverbesserungen.t_ili2db_seq')
  ,T_Seq bigint NULL
)
;
-- GeometryCHLV95_V1.SurfaceStructure
CREATE TABLE alw_strukturverbesserungen.surfacestructure (
  T_Id bigint PRIMARY KEY DEFAULT nextval('alw_strukturverbesserungen.t_ili2db_seq')
  ,T_Seq bigint NULL
  ,surface geometry(POLYGON,2056) NULL
  ,multisurface_surfaces bigint NULL
)
;
CREATE INDEX surfacestructure_surface_idx ON alw_strukturverbesserungen.surfacestructure USING GIST ( surface );
CREATE INDEX surfacestructure_multisurface_surfaces_idx ON alw_strukturverbesserungen.surfacestructure ( multisurface_surfaces );
-- GeometryCHLV95_V1.MultiSurface
CREATE TABLE alw_strukturverbesserungen.multisurface (
  T_Id bigint PRIMARY KEY DEFAULT nextval('alw_strukturverbesserungen.t_ili2db_seq')
  ,T_Seq bigint NULL
)
;
-- SO_ALW_Strukturverbesserungen_20190912.Stand_Gueterregulierung.Stand_Gueterregulierung
CREATE TABLE alw_strukturverbesserungen.stand_gutrrglrung_stand_gueterregulierung (
  T_Id bigint PRIMARY KEY DEFAULT nextval('alw_strukturverbesserungen.t_ili2db_seq')
  ,T_Ili_Tid uuid NULL DEFAULT uuid_generate_v4()
  ,bfsnr integer NOT NULL
  ,stand varchar(255) NOT NULL
)
;
COMMENT ON COLUMN alw_strukturverbesserungen.stand_gutrrglrung_stand_gueterregulierung.bfsnr IS 'BFSNr. einer Gemeinde';
COMMENT ON COLUMN alw_strukturverbesserungen.stand_gutrrglrung_stand_gueterregulierung.stand IS 'Stand der Güterregulierung';
-- SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Dokument
CREATE TABLE alw_strukturverbesserungen.raeumlicheelemnte_dokument (
  T_Id bigint PRIMARY KEY DEFAULT nextval('alw_strukturverbesserungen.t_ili2db_seq')
  ,T_Ili_Tid uuid NULL DEFAULT uuid_generate_v4()
  ,titel varchar(30) NOT NULL
  ,typ varchar(255) NOT NULL
  ,dateipfad varchar(255) NOT NULL
  ,wiederherstellungs_punkt bigint NOT NULL
)
;
CREATE INDEX raeumlicheelemnte_dokument_wiederherstellungs_punkt_idx ON alw_strukturverbesserungen.raeumlicheelemnte_dokument ( wiederherstellungs_punkt );
-- SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Genossenschaft
CREATE TABLE alw_strukturverbesserungen.raeumlicheelemnte_genossenschaft (
  T_Id bigint PRIMARY KEY DEFAULT nextval('alw_strukturverbesserungen.t_ili2db_seq')
  ,T_Ili_Tid uuid NULL DEFAULT uuid_generate_v4()
  ,typ varchar(255) NOT NULL
  ,aname varchar(100) NOT NULL
  ,gruendungsdatum date NOT NULL
  ,genehmigungsdatum date NOT NULL
  ,reorganisationsdatum date NULL
  ,aufloesungsdatum date NULL
  ,bemerkung varchar(255) NULL
  ,geometrie geometry(MULTIPOLYGON,2056) NOT NULL
  ,unterhaltsobjekt varchar(50) NULL
)
;
CREATE INDEX raeumlichelmnt_gnssnschaft_geometrie_idx ON alw_strukturverbesserungen.raeumlicheelemnte_genossenschaft USING GIST ( geometrie );
-- SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Werkseigentum
CREATE TABLE alw_strukturverbesserungen.raeumlicheelemnte_werkseigentum (
  T_Id bigint PRIMARY KEY DEFAULT nextval('alw_strukturverbesserungen.t_ili2db_seq')
  ,T_Ili_Tid uuid NULL DEFAULT uuid_generate_v4()
  ,aname varchar(50) NOT NULL
  ,adresse varchar(50) NOT NULL
)
;
-- SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Oekologie_Punkt
CREATE TABLE alw_strukturverbesserungen.raeumlicheelemnte_oekologie_punkt (
  T_Id bigint PRIMARY KEY DEFAULT nextval('alw_strukturverbesserungen.t_ili2db_seq')
  ,T_Ili_Tid uuid NULL DEFAULT uuid_generate_v4()
  ,typ varchar(255) NOT NULL
  ,geometrie geometry(POINT,2056) NOT NULL
  ,astatus varchar(255) NOT NULL
  ,status_datum date NOT NULL
  ,bauabnahme_datum date NULL
  ,werksid varchar(20) NULL
  ,unterhaltsid varchar(20) NULL
  ,projekt bigint NULL
  ,werkeigentum bigint NULL
)
;
CREATE INDEX raeumlicheelemnte_klg_pnkt_geometrie_idx ON alw_strukturverbesserungen.raeumlicheelemnte_oekologie_punkt USING GIST ( geometrie );
CREATE INDEX raeumlicheelemnte_klg_pnkt_projekt_idx ON alw_strukturverbesserungen.raeumlicheelemnte_oekologie_punkt ( projekt );
CREATE INDEX raeumlicheelemnte_klg_pnkt_werkeigentum_idx ON alw_strukturverbesserungen.raeumlicheelemnte_oekologie_punkt ( werkeigentum );
-- SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Wegebau_Linie
CREATE TABLE alw_strukturverbesserungen.raeumlicheelemnte_wegebau_linie (
  T_Id bigint PRIMARY KEY DEFAULT nextval('alw_strukturverbesserungen.t_ili2db_seq')
  ,T_Ili_Tid uuid NULL DEFAULT uuid_generate_v4()
  ,typ varchar(255) NOT NULL
  ,bautyp varchar(255) NOT NULL
  ,fahrbahnbreite decimal(3,1) NULL
  ,geometrie geometry(MULTILINESTRING,2056) NOT NULL
  ,funktionstyp varchar(255) NOT NULL
  ,bezeichnung varchar(50) NULL
  ,anteil_lw integer NULL
  ,techn_schwierigkeit varchar(255) NULL
  ,laenge_gerundet integer NULL
  ,astatus varchar(255) NOT NULL
  ,status_datum date NOT NULL
  ,bauabnahme_datum date NULL
  ,werksid varchar(20) NULL
  ,unterhaltsid varchar(20) NULL
  ,projekt bigint NULL
  ,werkeigentum bigint NULL
)
;
CREATE INDEX raeumlicheelemnte_wgb_lnie_geometrie_idx ON alw_strukturverbesserungen.raeumlicheelemnte_wegebau_linie USING GIST ( geometrie );
CREATE INDEX raeumlicheelemnte_wgb_lnie_projekt_idx ON alw_strukturverbesserungen.raeumlicheelemnte_wegebau_linie ( projekt );
CREATE INDEX raeumlicheelemnte_wgb_lnie_werkeigentum_idx ON alw_strukturverbesserungen.raeumlicheelemnte_wegebau_linie ( werkeigentum );
COMMENT ON COLUMN alw_strukturverbesserungen.raeumlicheelemnte_wegebau_linie.fahrbahnbreite IS 'in Meter';
COMMENT ON COLUMN alw_strukturverbesserungen.raeumlicheelemnte_wegebau_linie.anteil_lw IS 'Angaben in Prozent (0-100)';
COMMENT ON COLUMN alw_strukturverbesserungen.raeumlicheelemnte_wegebau_linie.laenge_gerundet IS 'auf 5m gerundet';
-- SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Wiederherstellung_Punkt
CREATE TABLE alw_strukturverbesserungen.raeumlicheelemnte_wiederherstellung_punkt (
  T_Id bigint PRIMARY KEY DEFAULT nextval('alw_strukturverbesserungen.t_ili2db_seq')
  ,T_Ili_Tid uuid NULL DEFAULT uuid_generate_v4()
  ,typ varchar(255) NOT NULL
  ,geometrie geometry(POINT,2056) NOT NULL
  ,astatus varchar(255) NOT NULL
  ,status_datum date NOT NULL
  ,bauabnahme_datum date NULL
  ,werksid varchar(20) NULL
  ,unterhaltsid varchar(20) NULL
  ,projekt bigint NULL
  ,werkeigentum bigint NULL
)
;
CREATE INDEX raemlchlmnt_whrstllng_pnkt_geometrie_idx ON alw_strukturverbesserungen.raeumlicheelemnte_wiederherstellung_punkt USING GIST ( geometrie );
CREATE INDEX raemlchlmnt_whrstllng_pnkt_projekt_idx ON alw_strukturverbesserungen.raeumlicheelemnte_wiederherstellung_punkt ( projekt );
CREATE INDEX raemlchlmnt_whrstllng_pnkt_werkeigentum_idx ON alw_strukturverbesserungen.raeumlicheelemnte_wiederherstellung_punkt ( werkeigentum );
-- SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Wege_Bruecke_Lehnenviadukt
CREATE TABLE alw_strukturverbesserungen.raeumlicheelemnte_wege_bruecke_lehnenviadukt (
  T_Id bigint PRIMARY KEY DEFAULT nextval('alw_strukturverbesserungen.t_ili2db_seq')
  ,T_Ili_Tid uuid NULL DEFAULT uuid_generate_v4()
  ,fahrbahnbreite decimal(3,1) NULL
  ,laenge decimal(10,1) NULL
  ,bautyp varchar(255) NOT NULL
  ,tonnage decimal(4,1) NULL
  ,material varchar(255) NOT NULL
  ,widerlager boolean NULL
  ,geometrie geometry(POINT,2056) NOT NULL
  ,astatus varchar(255) NOT NULL
  ,status_datum date NOT NULL
  ,bauabnahme_datum date NULL
  ,werksid varchar(20) NULL
  ,unterhaltsid varchar(20) NULL
  ,projekt bigint NULL
  ,werkeigentum bigint NULL
)
;
CREATE INDEX raemlchlmnt_wrck_lhnnvdukt_geometrie_idx ON alw_strukturverbesserungen.raeumlicheelemnte_wege_bruecke_lehnenviadukt USING GIST ( geometrie );
CREATE INDEX raemlchlmnt_wrck_lhnnvdukt_projekt_idx ON alw_strukturverbesserungen.raeumlicheelemnte_wege_bruecke_lehnenviadukt ( projekt );
CREATE INDEX raemlchlmnt_wrck_lhnnvdukt_werkeigentum_idx ON alw_strukturverbesserungen.raeumlicheelemnte_wege_bruecke_lehnenviadukt ( werkeigentum );
-- SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Seilbahn_Linie
CREATE TABLE alw_strukturverbesserungen.raeumlicheelemnte_seilbahn_linie (
  T_Id bigint PRIMARY KEY DEFAULT nextval('alw_strukturverbesserungen.t_ili2db_seq')
  ,T_Ili_Tid uuid NULL DEFAULT uuid_generate_v4()
  ,typ varchar(255) NOT NULL
  ,bautyp varchar(255) NOT NULL
  ,geometrie geometry(MULTILINESTRING,2056) NOT NULL
  ,astatus varchar(255) NOT NULL
  ,status_datum date NOT NULL
  ,bauabnahme_datum date NULL
  ,werksid varchar(20) NULL
  ,unterhaltsid varchar(20) NULL
  ,projekt bigint NULL
  ,werkeigentum bigint NULL
)
;
CREATE INDEX raeumlicheelmnt_slbhn_lnie_geometrie_idx ON alw_strukturverbesserungen.raeumlicheelemnte_seilbahn_linie USING GIST ( geometrie );
CREATE INDEX raeumlicheelmnt_slbhn_lnie_projekt_idx ON alw_strukturverbesserungen.raeumlicheelemnte_seilbahn_linie ( projekt );
CREATE INDEX raeumlicheelmnt_slbhn_lnie_werkeigentum_idx ON alw_strukturverbesserungen.raeumlicheelemnte_seilbahn_linie ( werkeigentum );
-- SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Seilbahn_Station
CREATE TABLE alw_strukturverbesserungen.raeumlicheelemnte_seilbahn_station (
  T_Id bigint PRIMARY KEY DEFAULT nextval('alw_strukturverbesserungen.t_ili2db_seq')
  ,T_Ili_Tid uuid NULL DEFAULT uuid_generate_v4()
  ,typ varchar(255) NOT NULL
  ,bautyp varchar(255) NOT NULL
  ,geometrie geometry(POINT,2056) NOT NULL
  ,astatus varchar(255) NOT NULL
  ,status_datum date NOT NULL
  ,bauabnahme_datum date NULL
  ,werksid varchar(20) NULL
  ,unterhaltsid varchar(20) NULL
  ,projekt bigint NULL
  ,werkeigentum bigint NULL
)
;
CREATE INDEX raeumlichlmnt_slbhn_sttion_geometrie_idx ON alw_strukturverbesserungen.raeumlicheelemnte_seilbahn_station USING GIST ( geometrie );
CREATE INDEX raeumlichlmnt_slbhn_sttion_projekt_idx ON alw_strukturverbesserungen.raeumlicheelemnte_seilbahn_station ( projekt );
CREATE INDEX raeumlichlmnt_slbhn_sttion_werkeigentum_idx ON alw_strukturverbesserungen.raeumlicheelemnte_seilbahn_station ( werkeigentum );
-- SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Entw_Bodenstruktur_Flaeche
CREATE TABLE alw_strukturverbesserungen.raeumlicheelemnte_entw_bodenstruktur_flaeche (
  T_Id bigint PRIMARY KEY DEFAULT nextval('alw_strukturverbesserungen.t_ili2db_seq')
  ,T_Ili_Tid uuid NULL DEFAULT uuid_generate_v4()
  ,typ varchar(255) NOT NULL
  ,bautyp varchar(255) NOT NULL
  ,geometrie geometry(MULTIPOLYGON,2056) NOT NULL
  ,astatus varchar(255) NOT NULL
  ,status_datum date NOT NULL
  ,bauabnahme_datum date NULL
  ,werksid varchar(20) NULL
  ,unterhaltsid varchar(20) NULL
  ,projekt bigint NULL
  ,werkeigentum bigint NULL
)
;
CREATE INDEX raemlchlmnt_nnstrktr_flche_geometrie_idx ON alw_strukturverbesserungen.raeumlicheelemnte_entw_bodenstruktur_flaeche USING GIST ( geometrie );
CREATE INDEX raemlchlmnt_nnstrktr_flche_projekt_idx ON alw_strukturverbesserungen.raeumlicheelemnte_entw_bodenstruktur_flaeche ( projekt );
CREATE INDEX raemlchlmnt_nnstrktr_flche_werkeigentum_idx ON alw_strukturverbesserungen.raeumlicheelemnte_entw_bodenstruktur_flaeche ( werkeigentum );
-- SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Entw_Bodenstruktur_Linie
CREATE TABLE alw_strukturverbesserungen.raeumlicheelemnte_entw_bodenstruktur_linie (
  T_Id bigint PRIMARY KEY DEFAULT nextval('alw_strukturverbesserungen.t_ili2db_seq')
  ,T_Ili_Tid uuid NULL DEFAULT uuid_generate_v4()
  ,typ varchar(255) NOT NULL
  ,bautyp varchar(255) NOT NULL
  ,geometrie geometry(MULTILINESTRING,2056) NOT NULL
  ,astatus varchar(255) NOT NULL
  ,status_datum date NOT NULL
  ,bauabnahme_datum date NULL
  ,werksid varchar(20) NULL
  ,unterhaltsid varchar(20) NULL
  ,projekt bigint NULL
  ,werkeigentum bigint NULL
)
;
CREATE INDEX raemlchlmnt_ndnstrktr_lnie_geometrie_idx ON alw_strukturverbesserungen.raeumlicheelemnte_entw_bodenstruktur_linie USING GIST ( geometrie );
CREATE INDEX raemlchlmnt_ndnstrktr_lnie_projekt_idx ON alw_strukturverbesserungen.raeumlicheelemnte_entw_bodenstruktur_linie ( projekt );
CREATE INDEX raemlchlmnt_ndnstrktr_lnie_werkeigentum_idx ON alw_strukturverbesserungen.raeumlicheelemnte_entw_bodenstruktur_linie ( werkeigentum );
-- SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Entw_Bodenstruktur_Pumpwerk
CREATE TABLE alw_strukturverbesserungen.raeumlicheelemnte_entw_bodenstruktur_pumpwerk (
  T_Id bigint PRIMARY KEY DEFAULT nextval('alw_strukturverbesserungen.t_ili2db_seq')
  ,T_Ili_Tid uuid NULL DEFAULT uuid_generate_v4()
  ,geometrie geometry(POINT,2056) NOT NULL
  ,bautyp varchar(255) NOT NULL
  ,astatus varchar(255) NOT NULL
  ,status_datum date NOT NULL
  ,bauabnahme_datum date NULL
  ,werksid varchar(20) NULL
  ,unterhaltsid varchar(20) NULL
  ,projekt bigint NULL
  ,werkeigentum bigint NULL
)
;
CREATE INDEX raemlchlmnt_ntrktr_pmpwerk_geometrie_idx ON alw_strukturverbesserungen.raeumlicheelemnte_entw_bodenstruktur_pumpwerk USING GIST ( geometrie );
CREATE INDEX raemlchlmnt_ntrktr_pmpwerk_projekt_idx ON alw_strukturverbesserungen.raeumlicheelemnte_entw_bodenstruktur_pumpwerk ( projekt );
CREATE INDEX raemlchlmnt_ntrktr_pmpwerk_werkeigentum_idx ON alw_strukturverbesserungen.raeumlicheelemnte_entw_bodenstruktur_pumpwerk ( werkeigentum );
-- SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Bew_Flaechen_Bewaesserung
CREATE TABLE alw_strukturverbesserungen.raeumlicheelemnte_bew_flaechen_bewaesserung (
  T_Id bigint PRIMARY KEY DEFAULT nextval('alw_strukturverbesserungen.t_ili2db_seq')
  ,T_Ili_Tid uuid NULL DEFAULT uuid_generate_v4()
  ,typ varchar(255) NOT NULL
  ,bautyp varchar(255) NOT NULL
  ,geometrie geometry(MULTIPOLYGON,2056) NOT NULL
  ,astatus varchar(255) NOT NULL
  ,status_datum date NOT NULL
  ,bauabnahme_datum date NULL
  ,werksid varchar(20) NULL
  ,unterhaltsid varchar(20) NULL
  ,projekt bigint NULL
  ,werkeigentum bigint NULL
)
;
CREATE INDEX raemlchlmnt_blchn_bwssrung_geometrie_idx ON alw_strukturverbesserungen.raeumlicheelemnte_bew_flaechen_bewaesserung USING GIST ( geometrie );
CREATE INDEX raemlchlmnt_blchn_bwssrung_projekt_idx ON alw_strukturverbesserungen.raeumlicheelemnte_bew_flaechen_bewaesserung ( projekt );
CREATE INDEX raemlchlmnt_blchn_bwssrung_werkeigentum_idx ON alw_strukturverbesserungen.raeumlicheelemnte_bew_flaechen_bewaesserung ( werkeigentum );
-- SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Bewaesserung_Linie
CREATE TABLE alw_strukturverbesserungen.raeumlicheelemnte_bewaesserung_linie (
  T_Id bigint PRIMARY KEY DEFAULT nextval('alw_strukturverbesserungen.t_ili2db_seq')
  ,T_Ili_Tid uuid NULL DEFAULT uuid_generate_v4()
  ,typ varchar(255) NOT NULL
  ,bautyp varchar(255) NOT NULL
  ,geometrie geometry(MULTILINESTRING,2056) NOT NULL
  ,astatus varchar(255) NOT NULL
  ,status_datum date NOT NULL
  ,bauabnahme_datum date NULL
  ,werksid varchar(20) NULL
  ,unterhaltsid varchar(20) NULL
  ,projekt bigint NULL
  ,werkeigentum bigint NULL
)
;
CREATE INDEX raeumlichlmnt_bwssrng_lnie_geometrie_idx ON alw_strukturverbesserungen.raeumlicheelemnte_bewaesserung_linie USING GIST ( geometrie );
CREATE INDEX raeumlichlmnt_bwssrng_lnie_projekt_idx ON alw_strukturverbesserungen.raeumlicheelemnte_bewaesserung_linie ( projekt );
CREATE INDEX raeumlichlmnt_bwssrng_lnie_werkeigentum_idx ON alw_strukturverbesserungen.raeumlicheelemnte_bewaesserung_linie ( werkeigentum );
-- SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Bewaesserung_Punkt
CREATE TABLE alw_strukturverbesserungen.raeumlicheelemnte_bewaesserung_punkt (
  T_Id bigint PRIMARY KEY DEFAULT nextval('alw_strukturverbesserungen.t_ili2db_seq')
  ,T_Ili_Tid uuid NULL DEFAULT uuid_generate_v4()
  ,typ varchar(255) NOT NULL
  ,bautyp varchar(255) NOT NULL
  ,geometrie geometry(POINT,2056) NOT NULL
  ,astatus varchar(255) NOT NULL
  ,status_datum date NOT NULL
  ,bauabnahme_datum date NULL
  ,werksid varchar(20) NULL
  ,unterhaltsid varchar(20) NULL
  ,projekt bigint NULL
  ,werkeigentum bigint NULL
)
;
CREATE INDEX raeumlichlmnt_bwssrng_pnkt_geometrie_idx ON alw_strukturverbesserungen.raeumlicheelemnte_bewaesserung_punkt USING GIST ( geometrie );
CREATE INDEX raeumlichlmnt_bwssrng_pnkt_projekt_idx ON alw_strukturverbesserungen.raeumlicheelemnte_bewaesserung_punkt ( projekt );
CREATE INDEX raeumlichlmnt_bwssrng_pnkt_werkeigentum_idx ON alw_strukturverbesserungen.raeumlicheelemnte_bewaesserung_punkt ( werkeigentum );
-- SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Wasserversorgung_Punkt
CREATE TABLE alw_strukturverbesserungen.raeumlicheelemnte_wasserversorgung_punkt (
  T_Id bigint PRIMARY KEY DEFAULT nextval('alw_strukturverbesserungen.t_ili2db_seq')
  ,T_Ili_Tid uuid NULL DEFAULT uuid_generate_v4()
  ,typ varchar(255) NOT NULL
  ,bautyp varchar(255) NOT NULL
  ,geometrie geometry(POINT,2056) NOT NULL
  ,astatus varchar(255) NOT NULL
  ,status_datum date NOT NULL
  ,bauabnahme_datum date NULL
  ,werksid varchar(20) NULL
  ,unterhaltsid varchar(20) NULL
  ,projekt bigint NULL
  ,werkeigentum bigint NULL
)
;
CREATE INDEX raemlchlmnt_wrvrsrgng_pnkt_geometrie_idx ON alw_strukturverbesserungen.raeumlicheelemnte_wasserversorgung_punkt USING GIST ( geometrie );
CREATE INDEX raemlchlmnt_wrvrsrgng_pnkt_projekt_idx ON alw_strukturverbesserungen.raeumlicheelemnte_wasserversorgung_punkt ( projekt );
CREATE INDEX raemlchlmnt_wrvrsrgng_pnkt_werkeigentum_idx ON alw_strukturverbesserungen.raeumlicheelemnte_wasserversorgung_punkt ( werkeigentum );
-- SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.WV_Leitung_Wasserversorgung
CREATE TABLE alw_strukturverbesserungen.raeumlicheelemnte_wv_leitung_wasserversorgung (
  T_Id bigint PRIMARY KEY DEFAULT nextval('alw_strukturverbesserungen.t_ili2db_seq')
  ,T_Ili_Tid uuid NULL DEFAULT uuid_generate_v4()
  ,geometrie geometry(MULTILINESTRING,2056) NOT NULL
  ,bautyp varchar(255) NOT NULL
  ,astatus varchar(255) NOT NULL
  ,status_datum date NOT NULL
  ,bauabnahme_datum date NULL
  ,werksid varchar(20) NULL
  ,unterhaltsid varchar(20) NULL
  ,projekt bigint NULL
  ,werkeigentum bigint NULL
)
;
CREATE INDEX raemlchlmnt_w_wssrvrsrgung_geometrie_idx ON alw_strukturverbesserungen.raeumlicheelemnte_wv_leitung_wasserversorgung USING GIST ( geometrie );
CREATE INDEX raemlchlmnt_w_wssrvrsrgung_projekt_idx ON alw_strukturverbesserungen.raeumlicheelemnte_wv_leitung_wasserversorgung ( projekt );
CREATE INDEX raemlchlmnt_w_wssrvrsrgung_werkeigentum_idx ON alw_strukturverbesserungen.raeumlicheelemnte_wv_leitung_wasserversorgung ( werkeigentum );
-- SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.EV_Punkt
CREATE TABLE alw_strukturverbesserungen.raeumlicheelemnte_ev_punkt (
  T_Id bigint PRIMARY KEY DEFAULT nextval('alw_strukturverbesserungen.t_ili2db_seq')
  ,T_Ili_Tid uuid NULL DEFAULT uuid_generate_v4()
  ,typ varchar(255) NOT NULL
  ,bautyp varchar(255) NOT NULL
  ,geometrie geometry(POINT,2056) NOT NULL
  ,astatus varchar(255) NOT NULL
  ,status_datum date NOT NULL
  ,bauabnahme_datum date NULL
  ,werksid varchar(20) NULL
  ,unterhaltsid varchar(20) NULL
  ,projekt bigint NULL
  ,werkeigentum bigint NULL
)
;
CREATE INDEX raeumlicheelemnte_ev_punkt_geometrie_idx ON alw_strukturverbesserungen.raeumlicheelemnte_ev_punkt USING GIST ( geometrie );
CREATE INDEX raeumlicheelemnte_ev_punkt_projekt_idx ON alw_strukturverbesserungen.raeumlicheelemnte_ev_punkt ( projekt );
CREATE INDEX raeumlicheelemnte_ev_punkt_werkeigentum_idx ON alw_strukturverbesserungen.raeumlicheelemnte_ev_punkt ( werkeigentum );
-- SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.EV_Linie
CREATE TABLE alw_strukturverbesserungen.raeumlicheelemnte_ev_linie (
  T_Id bigint PRIMARY KEY DEFAULT nextval('alw_strukturverbesserungen.t_ili2db_seq')
  ,T_Ili_Tid uuid NULL DEFAULT uuid_generate_v4()
  ,typ varchar(255) NOT NULL
  ,bautyp varchar(255) NOT NULL
  ,geometrie geometry(MULTILINESTRING,2056) NOT NULL
  ,astatus varchar(255) NOT NULL
  ,status_datum date NOT NULL
  ,bauabnahme_datum date NULL
  ,werksid varchar(20) NULL
  ,unterhaltsid varchar(20) NULL
  ,projekt bigint NULL
  ,werkeigentum bigint NULL
)
;
CREATE INDEX raeumlicheelemnte_ev_linie_geometrie_idx ON alw_strukturverbesserungen.raeumlicheelemnte_ev_linie USING GIST ( geometrie );
CREATE INDEX raeumlicheelemnte_ev_linie_projekt_idx ON alw_strukturverbesserungen.raeumlicheelemnte_ev_linie ( projekt );
CREATE INDEX raeumlicheelemnte_ev_linie_werkeigentum_idx ON alw_strukturverbesserungen.raeumlicheelemnte_ev_linie ( werkeigentum );
-- SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Milchleitung_Leitung
CREATE TABLE alw_strukturverbesserungen.raeumlicheelemnte_milchleitung_leitung (
  T_Id bigint PRIMARY KEY DEFAULT nextval('alw_strukturverbesserungen.t_ili2db_seq')
  ,T_Ili_Tid uuid NULL DEFAULT uuid_generate_v4()
  ,bautyp varchar(255) NOT NULL
  ,geometrie geometry(MULTILINESTRING,2056) NOT NULL
  ,astatus varchar(255) NOT NULL
  ,status_datum date NOT NULL
  ,bauabnahme_datum date NULL
  ,werksid varchar(20) NULL
  ,unterhaltsid varchar(20) NULL
  ,projekt bigint NULL
  ,werkeigentum bigint NULL
)
;
CREATE INDEX raemlchlmnt_mlchltng_ltung_geometrie_idx ON alw_strukturverbesserungen.raeumlicheelemnte_milchleitung_leitung USING GIST ( geometrie );
CREATE INDEX raemlchlmnt_mlchltng_ltung_projekt_idx ON alw_strukturverbesserungen.raeumlicheelemnte_milchleitung_leitung ( projekt );
CREATE INDEX raemlchlmnt_mlchltng_ltung_werkeigentum_idx ON alw_strukturverbesserungen.raeumlicheelemnte_milchleitung_leitung ( werkeigentum );
-- SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Milchleitung_Lokal
CREATE TABLE alw_strukturverbesserungen.raeumlicheelemnte_milchleitung_lokal (
  T_Id bigint PRIMARY KEY DEFAULT nextval('alw_strukturverbesserungen.t_ili2db_seq')
  ,T_Ili_Tid uuid NULL DEFAULT uuid_generate_v4()
  ,bautyp varchar(255) NOT NULL
  ,geometrie geometry(POINT,2056) NOT NULL
  ,astatus varchar(255) NOT NULL
  ,status_datum date NOT NULL
  ,bauabnahme_datum date NULL
  ,werksid varchar(20) NULL
  ,unterhaltsid varchar(20) NULL
  ,projekt bigint NULL
  ,werkeigentum bigint NULL
)
;
CREATE INDEX raeumlchlmnt_mlchltng_lkal_geometrie_idx ON alw_strukturverbesserungen.raeumlicheelemnte_milchleitung_lokal USING GIST ( geometrie );
CREATE INDEX raeumlchlmnt_mlchltng_lkal_projekt_idx ON alw_strukturverbesserungen.raeumlicheelemnte_milchleitung_lokal ( projekt );
CREATE INDEX raeumlchlmnt_mlchltng_lkal_werkeigentum_idx ON alw_strukturverbesserungen.raeumlicheelemnte_milchleitung_lokal ( werkeigentum );
-- SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Oekologie_Linie
CREATE TABLE alw_strukturverbesserungen.raeumlicheelemnte_oekologie_linie (
  T_Id bigint PRIMARY KEY DEFAULT nextval('alw_strukturverbesserungen.t_ili2db_seq')
  ,T_Ili_Tid uuid NULL DEFAULT uuid_generate_v4()
  ,bautyp varchar(255) NOT NULL
  ,typ varchar(255) NOT NULL
  ,geometrie geometry(MULTILINESTRING,2056) NOT NULL
  ,astatus varchar(255) NOT NULL
  ,status_datum date NOT NULL
  ,bauabnahme_datum date NULL
  ,werksid varchar(20) NULL
  ,unterhaltsid varchar(20) NULL
  ,projekt bigint NULL
  ,werkeigentum bigint NULL
)
;
CREATE INDEX raeumlicheelemnte_klg_lnie_geometrie_idx ON alw_strukturverbesserungen.raeumlicheelemnte_oekologie_linie USING GIST ( geometrie );
CREATE INDEX raeumlicheelemnte_klg_lnie_projekt_idx ON alw_strukturverbesserungen.raeumlicheelemnte_oekologie_linie ( projekt );
CREATE INDEX raeumlicheelemnte_klg_lnie_werkeigentum_idx ON alw_strukturverbesserungen.raeumlicheelemnte_oekologie_linie ( werkeigentum );
-- SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Oekologie_Trockenmauer
CREATE TABLE alw_strukturverbesserungen.raeumlicheelemnte_oekologie_trockenmauer (
  T_Id bigint PRIMARY KEY DEFAULT nextval('alw_strukturverbesserungen.t_ili2db_seq')
  ,T_Ili_Tid uuid NULL DEFAULT uuid_generate_v4()
  ,typ varchar(255) NOT NULL
  ,hoehe decimal(3,1) NULL
  ,bautyp varchar(255) NOT NULL
  ,geometrie geometry(MULTILINESTRING,2056) NOT NULL
  ,astatus varchar(255) NOT NULL
  ,status_datum date NOT NULL
  ,bauabnahme_datum date NULL
  ,werksid varchar(20) NULL
  ,unterhaltsid varchar(20) NULL
  ,projekt bigint NULL
  ,werkeigentum bigint NULL
)
;
CREATE INDEX raeumlchlmnt_klg_trcknmuer_geometrie_idx ON alw_strukturverbesserungen.raeumlicheelemnte_oekologie_trockenmauer USING GIST ( geometrie );
CREATE INDEX raeumlchlmnt_klg_trcknmuer_projekt_idx ON alw_strukturverbesserungen.raeumlicheelemnte_oekologie_trockenmauer ( projekt );
CREATE INDEX raeumlchlmnt_klg_trcknmuer_werkeigentum_idx ON alw_strukturverbesserungen.raeumlicheelemnte_oekologie_trockenmauer ( werkeigentum );
-- SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Oekologie_Flaeche
CREATE TABLE alw_strukturverbesserungen.raeumlicheelemnte_oekologie_flaeche (
  T_Id bigint PRIMARY KEY DEFAULT nextval('alw_strukturverbesserungen.t_ili2db_seq')
  ,T_Ili_Tid uuid NULL DEFAULT uuid_generate_v4()
  ,typ varchar(255) NOT NULL
  ,bautyp varchar(255) NOT NULL
  ,geometrie geometry(MULTIPOLYGON,2056) NOT NULL
  ,astatus varchar(255) NOT NULL
  ,status_datum date NOT NULL
  ,bauabnahme_datum date NULL
  ,werksid varchar(20) NULL
  ,unterhaltsid varchar(20) NULL
  ,projekt bigint NULL
  ,werkeigentum bigint NULL
)
;
CREATE INDEX raeumlicheelemnt_klg_flche_geometrie_idx ON alw_strukturverbesserungen.raeumlicheelemnte_oekologie_flaeche USING GIST ( geometrie );
CREATE INDEX raeumlicheelemnt_klg_flche_projekt_idx ON alw_strukturverbesserungen.raeumlicheelemnte_oekologie_flaeche ( projekt );
CREATE INDEX raeumlicheelemnt_klg_flche_werkeigentum_idx ON alw_strukturverbesserungen.raeumlicheelemnte_oekologie_flaeche ( werkeigentum );
-- SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Hochbau
CREATE TABLE alw_strukturverbesserungen.raeumlicheelemnte_hochbau (
  T_Id bigint PRIMARY KEY DEFAULT nextval('alw_strukturverbesserungen.t_ili2db_seq')
  ,T_Ili_Tid uuid NULL DEFAULT uuid_generate_v4()
  ,typ varchar(255) NOT NULL
  ,geometrie geometry(POINT,2056) NOT NULL
  ,astatus varchar(255) NOT NULL
  ,status_datum date NOT NULL
  ,bauabnahme_datum date NULL
  ,werksid varchar(20) NULL
  ,unterhaltsid varchar(20) NULL
  ,projekt bigint NULL
  ,werkeigentum bigint NULL
)
;
CREATE INDEX raeumlicheelemnte_hochbau_geometrie_idx ON alw_strukturverbesserungen.raeumlicheelemnte_hochbau USING GIST ( geometrie );
CREATE INDEX raeumlicheelemnte_hochbau_projekt_idx ON alw_strukturverbesserungen.raeumlicheelemnte_hochbau ( projekt );
CREATE INDEX raeumlicheelemnte_hochbau_werkeigentum_idx ON alw_strukturverbesserungen.raeumlicheelemnte_hochbau ( werkeigentum );
-- SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Beizugsgebiet
CREATE TABLE alw_strukturverbesserungen.raeumlicheelemnte_beizugsgebiet (
  T_Id bigint PRIMARY KEY DEFAULT nextval('alw_strukturverbesserungen.t_ili2db_seq')
  ,T_Ili_Tid uuid NULL DEFAULT uuid_generate_v4()
  ,geometrie geometry(MULTIPOLYGON,2056) NOT NULL
  ,datum_nachfuehrung date NULL
  ,typ varchar(255) NOT NULL
)
;
CREATE INDEX raeumlicheelemnt_bzgsgbiet_geometrie_idx ON alw_strukturverbesserungen.raeumlicheelemnte_beizugsgebiet USING GIST ( geometrie );
-- SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Projekt
CREATE TABLE alw_strukturverbesserungen.raeumlicheelemnte_projekt (
  T_Id bigint PRIMARY KEY DEFAULT nextval('alw_strukturverbesserungen.t_ili2db_seq')
  ,T_Ili_Tid uuid NULL DEFAULT uuid_generate_v4()
  ,geometrie geometry(POINT,2056) NOT NULL
  ,projekttypen varchar(255) NOT NULL
  ,geschaeftsnummer varchar(10) NULL
  ,kantonsnummer varchar(40) NULL
  ,aname varchar(50) NULL
)
;
CREATE INDEX raeumlicheelemnte_projekt_geometrie_idx ON alw_strukturverbesserungen.raeumlicheelemnte_projekt USING GIST ( geometrie );
COMMENT ON TABLE alw_strukturverbesserungen.raeumlicheelemnte_projekt IS 'Kantonale Projekte werden erfasst. In seltenen Fällen können zwei kantonale Projekte die gleiche Geschäftsnummer haben.';
-- SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Genossenschaft_Dokument
CREATE TABLE alw_strukturverbesserungen.raeumlicheelemnte_genossenschaft_dokument (
  T_Id bigint PRIMARY KEY DEFAULT nextval('alw_strukturverbesserungen.t_ili2db_seq')
  ,dokument bigint NOT NULL
  ,genossenschaft bigint NOT NULL
)
;
CREATE INDEX raemlchlmnt_gnschft_dkment_dokument_idx ON alw_strukturverbesserungen.raeumlicheelemnte_genossenschaft_dokument ( dokument );
CREATE INDEX raemlchlmnt_gnschft_dkment_genossenschaft_idx ON alw_strukturverbesserungen.raeumlicheelemnte_genossenschaft_dokument ( genossenschaft );
-- SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Genossenschaft_Element
CREATE TABLE alw_strukturverbesserungen.raeumlicheelemnte_genossenschaft_element (
  T_Id bigint PRIMARY KEY DEFAULT nextval('alw_strukturverbesserungen.t_ili2db_seq')
  ,genossenschaft_element bigint NOT NULL
  ,element_genossenschaft_raeumlicheelemnte_ev_linie bigint NULL
  ,element_genossenschaft_raeumlicheelemnte_bewssrng_lnie bigint NULL
  ,element_genossenschaft_raeumlicheelemnte_mlchltng_lkal bigint NULL
  ,element_genossenschaft_raeumlicheelemnte_klg_trcknmuer bigint NULL
  ,element_genossenschaft_raemlchlmnt_wv_tng_wssrvrsrgung bigint NULL
  ,element_genossenschaft_raeumlicheelemnte_oekologi_lnie bigint NULL
  ,element_genossenschaft_raeumlicheelemnte_bewssrng_pnkt bigint NULL
  ,element_genossenschaft_raeumlicheelemnte_ev_punkt bigint NULL
  ,element_genossenschaft_raeumlicheelemnte_seilbahn_lnie bigint NULL
  ,element_genossenschaft_raeumlichlmnt_wg_brck_lhnnvdukt bigint NULL
  ,element_genossenschaft_raeumlicheelemnte_oekologi_pnkt bigint NULL
  ,element_genossenschaft_raeumlichlmnt_bw_flchn_bwssrung bigint NULL
  ,element_genossenschaft_raeumlichelmnt_wdrhrstllng_pnkt bigint NULL
  ,element_genossenschaft_raemlchlmnt_ntwdnstrktr_pmpwerk bigint NULL
  ,element_genossenschaft_raeumlichelmnt_wssrvrsrgng_pnkt bigint NULL
  ,element_genossenschaft_raeumlicheelemnt_mlchltng_ltung bigint NULL
  ,element_genossenschaft_raeumlchlmnt_ntw_bdnstrktr_lnie bigint NULL
  ,element_genossenschaft_raeumlicheelemnte_hochbau bigint NULL
  ,element_genossenschaft_raeumlicheelemnte_oekolog_flche bigint NULL
  ,element_genossenschaft_raeumlicheelemnte_selbhn_sttion bigint NULL
  ,element_genossenschaft_raemlchlmnt_ntw_bdnstrktr_flche bigint NULL
  ,element_genossenschaft_raeumlicheelemnte_wegebau_linie bigint NULL
)
;
CREATE INDEX raemlchlmnt_gsnschft_lment_genossenschaft_element_idx ON alw_strukturverbesserungen.raeumlicheelemnte_genossenschaft_element ( genossenschaft_element );
CREATE INDEX raemlchlmnt_gsnschft_lment_elemnt_gnssnschlmnt_v_lnie_idx ON alw_strukturverbesserungen.raeumlicheelemnte_genossenschaft_element ( element_genossenschaft_raeumlicheelemnte_ev_linie );
CREATE INDEX raemlchlmnt_gsnschft_lment_elemnt_gnssns_bwssrng_lnie_idx ON alw_strukturverbesserungen.raeumlicheelemnte_genossenschaft_element ( element_genossenschaft_raeumlicheelemnte_bewssrng_lnie );
CREATE INDEX raemlchlmnt_gsnschft_lment_elemnt_gnssnsmlchltng_lkal_idx ON alw_strukturverbesserungen.raeumlicheelemnte_genossenschaft_element ( element_genossenschaft_raeumlicheelemnte_mlchltng_lkal );
CREATE INDEX raemlchlmnt_gsnschft_lment_elemnt_gnssnsklg_trcknmuer_idx ON alw_strukturverbesserungen.raeumlicheelemnte_genossenschaft_element ( element_genossenschaft_raeumlicheelemnte_klg_trcknmuer );
CREATE INDEX raemlchlmnt_gsnschft_lment_elemnt_gnssns_wssrvrsrgung_idx ON alw_strukturverbesserungen.raeumlicheelemnte_genossenschaft_element ( element_genossenschaft_raemlchlmnt_wv_tng_wssrvrsrgung );
CREATE INDEX raemlchlmnt_gsnschft_lment_elemnt_gnssnslmnt_klg_lnie_idx ON alw_strukturverbesserungen.raeumlicheelemnte_genossenschaft_element ( element_genossenschaft_raeumlicheelemnte_oekologi_lnie );
CREATE INDEX raemlchlmnt_gsnschft_lment_elemnt_gnssns_bwssrng_pnkt_idx ON alw_strukturverbesserungen.raeumlicheelemnte_genossenschaft_element ( element_genossenschaft_raeumlicheelemnte_bewssrng_pnkt );
CREATE INDEX raemlchlmnt_gsnschft_lment_elemnt_gnssnschlmnt_v_pnkt_idx ON alw_strukturverbesserungen.raeumlicheelemnte_genossenschaft_element ( element_genossenschaft_raeumlicheelemnte_ev_punkt );
CREATE INDEX raemlchlmnt_gsnschft_lment_elemnt_gnssnsnt_slbhn_lnie_idx ON alw_strukturverbesserungen.raeumlicheelemnte_genossenschaft_element ( element_genossenschaft_raeumlicheelemnte_seilbahn_lnie );
CREATE INDEX raemlchlmnt_gsnschft_lment_elemnt_gnssnsrck_lhnnvdukt_idx ON alw_strukturverbesserungen.raeumlicheelemnte_genossenschaft_element ( element_genossenschaft_raeumlichlmnt_wg_brck_lhnnvdukt );
CREATE INDEX raemlchlmnt_gsnschft_lment_elemnt_gnssnslmnt_klg_pnkt_idx ON alw_strukturverbesserungen.raeumlicheelemnte_genossenschaft_element ( element_genossenschaft_raeumlicheelemnte_oekologi_pnkt );
CREATE INDEX raemlchlmnt_gsnschft_lment_elemnt_gnssnslchn_bwssrung_idx ON alw_strukturverbesserungen.raeumlicheelemnte_genossenschaft_element ( element_genossenschaft_raeumlichlmnt_bw_flchn_bwssrung );
CREATE INDEX raemlchlmnt_gsnschft_lment_elemnt_gnssnshrstllng_pnkt_idx ON alw_strukturverbesserungen.raeumlicheelemnte_genossenschaft_element ( element_genossenschaft_raeumlichelmnt_wdrhrstllng_pnkt );
CREATE INDEX raemlchlmnt_gsnschft_lment_elemnt_gnssnstrktr_pmpwerk_idx ON alw_strukturverbesserungen.raeumlicheelemnte_genossenschaft_element ( element_genossenschaft_raemlchlmnt_ntwdnstrktr_pmpwerk );
CREATE INDEX raemlchlmnt_gsnschft_lment_elemnt_gnssnsrvrsrgng_pnkt_idx ON alw_strukturverbesserungen.raeumlicheelemnte_genossenschaft_element ( element_genossenschaft_raeumlichelmnt_wssrvrsrgng_pnkt );
CREATE INDEX raemlchlmnt_gsnschft_lment_elemnt_gnssnslchltng_ltung_idx ON alw_strukturverbesserungen.raeumlicheelemnte_genossenschaft_element ( element_genossenschaft_raeumlicheelemnt_mlchltng_ltung );
CREATE INDEX raemlchlmnt_gsnschft_lment_elemnt_gnssnsdnstrktr_lnie_idx ON alw_strukturverbesserungen.raeumlicheelemnte_genossenschaft_element ( element_genossenschaft_raeumlchlmnt_ntw_bdnstrktr_lnie );
CREATE INDEX raemlchlmnt_gsnschft_lment_elemnt_gnssnschlmnt_hchbau_idx ON alw_strukturverbesserungen.raeumlicheelemnte_genossenschaft_element ( element_genossenschaft_raeumlicheelemnte_hochbau );
CREATE INDEX raemlchlmnt_gsnschft_lment_elemnt_gnssnsmnt_klg_flche_idx ON alw_strukturverbesserungen.raeumlicheelemnte_genossenschaft_element ( element_genossenschaft_raeumlicheelemnte_oekolog_flche );
CREATE INDEX raemlchlmnt_gsnschft_lment_elemnt_gnssns_slbhn_sttion_idx ON alw_strukturverbesserungen.raeumlicheelemnte_genossenschaft_element ( element_genossenschaft_raeumlicheelemnte_selbhn_sttion );
CREATE INDEX raemlchlmnt_gsnschft_lment_elemnt_gnssnsnstrktr_flche_idx ON alw_strukturverbesserungen.raeumlicheelemnte_genossenschaft_element ( element_genossenschaft_raemlchlmnt_ntw_bdnstrktr_flche );
CREATE INDEX raemlchlmnt_gsnschft_lment_elemnt_gnssnslmnt_wgb_lnie_idx ON alw_strukturverbesserungen.raeumlicheelemnte_genossenschaft_element ( element_genossenschaft_raeumlicheelemnte_wegebau_linie );
-- SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Beizugsgebiet_Projekt
CREATE TABLE alw_strukturverbesserungen.raeumlicheelemnte_beizugsgebiet_projekt (
  T_Id bigint PRIMARY KEY DEFAULT nextval('alw_strukturverbesserungen.t_ili2db_seq')
  ,beizugsgebiet bigint NOT NULL
  ,projekt bigint NOT NULL
)
;
CREATE INDEX raemlchlmnt_bzgsgbt_prjekt_beizugsgebiet_idx ON alw_strukturverbesserungen.raeumlicheelemnte_beizugsgebiet_projekt ( beizugsgebiet );
CREATE INDEX raemlchlmnt_bzgsgbt_prjekt_projekt_idx ON alw_strukturverbesserungen.raeumlicheelemnte_beizugsgebiet_projekt ( projekt );
CREATE TABLE alw_strukturverbesserungen.T_ILI2DB_BASKET (
  T_Id bigint PRIMARY KEY
  ,dataset bigint NULL
  ,topic varchar(200) NOT NULL
  ,T_Ili_Tid varchar(200) NULL
  ,attachmentKey varchar(200) NOT NULL
  ,domains varchar(1024) NULL
)
;
CREATE INDEX T_ILI2DB_BASKET_dataset_idx ON alw_strukturverbesserungen.t_ili2db_basket ( dataset );
CREATE TABLE alw_strukturverbesserungen.T_ILI2DB_DATASET (
  T_Id bigint PRIMARY KEY
  ,datasetName varchar(200) NULL
)
;
CREATE TABLE alw_strukturverbesserungen.T_ILI2DB_INHERITANCE (
  thisClass varchar(1024) PRIMARY KEY
  ,baseClass varchar(1024) NULL
)
;
CREATE TABLE alw_strukturverbesserungen.T_ILI2DB_SETTINGS (
  tag varchar(60) PRIMARY KEY
  ,setting varchar(1024) NULL
)
;
CREATE TABLE alw_strukturverbesserungen.T_ILI2DB_TRAFO (
  iliname varchar(1024) NOT NULL
  ,tag varchar(1024) NOT NULL
  ,setting varchar(1024) NOT NULL
)
;
CREATE TABLE alw_strukturverbesserungen.T_ILI2DB_MODEL (
  filename varchar(250) NOT NULL
  ,iliversion varchar(3) NOT NULL
  ,modelName text NOT NULL
  ,content text NOT NULL
  ,importDate timestamp NOT NULL
  ,PRIMARY KEY (iliversion,modelName)
)
;
CREATE TABLE alw_strukturverbesserungen.seilbahnen_linien (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE alw_strukturverbesserungen.genossenschaften (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE alw_strukturverbesserungen.raeumlichelmnte_wege_bruecke_lehnenviadukt_material (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE alw_strukturverbesserungen.wiederherstellung_punkte (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE alw_strukturverbesserungen.wasserversorgung_punkte (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE alw_strukturverbesserungen.bewaesserung_punkte (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE alw_strukturverbesserungen.hochbau_punkte (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE alw_strukturverbesserungen.entw_bodenstruktur_linien (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE alw_strukturverbesserungen.wege (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE alw_strukturverbesserungen.entw_bodenstruktur_flaechen (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE alw_strukturverbesserungen.technische_schwierigkeit (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE alw_strukturverbesserungen.oekologie_linien (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE alw_strukturverbesserungen.funktionstyp (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE alw_strukturverbesserungen.elektrizitaet_punkte (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE alw_strukturverbesserungen.oekologie_punkte (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE alw_strukturverbesserungen.bewaesserung_flaechen (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE alw_strukturverbesserungen.elektrizitaet_linien (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE alw_strukturverbesserungen.bautyp (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE alw_strukturverbesserungen.seilbahnen_punkte (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE alw_strukturverbesserungen.astatus (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE alw_strukturverbesserungen.bewaesserung_linien (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE alw_strukturverbesserungen.oekologische_flaechen (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE alw_strukturverbesserungen.dokumententyp (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE alw_strukturverbesserungen.projekt (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE alw_strukturverbesserungen.oekologie_trockenmauern (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE alw_strukturverbesserungen.beizugsgebiete (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE alw_strukturverbesserungen.stand (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE alw_strukturverbesserungen.T_ILI2DB_CLASSNAME (
  IliName varchar(1024) PRIMARY KEY
  ,SqlName varchar(1024) NOT NULL
)
;
CREATE TABLE alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (
  IliName varchar(1024) NOT NULL
  ,SqlName varchar(1024) NOT NULL
  ,ColOwner varchar(1024) NOT NULL
  ,Target varchar(1024) NULL
  ,PRIMARY KEY (SqlName,ColOwner)
)
;
CREATE TABLE alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (
  tablename varchar(255) NOT NULL
  ,subtype varchar(255) NULL
  ,columnname varchar(255) NOT NULL
  ,tag varchar(1024) NOT NULL
  ,setting varchar(1024) NOT NULL
)
;
CREATE TABLE alw_strukturverbesserungen.T_ILI2DB_TABLE_PROP (
  tablename varchar(255) NOT NULL
  ,tag varchar(1024) NOT NULL
  ,setting varchar(1024) NOT NULL
)
;
CREATE TABLE alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (
  ilielement varchar(255) NOT NULL
  ,attr_name varchar(1024) NOT NULL
  ,attr_value varchar(1024) NOT NULL
)
;
ALTER TABLE alw_strukturverbesserungen.linestructure ADD CONSTRAINT linestructure_multiline_lines_fkey FOREIGN KEY ( multiline_lines ) REFERENCES alw_strukturverbesserungen.multiline DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE alw_strukturverbesserungen.surfacestructure ADD CONSTRAINT surfacestructure_multisurface_surfaces_fkey FOREIGN KEY ( multisurface_surfaces ) REFERENCES alw_strukturverbesserungen.multisurface DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE alw_strukturverbesserungen.stand_gutrrglrung_stand_gueterregulierung ADD CONSTRAINT stand_gtrrglnd_gtrrglrung_bfsnr_check CHECK( bfsnr BETWEEN 1 AND 9999);
ALTER TABLE alw_strukturverbesserungen.raeumlicheelemnte_dokument ADD CONSTRAINT raeumlicheelemnte_dokument_wiederherstellungs_punkt_fkey FOREIGN KEY ( wiederherstellungs_punkt ) REFERENCES alw_strukturverbesserungen.raeumlicheelemnte_wiederherstellung_punkt DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE alw_strukturverbesserungen.raeumlicheelemnte_oekologie_punkt ADD CONSTRAINT raeumlicheelemnte_klg_pnkt_projekt_fkey FOREIGN KEY ( projekt ) REFERENCES alw_strukturverbesserungen.raeumlicheelemnte_projekt DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE alw_strukturverbesserungen.raeumlicheelemnte_oekologie_punkt ADD CONSTRAINT raeumlicheelemnte_klg_pnkt_werkeigentum_fkey FOREIGN KEY ( werkeigentum ) REFERENCES alw_strukturverbesserungen.raeumlicheelemnte_werkseigentum DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE alw_strukturverbesserungen.raeumlicheelemnte_wegebau_linie ADD CONSTRAINT raeumlicheelemnt_wgb_lnie_fahrbahnbreite_check CHECK( fahrbahnbreite BETWEEN 0.0 AND 10.0);
ALTER TABLE alw_strukturverbesserungen.raeumlicheelemnte_wegebau_linie ADD CONSTRAINT raeumlicheelemnt_wgb_lnie_anteil_lw_check CHECK( anteil_lw BETWEEN 0 AND 100);
ALTER TABLE alw_strukturverbesserungen.raeumlicheelemnte_wegebau_linie ADD CONSTRAINT raeumlicheelemnt_wgb_lnie_laenge_gerundet_check CHECK( laenge_gerundet BETWEEN 0 AND 1000000);
ALTER TABLE alw_strukturverbesserungen.raeumlicheelemnte_wegebau_linie ADD CONSTRAINT raeumlicheelemnte_wgb_lnie_projekt_fkey FOREIGN KEY ( projekt ) REFERENCES alw_strukturverbesserungen.raeumlicheelemnte_projekt DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE alw_strukturverbesserungen.raeumlicheelemnte_wegebau_linie ADD CONSTRAINT raeumlicheelemnte_wgb_lnie_werkeigentum_fkey FOREIGN KEY ( werkeigentum ) REFERENCES alw_strukturverbesserungen.raeumlicheelemnte_werkseigentum DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE alw_strukturverbesserungen.raeumlicheelemnte_wiederherstellung_punkt ADD CONSTRAINT raemlchlmnt_whrstllng_pnkt_projekt_fkey FOREIGN KEY ( projekt ) REFERENCES alw_strukturverbesserungen.raeumlicheelemnte_projekt DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE alw_strukturverbesserungen.raeumlicheelemnte_wiederherstellung_punkt ADD CONSTRAINT raemlchlmnt_whrstllng_pnkt_werkeigentum_fkey FOREIGN KEY ( werkeigentum ) REFERENCES alw_strukturverbesserungen.raeumlicheelemnte_werkseigentum DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE alw_strukturverbesserungen.raeumlicheelemnte_wege_bruecke_lehnenviadukt ADD CONSTRAINT raemlchlmnt_rck_lhnnvdukt_fahrbahnbreite_check CHECK( fahrbahnbreite BETWEEN 0.0 AND 10.0);
ALTER TABLE alw_strukturverbesserungen.raeumlicheelemnte_wege_bruecke_lehnenviadukt ADD CONSTRAINT raemlchlmnt_rck_lhnnvdukt_laenge_check CHECK( laenge BETWEEN 0.0 AND 1.0E8);
ALTER TABLE alw_strukturverbesserungen.raeumlicheelemnte_wege_bruecke_lehnenviadukt ADD CONSTRAINT raemlchlmnt_rck_lhnnvdukt_tonnage_check CHECK( tonnage BETWEEN 0.0 AND 100.0);
ALTER TABLE alw_strukturverbesserungen.raeumlicheelemnte_wege_bruecke_lehnenviadukt ADD CONSTRAINT raemlchlmnt_wrck_lhnnvdukt_projekt_fkey FOREIGN KEY ( projekt ) REFERENCES alw_strukturverbesserungen.raeumlicheelemnte_projekt DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE alw_strukturverbesserungen.raeumlicheelemnte_wege_bruecke_lehnenviadukt ADD CONSTRAINT raemlchlmnt_wrck_lhnnvdukt_werkeigentum_fkey FOREIGN KEY ( werkeigentum ) REFERENCES alw_strukturverbesserungen.raeumlicheelemnte_werkseigentum DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE alw_strukturverbesserungen.raeumlicheelemnte_seilbahn_linie ADD CONSTRAINT raeumlicheelmnt_slbhn_lnie_projekt_fkey FOREIGN KEY ( projekt ) REFERENCES alw_strukturverbesserungen.raeumlicheelemnte_projekt DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE alw_strukturverbesserungen.raeumlicheelemnte_seilbahn_linie ADD CONSTRAINT raeumlicheelmnt_slbhn_lnie_werkeigentum_fkey FOREIGN KEY ( werkeigentum ) REFERENCES alw_strukturverbesserungen.raeumlicheelemnte_werkseigentum DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE alw_strukturverbesserungen.raeumlicheelemnte_seilbahn_station ADD CONSTRAINT raeumlichlmnt_slbhn_sttion_projekt_fkey FOREIGN KEY ( projekt ) REFERENCES alw_strukturverbesserungen.raeumlicheelemnte_projekt DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE alw_strukturverbesserungen.raeumlicheelemnte_seilbahn_station ADD CONSTRAINT raeumlichlmnt_slbhn_sttion_werkeigentum_fkey FOREIGN KEY ( werkeigentum ) REFERENCES alw_strukturverbesserungen.raeumlicheelemnte_werkseigentum DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE alw_strukturverbesserungen.raeumlicheelemnte_entw_bodenstruktur_flaeche ADD CONSTRAINT raemlchlmnt_nnstrktr_flche_projekt_fkey FOREIGN KEY ( projekt ) REFERENCES alw_strukturverbesserungen.raeumlicheelemnte_projekt DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE alw_strukturverbesserungen.raeumlicheelemnte_entw_bodenstruktur_flaeche ADD CONSTRAINT raemlchlmnt_nnstrktr_flche_werkeigentum_fkey FOREIGN KEY ( werkeigentum ) REFERENCES alw_strukturverbesserungen.raeumlicheelemnte_werkseigentum DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE alw_strukturverbesserungen.raeumlicheelemnte_entw_bodenstruktur_linie ADD CONSTRAINT raemlchlmnt_ndnstrktr_lnie_projekt_fkey FOREIGN KEY ( projekt ) REFERENCES alw_strukturverbesserungen.raeumlicheelemnte_projekt DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE alw_strukturverbesserungen.raeumlicheelemnte_entw_bodenstruktur_linie ADD CONSTRAINT raemlchlmnt_ndnstrktr_lnie_werkeigentum_fkey FOREIGN KEY ( werkeigentum ) REFERENCES alw_strukturverbesserungen.raeumlicheelemnte_werkseigentum DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE alw_strukturverbesserungen.raeumlicheelemnte_entw_bodenstruktur_pumpwerk ADD CONSTRAINT raemlchlmnt_ntrktr_pmpwerk_projekt_fkey FOREIGN KEY ( projekt ) REFERENCES alw_strukturverbesserungen.raeumlicheelemnte_projekt DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE alw_strukturverbesserungen.raeumlicheelemnte_entw_bodenstruktur_pumpwerk ADD CONSTRAINT raemlchlmnt_ntrktr_pmpwerk_werkeigentum_fkey FOREIGN KEY ( werkeigentum ) REFERENCES alw_strukturverbesserungen.raeumlicheelemnte_werkseigentum DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE alw_strukturverbesserungen.raeumlicheelemnte_bew_flaechen_bewaesserung ADD CONSTRAINT raemlchlmnt_blchn_bwssrung_projekt_fkey FOREIGN KEY ( projekt ) REFERENCES alw_strukturverbesserungen.raeumlicheelemnte_projekt DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE alw_strukturverbesserungen.raeumlicheelemnte_bew_flaechen_bewaesserung ADD CONSTRAINT raemlchlmnt_blchn_bwssrung_werkeigentum_fkey FOREIGN KEY ( werkeigentum ) REFERENCES alw_strukturverbesserungen.raeumlicheelemnte_werkseigentum DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE alw_strukturverbesserungen.raeumlicheelemnte_bewaesserung_linie ADD CONSTRAINT raeumlichlmnt_bwssrng_lnie_projekt_fkey FOREIGN KEY ( projekt ) REFERENCES alw_strukturverbesserungen.raeumlicheelemnte_projekt DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE alw_strukturverbesserungen.raeumlicheelemnte_bewaesserung_linie ADD CONSTRAINT raeumlichlmnt_bwssrng_lnie_werkeigentum_fkey FOREIGN KEY ( werkeigentum ) REFERENCES alw_strukturverbesserungen.raeumlicheelemnte_werkseigentum DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE alw_strukturverbesserungen.raeumlicheelemnte_bewaesserung_punkt ADD CONSTRAINT raeumlichlmnt_bwssrng_pnkt_projekt_fkey FOREIGN KEY ( projekt ) REFERENCES alw_strukturverbesserungen.raeumlicheelemnte_projekt DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE alw_strukturverbesserungen.raeumlicheelemnte_bewaesserung_punkt ADD CONSTRAINT raeumlichlmnt_bwssrng_pnkt_werkeigentum_fkey FOREIGN KEY ( werkeigentum ) REFERENCES alw_strukturverbesserungen.raeumlicheelemnte_werkseigentum DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE alw_strukturverbesserungen.raeumlicheelemnte_wasserversorgung_punkt ADD CONSTRAINT raemlchlmnt_wrvrsrgng_pnkt_projekt_fkey FOREIGN KEY ( projekt ) REFERENCES alw_strukturverbesserungen.raeumlicheelemnte_projekt DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE alw_strukturverbesserungen.raeumlicheelemnte_wasserversorgung_punkt ADD CONSTRAINT raemlchlmnt_wrvrsrgng_pnkt_werkeigentum_fkey FOREIGN KEY ( werkeigentum ) REFERENCES alw_strukturverbesserungen.raeumlicheelemnte_werkseigentum DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE alw_strukturverbesserungen.raeumlicheelemnte_wv_leitung_wasserversorgung ADD CONSTRAINT raemlchlmnt_w_wssrvrsrgung_projekt_fkey FOREIGN KEY ( projekt ) REFERENCES alw_strukturverbesserungen.raeumlicheelemnte_projekt DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE alw_strukturverbesserungen.raeumlicheelemnte_wv_leitung_wasserversorgung ADD CONSTRAINT raemlchlmnt_w_wssrvrsrgung_werkeigentum_fkey FOREIGN KEY ( werkeigentum ) REFERENCES alw_strukturverbesserungen.raeumlicheelemnte_werkseigentum DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE alw_strukturverbesserungen.raeumlicheelemnte_ev_punkt ADD CONSTRAINT raeumlicheelemnte_ev_punkt_projekt_fkey FOREIGN KEY ( projekt ) REFERENCES alw_strukturverbesserungen.raeumlicheelemnte_projekt DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE alw_strukturverbesserungen.raeumlicheelemnte_ev_punkt ADD CONSTRAINT raeumlicheelemnte_ev_punkt_werkeigentum_fkey FOREIGN KEY ( werkeigentum ) REFERENCES alw_strukturverbesserungen.raeumlicheelemnte_werkseigentum DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE alw_strukturverbesserungen.raeumlicheelemnte_ev_linie ADD CONSTRAINT raeumlicheelemnte_ev_linie_projekt_fkey FOREIGN KEY ( projekt ) REFERENCES alw_strukturverbesserungen.raeumlicheelemnte_projekt DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE alw_strukturverbesserungen.raeumlicheelemnte_ev_linie ADD CONSTRAINT raeumlicheelemnte_ev_linie_werkeigentum_fkey FOREIGN KEY ( werkeigentum ) REFERENCES alw_strukturverbesserungen.raeumlicheelemnte_werkseigentum DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE alw_strukturverbesserungen.raeumlicheelemnte_milchleitung_leitung ADD CONSTRAINT raemlchlmnt_mlchltng_ltung_projekt_fkey FOREIGN KEY ( projekt ) REFERENCES alw_strukturverbesserungen.raeumlicheelemnte_projekt DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE alw_strukturverbesserungen.raeumlicheelemnte_milchleitung_leitung ADD CONSTRAINT raemlchlmnt_mlchltng_ltung_werkeigentum_fkey FOREIGN KEY ( werkeigentum ) REFERENCES alw_strukturverbesserungen.raeumlicheelemnte_werkseigentum DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE alw_strukturverbesserungen.raeumlicheelemnte_milchleitung_lokal ADD CONSTRAINT raeumlchlmnt_mlchltng_lkal_projekt_fkey FOREIGN KEY ( projekt ) REFERENCES alw_strukturverbesserungen.raeumlicheelemnte_projekt DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE alw_strukturverbesserungen.raeumlicheelemnte_milchleitung_lokal ADD CONSTRAINT raeumlchlmnt_mlchltng_lkal_werkeigentum_fkey FOREIGN KEY ( werkeigentum ) REFERENCES alw_strukturverbesserungen.raeumlicheelemnte_werkseigentum DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE alw_strukturverbesserungen.raeumlicheelemnte_oekologie_linie ADD CONSTRAINT raeumlicheelemnte_klg_lnie_projekt_fkey FOREIGN KEY ( projekt ) REFERENCES alw_strukturverbesserungen.raeumlicheelemnte_projekt DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE alw_strukturverbesserungen.raeumlicheelemnte_oekologie_linie ADD CONSTRAINT raeumlicheelemnte_klg_lnie_werkeigentum_fkey FOREIGN KEY ( werkeigentum ) REFERENCES alw_strukturverbesserungen.raeumlicheelemnte_werkseigentum DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE alw_strukturverbesserungen.raeumlicheelemnte_oekologie_trockenmauer ADD CONSTRAINT raemlchlmnt_klg_trcknmuer_hoehe_check CHECK( hoehe BETWEEN 0.0 AND 50.0);
ALTER TABLE alw_strukturverbesserungen.raeumlicheelemnte_oekologie_trockenmauer ADD CONSTRAINT raeumlchlmnt_klg_trcknmuer_projekt_fkey FOREIGN KEY ( projekt ) REFERENCES alw_strukturverbesserungen.raeumlicheelemnte_projekt DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE alw_strukturverbesserungen.raeumlicheelemnte_oekologie_trockenmauer ADD CONSTRAINT raeumlchlmnt_klg_trcknmuer_werkeigentum_fkey FOREIGN KEY ( werkeigentum ) REFERENCES alw_strukturverbesserungen.raeumlicheelemnte_werkseigentum DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE alw_strukturverbesserungen.raeumlicheelemnte_oekologie_flaeche ADD CONSTRAINT raeumlicheelemnt_klg_flche_projekt_fkey FOREIGN KEY ( projekt ) REFERENCES alw_strukturverbesserungen.raeumlicheelemnte_projekt DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE alw_strukturverbesserungen.raeumlicheelemnte_oekologie_flaeche ADD CONSTRAINT raeumlicheelemnt_klg_flche_werkeigentum_fkey FOREIGN KEY ( werkeigentum ) REFERENCES alw_strukturverbesserungen.raeumlicheelemnte_werkseigentum DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE alw_strukturverbesserungen.raeumlicheelemnte_hochbau ADD CONSTRAINT raeumlicheelemnte_hochbau_projekt_fkey FOREIGN KEY ( projekt ) REFERENCES alw_strukturverbesserungen.raeumlicheelemnte_projekt DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE alw_strukturverbesserungen.raeumlicheelemnte_hochbau ADD CONSTRAINT raeumlicheelemnte_hochbau_werkeigentum_fkey FOREIGN KEY ( werkeigentum ) REFERENCES alw_strukturverbesserungen.raeumlicheelemnte_werkseigentum DEFERRABLE INITIALLY DEFERRED;
CREATE UNIQUE INDEX raeumlicheelemnte_projekt_kantonsnummer_key ON alw_strukturverbesserungen.raeumlicheelemnte_projekt (kantonsnummer)
;
ALTER TABLE alw_strukturverbesserungen.raeumlicheelemnte_genossenschaft_dokument ADD CONSTRAINT raemlchlmnt_gnschft_dkment_dokument_fkey FOREIGN KEY ( dokument ) REFERENCES alw_strukturverbesserungen.raeumlicheelemnte_dokument DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE alw_strukturverbesserungen.raeumlicheelemnte_genossenschaft_dokument ADD CONSTRAINT raemlchlmnt_gnschft_dkment_genossenschaft_fkey FOREIGN KEY ( genossenschaft ) REFERENCES alw_strukturverbesserungen.raeumlicheelemnte_genossenschaft DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE alw_strukturverbesserungen.raeumlicheelemnte_genossenschaft_element ADD CONSTRAINT raemlchlmnt_gsnschft_lment_genossenschaft_element_fkey FOREIGN KEY ( genossenschaft_element ) REFERENCES alw_strukturverbesserungen.raeumlicheelemnte_genossenschaft DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE alw_strukturverbesserungen.raeumlicheelemnte_genossenschaft_element ADD CONSTRAINT raemlchlmnt_gsnschft_lment_elemnt_gnssnschlmnt_v_lnie_fkey FOREIGN KEY ( element_genossenschaft_raeumlicheelemnte_ev_linie ) REFERENCES alw_strukturverbesserungen.raeumlicheelemnte_ev_linie DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE alw_strukturverbesserungen.raeumlicheelemnte_genossenschaft_element ADD CONSTRAINT raemlchlmnt_gsnschft_lment_elemnt_gnssns_bwssrng_lnie_fkey FOREIGN KEY ( element_genossenschaft_raeumlicheelemnte_bewssrng_lnie ) REFERENCES alw_strukturverbesserungen.raeumlicheelemnte_bewaesserung_linie DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE alw_strukturverbesserungen.raeumlicheelemnte_genossenschaft_element ADD CONSTRAINT raemlchlmnt_gsnschft_lment_elemnt_gnssnsmlchltng_lkal_fkey FOREIGN KEY ( element_genossenschaft_raeumlicheelemnte_mlchltng_lkal ) REFERENCES alw_strukturverbesserungen.raeumlicheelemnte_milchleitung_lokal DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE alw_strukturverbesserungen.raeumlicheelemnte_genossenschaft_element ADD CONSTRAINT raemlchlmnt_gsnschft_lment_elemnt_gnssnsklg_trcknmuer_fkey FOREIGN KEY ( element_genossenschaft_raeumlicheelemnte_klg_trcknmuer ) REFERENCES alw_strukturverbesserungen.raeumlicheelemnte_oekologie_trockenmauer DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE alw_strukturverbesserungen.raeumlicheelemnte_genossenschaft_element ADD CONSTRAINT raemlchlmnt_gsnschft_lment_elemnt_gnssns_wssrvrsrgung_fkey FOREIGN KEY ( element_genossenschaft_raemlchlmnt_wv_tng_wssrvrsrgung ) REFERENCES alw_strukturverbesserungen.raeumlicheelemnte_wv_leitung_wasserversorgung DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE alw_strukturverbesserungen.raeumlicheelemnte_genossenschaft_element ADD CONSTRAINT raemlchlmnt_gsnschft_lment_elemnt_gnssnslmnt_klg_lnie_fkey FOREIGN KEY ( element_genossenschaft_raeumlicheelemnte_oekologi_lnie ) REFERENCES alw_strukturverbesserungen.raeumlicheelemnte_oekologie_linie DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE alw_strukturverbesserungen.raeumlicheelemnte_genossenschaft_element ADD CONSTRAINT raemlchlmnt_gsnschft_lment_elemnt_gnssns_bwssrng_pnkt_fkey FOREIGN KEY ( element_genossenschaft_raeumlicheelemnte_bewssrng_pnkt ) REFERENCES alw_strukturverbesserungen.raeumlicheelemnte_bewaesserung_punkt DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE alw_strukturverbesserungen.raeumlicheelemnte_genossenschaft_element ADD CONSTRAINT raemlchlmnt_gsnschft_lment_elemnt_gnssnschlmnt_v_pnkt_fkey FOREIGN KEY ( element_genossenschaft_raeumlicheelemnte_ev_punkt ) REFERENCES alw_strukturverbesserungen.raeumlicheelemnte_ev_punkt DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE alw_strukturverbesserungen.raeumlicheelemnte_genossenschaft_element ADD CONSTRAINT raemlchlmnt_gsnschft_lment_elemnt_gnssnsnt_slbhn_lnie_fkey FOREIGN KEY ( element_genossenschaft_raeumlicheelemnte_seilbahn_lnie ) REFERENCES alw_strukturverbesserungen.raeumlicheelemnte_seilbahn_linie DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE alw_strukturverbesserungen.raeumlicheelemnte_genossenschaft_element ADD CONSTRAINT raemlchlmnt_gsnschft_lment_elemnt_gnssnsrck_lhnnvdukt_fkey FOREIGN KEY ( element_genossenschaft_raeumlichlmnt_wg_brck_lhnnvdukt ) REFERENCES alw_strukturverbesserungen.raeumlicheelemnte_wege_bruecke_lehnenviadukt DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE alw_strukturverbesserungen.raeumlicheelemnte_genossenschaft_element ADD CONSTRAINT raemlchlmnt_gsnschft_lment_elemnt_gnssnslmnt_klg_pnkt_fkey FOREIGN KEY ( element_genossenschaft_raeumlicheelemnte_oekologi_pnkt ) REFERENCES alw_strukturverbesserungen.raeumlicheelemnte_oekologie_punkt DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE alw_strukturverbesserungen.raeumlicheelemnte_genossenschaft_element ADD CONSTRAINT raemlchlmnt_gsnschft_lment_elemnt_gnssnslchn_bwssrung_fkey FOREIGN KEY ( element_genossenschaft_raeumlichlmnt_bw_flchn_bwssrung ) REFERENCES alw_strukturverbesserungen.raeumlicheelemnte_bew_flaechen_bewaesserung DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE alw_strukturverbesserungen.raeumlicheelemnte_genossenschaft_element ADD CONSTRAINT raemlchlmnt_gsnschft_lment_elemnt_gnssnshrstllng_pnkt_fkey FOREIGN KEY ( element_genossenschaft_raeumlichelmnt_wdrhrstllng_pnkt ) REFERENCES alw_strukturverbesserungen.raeumlicheelemnte_wiederherstellung_punkt DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE alw_strukturverbesserungen.raeumlicheelemnte_genossenschaft_element ADD CONSTRAINT raemlchlmnt_gsnschft_lment_elemnt_gnssnstrktr_pmpwerk_fkey FOREIGN KEY ( element_genossenschaft_raemlchlmnt_ntwdnstrktr_pmpwerk ) REFERENCES alw_strukturverbesserungen.raeumlicheelemnte_entw_bodenstruktur_pumpwerk DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE alw_strukturverbesserungen.raeumlicheelemnte_genossenschaft_element ADD CONSTRAINT raemlchlmnt_gsnschft_lment_elemnt_gnssnsrvrsrgng_pnkt_fkey FOREIGN KEY ( element_genossenschaft_raeumlichelmnt_wssrvrsrgng_pnkt ) REFERENCES alw_strukturverbesserungen.raeumlicheelemnte_wasserversorgung_punkt DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE alw_strukturverbesserungen.raeumlicheelemnte_genossenschaft_element ADD CONSTRAINT raemlchlmnt_gsnschft_lment_elemnt_gnssnslchltng_ltung_fkey FOREIGN KEY ( element_genossenschaft_raeumlicheelemnt_mlchltng_ltung ) REFERENCES alw_strukturverbesserungen.raeumlicheelemnte_milchleitung_leitung DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE alw_strukturverbesserungen.raeumlicheelemnte_genossenschaft_element ADD CONSTRAINT raemlchlmnt_gsnschft_lment_elemnt_gnssnsdnstrktr_lnie_fkey FOREIGN KEY ( element_genossenschaft_raeumlchlmnt_ntw_bdnstrktr_lnie ) REFERENCES alw_strukturverbesserungen.raeumlicheelemnte_entw_bodenstruktur_linie DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE alw_strukturverbesserungen.raeumlicheelemnte_genossenschaft_element ADD CONSTRAINT raemlchlmnt_gsnschft_lment_elemnt_gnssnschlmnt_hchbau_fkey FOREIGN KEY ( element_genossenschaft_raeumlicheelemnte_hochbau ) REFERENCES alw_strukturverbesserungen.raeumlicheelemnte_hochbau DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE alw_strukturverbesserungen.raeumlicheelemnte_genossenschaft_element ADD CONSTRAINT raemlchlmnt_gsnschft_lment_elemnt_gnssnsmnt_klg_flche_fkey FOREIGN KEY ( element_genossenschaft_raeumlicheelemnte_oekolog_flche ) REFERENCES alw_strukturverbesserungen.raeumlicheelemnte_oekologie_flaeche DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE alw_strukturverbesserungen.raeumlicheelemnte_genossenschaft_element ADD CONSTRAINT raemlchlmnt_gsnschft_lment_elemnt_gnssns_slbhn_sttion_fkey FOREIGN KEY ( element_genossenschaft_raeumlicheelemnte_selbhn_sttion ) REFERENCES alw_strukturverbesserungen.raeumlicheelemnte_seilbahn_station DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE alw_strukturverbesserungen.raeumlicheelemnte_genossenschaft_element ADD CONSTRAINT raemlchlmnt_gsnschft_lment_elemnt_gnssnsnstrktr_flche_fkey FOREIGN KEY ( element_genossenschaft_raemlchlmnt_ntw_bdnstrktr_flche ) REFERENCES alw_strukturverbesserungen.raeumlicheelemnte_entw_bodenstruktur_flaeche DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE alw_strukturverbesserungen.raeumlicheelemnte_genossenschaft_element ADD CONSTRAINT raemlchlmnt_gsnschft_lment_elemnt_gnssnslmnt_wgb_lnie_fkey FOREIGN KEY ( element_genossenschaft_raeumlicheelemnte_wegebau_linie ) REFERENCES alw_strukturverbesserungen.raeumlicheelemnte_wegebau_linie DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE alw_strukturverbesserungen.raeumlicheelemnte_beizugsgebiet_projekt ADD CONSTRAINT raemlchlmnt_bzgsgbt_prjekt_beizugsgebiet_fkey FOREIGN KEY ( beizugsgebiet ) REFERENCES alw_strukturverbesserungen.raeumlicheelemnte_beizugsgebiet DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE alw_strukturverbesserungen.raeumlicheelemnte_beizugsgebiet_projekt ADD CONSTRAINT raemlchlmnt_bzgsgbt_prjekt_projekt_fkey FOREIGN KEY ( projekt ) REFERENCES alw_strukturverbesserungen.raeumlicheelemnte_projekt DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE alw_strukturverbesserungen.T_ILI2DB_BASKET ADD CONSTRAINT T_ILI2DB_BASKET_dataset_fkey FOREIGN KEY ( dataset ) REFERENCES alw_strukturverbesserungen.T_ILI2DB_DATASET DEFERRABLE INITIALLY DEFERRED;
CREATE UNIQUE INDEX T_ILI2DB_DATASET_datasetName_key ON alw_strukturverbesserungen.T_ILI2DB_DATASET (datasetName)
;
CREATE UNIQUE INDEX T_ILI2DB_MODEL_iliversion_modelName_key ON alw_strukturverbesserungen.T_ILI2DB_MODEL (iliversion,modelName)
;
CREATE UNIQUE INDEX T_ILI2DB_ATTRNAME_SqlName_ColOwner_key ON alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (SqlName,ColOwner)
;
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('SO_ALW_Strukturverbesserungen_20190912.Dokumententyp','dokumententyp');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.EV_Punkt','raeumlicheelemnte_ev_punkt');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('SO_ALW_Strukturverbesserungen_20190912.Elektrizitaet_Punkte','elektrizitaet_punkte');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('GeometryCHLV95_V1.MultiSurface','multisurface');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Entw_Bodenstruktur_Linie','raeumlicheelemnte_entw_bodenstruktur_linie');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('SO_ALW_Strukturverbesserungen_20190912.Wasserversorgung_Punkte','wasserversorgung_punkte');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('SO_ALW_Strukturverbesserungen_20190912.Entw_Bodenstruktur_Linien','entw_bodenstruktur_linien');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('SO_ALW_Strukturverbesserungen_20190912.Oekologie_Linien','oekologie_linien');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Oekologie_Linie','raeumlicheelemnte_oekologie_linie');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.EV_Linie','raeumlicheelemnte_ev_linie');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Oekologie_Punkt','raeumlicheelemnte_oekologie_punkt');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('SO_ALW_Strukturverbesserungen_20190912.Projekt','projekt');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Seilbahn_Station','raeumlicheelemnte_seilbahn_station');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('SO_ALW_Strukturverbesserungen_20190912.Technische_Schwierigkeit','technische_schwierigkeit');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Bewaesserung_Linie','raeumlicheelemnte_bewaesserung_linie');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('SO_ALW_Strukturverbesserungen_20190912.Status','astatus');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('SO_ALW_Strukturverbesserungen_20190912.Seilbahnen_Punkte','seilbahnen_punkte');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Bewaesserung_Punkt','raeumlicheelemnte_bewaesserung_punkt');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Milchleitung_Leitung','raeumlicheelemnte_milchleitung_leitung');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Entw_Bodenstruktur_Pumpwerk','raeumlicheelemnte_entw_bodenstruktur_pumpwerk');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Entw_Bodenstruktur_Flaeche','raeumlicheelemnte_entw_bodenstruktur_flaeche');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.WV_Leitung_Wasserversorgung','raeumlicheelemnte_wv_leitung_wasserversorgung');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element','raeumlicheelemnte_raeumliches_element');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Projekt','raeumlicheelemnte_projekt');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Oekologie_Trockenmauer','raeumlicheelemnte_oekologie_trockenmauer');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Beizugsgebiet','raeumlicheelemnte_beizugsgebiet');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('SO_ALW_Strukturverbesserungen_20190912.Wiederherstellung_Punkte','wiederherstellung_punkte');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('SO_ALW_Strukturverbesserungen_20190912.Stand_Gueterregulierung.Stand_Gueterregulierung','stand_gutrrglrung_stand_gueterregulierung');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Genossenschaft_Dokument','raeumlicheelemnte_genossenschaft_dokument');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Seilbahn_Linie','raeumlicheelemnte_seilbahn_linie');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Wegebau_Linie','raeumlicheelemnte_wegebau_linie');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Wasserversorgung_Punkt','raeumlicheelemnte_wasserversorgung_punkt');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('GeometryCHLV95_V1.MultiLine','multiline');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Wiederherstellung_Punkt','raeumlicheelemnte_wiederherstellung_punkt');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Oekologie_Flaeche','raeumlicheelemnte_oekologie_flaeche');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('SO_ALW_Strukturverbesserungen_20190912.Beizugsgebiete','beizugsgebiete');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('SO_ALW_Strukturverbesserungen_20190912.Bewaesserung_Flaechen','bewaesserung_flaechen');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Genossenschaft','raeumlicheelemnte_genossenschaft');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('SO_ALW_Strukturverbesserungen_20190912.Stand','stand');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('SO_ALW_Strukturverbesserungen_20190912.Oekologie_Trockenmauern','oekologie_trockenmauern');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Werkseigentum','raeumlicheelemnte_werkseigentum');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Milchleitung_Lokal','raeumlicheelemnte_milchleitung_lokal');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('SO_ALW_Strukturverbesserungen_20190912.Bewaesserung_Punkte','bewaesserung_punkte');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Projekt_Element','raeumlicheelemnte_projekt_element');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('SO_ALW_Strukturverbesserungen_20190912.Genossenschaften','genossenschaften');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('SO_ALW_Strukturverbesserungen_20190912.Bautyp','bautyp');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('SO_ALW_Strukturverbesserungen_20190912.Hochbau_Punkte','hochbau_punkte');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Genossenschaft_Element','raeumlicheelemnte_genossenschaft_element');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Werkeigentum_Element','raeumlicheelemnte_werkeigentum_element');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('SO_ALW_Strukturverbesserungen_20190912.Wege','wege');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('SO_ALW_Strukturverbesserungen_20190912.Oekologische_Flaechen','oekologische_flaechen');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Wege_Bruecke_Lehnenviadukt.Material','raeumlichelmnte_wege_bruecke_lehnenviadukt_material');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('SO_ALW_Strukturverbesserungen_20190912.Entw_Bodenstruktur_Flaechen','entw_bodenstruktur_flaechen');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Hochbau','raeumlicheelemnte_hochbau');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('SO_ALW_Strukturverbesserungen_20190912.Bewaesserung_Linien','bewaesserung_linien');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Beizugsgebiet_Projekt','raeumlicheelemnte_beizugsgebiet_projekt');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('SO_ALW_Strukturverbesserungen_20190912.Seilbahnen_Linien','seilbahnen_linien');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Dokument','raeumlicheelemnte_dokument');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('GeometryCHLV95_V1.LineStructure','linestructure');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Bew_Flaechen_Bewaesserung','raeumlicheelemnte_bew_flaechen_bewaesserung');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Wege_Bruecke_Lehnenviadukt','raeumlicheelemnte_wege_bruecke_lehnenviadukt');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('SO_ALW_Strukturverbesserungen_20190912.Elektrizitaet_Linien','elektrizitaet_linien');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('SO_ALW_Strukturverbesserungen_20190912.Funktionstyp','funktionstyp');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('SO_ALW_Strukturverbesserungen_20190912.Oekologie_Punkte','oekologie_punkte');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('GeometryCHLV95_V1.SurfaceStructure','surfacestructure');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Wiederherstellungs_Punkt_Bild','raeumlicheelemnte_wiederherstellungs_punkt_bild');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Bewaesserung_Linie.Geometrie','geometrie','raeumlicheelemnte_bewaesserung_linie',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GeometryCHLV95_V1.MultiSurface.Surfaces','multisurface_surfaces','surfacestructure','multisurface');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.UnterhaltsID','unterhaltsid','raeumlicheelemnte_entw_bodenstruktur_linie',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.EV_Punkt.Typ','typ','raeumlicheelemnte_ev_punkt',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Genossenschaft_Element.Element_Genossenschaft','element_genossenschaft_raeumlicheelemnte_selbhn_sttion','raeumlicheelemnte_genossenschaft_element','raeumlicheelemnte_seilbahn_station');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Wegebau_Linie.Bezeichnung','bezeichnung','raeumlicheelemnte_wegebau_linie',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.UnterhaltsID','unterhaltsid','raeumlicheelemnte_entw_bodenstruktur_pumpwerk',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Projekt_Element.Projekt','projekt','raeumlicheelemnte_ev_punkt','raeumlicheelemnte_projekt');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.Status','astatus','raeumlicheelemnte_oekologie_flaeche',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.Status_Datum','status_datum','raeumlicheelemnte_oekologie_punkt',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.UnterhaltsID','unterhaltsid','raeumlicheelemnte_ev_linie',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.Status','astatus','raeumlicheelemnte_hochbau',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Oekologie_Flaeche.Bautyp','bautyp','raeumlicheelemnte_oekologie_flaeche',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Genossenschaft_Element.Element_Genossenschaft','element_genossenschaft_raeumlicheelemnte_oekologi_pnkt','raeumlicheelemnte_genossenschaft_element','raeumlicheelemnte_oekologie_punkt');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Genossenschaft_Element.Element_Genossenschaft','element_genossenschaft_raeumlicheelemnte_bewssrng_lnie','raeumlicheelemnte_genossenschaft_element','raeumlicheelemnte_bewaesserung_linie');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Dokument.Titel','titel','raeumlicheelemnte_dokument',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.WerksID','werksid','raeumlicheelemnte_oekologie_linie',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Bewaesserung_Punkt.Typ','typ','raeumlicheelemnte_bewaesserung_punkt',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.Stand_Gueterregulierung.Stand_Gueterregulierung.BFSNr','bfsnr','stand_gutrrglrung_stand_gueterregulierung',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Wege_Bruecke_Lehnenviadukt.Material','material','raeumlicheelemnte_wege_bruecke_lehnenviadukt',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.Status','astatus','raeumlicheelemnte_wege_bruecke_lehnenviadukt',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.Status','astatus','raeumlicheelemnte_bewaesserung_punkt',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Entw_Bodenstruktur_Linie.Typ','typ','raeumlicheelemnte_entw_bodenstruktur_linie',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.Bauabnahme_Datum','bauabnahme_datum','raeumlicheelemnte_bew_flaechen_bewaesserung',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Projekt_Element.Projekt','projekt','raeumlicheelemnte_wv_leitung_wasserversorgung','raeumlicheelemnte_projekt');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Genossenschaft.Reorganisationsdatum','reorganisationsdatum','raeumlicheelemnte_genossenschaft',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.Bauabnahme_Datum','bauabnahme_datum','raeumlicheelemnte_hochbau',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.WerksID','werksid','raeumlicheelemnte_ev_punkt',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Werkeigentum_Element.Werkeigentum','werkeigentum','raeumlicheelemnte_milchleitung_leitung','raeumlicheelemnte_werkseigentum');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.Status_Datum','status_datum','raeumlicheelemnte_entw_bodenstruktur_flaeche',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Wegebau_Linie.Fahrbahnbreite','fahrbahnbreite','raeumlicheelemnte_wegebau_linie',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.Status_Datum','status_datum','raeumlicheelemnte_bewaesserung_linie',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.Status_Datum','status_datum','raeumlicheelemnte_seilbahn_station',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Bew_Flaechen_Bewaesserung.Typ','typ','raeumlicheelemnte_bew_flaechen_bewaesserung',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.WerksID','werksid','raeumlicheelemnte_wv_leitung_wasserversorgung',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.Bauabnahme_Datum','bauabnahme_datum','raeumlicheelemnte_oekologie_trockenmauer',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Werkeigentum_Element.Werkeigentum','werkeigentum','raeumlicheelemnte_ev_punkt','raeumlicheelemnte_werkseigentum');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.Status','astatus','raeumlicheelemnte_oekologie_trockenmauer',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Oekologie_Flaeche.Geometrie','geometrie','raeumlicheelemnte_oekologie_flaeche',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.Bauabnahme_Datum','bauabnahme_datum','raeumlicheelemnte_oekologie_flaeche',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Werkeigentum_Element.Werkeigentum','werkeigentum','raeumlicheelemnte_oekologie_linie','raeumlicheelemnte_werkseigentum');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.Bauabnahme_Datum','bauabnahme_datum','raeumlicheelemnte_wege_bruecke_lehnenviadukt',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.Bauabnahme_Datum','bauabnahme_datum','raeumlicheelemnte_bewaesserung_punkt',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.Status','astatus','raeumlicheelemnte_bew_flaechen_bewaesserung',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Milchleitung_Leitung.Geometrie','geometrie','raeumlicheelemnte_milchleitung_leitung',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.Status_Datum','status_datum','raeumlicheelemnte_bewaesserung_punkt',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.UnterhaltsID','unterhaltsid','raeumlicheelemnte_wv_leitung_wasserversorgung',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Projekt.Geschaeftsnummer','geschaeftsnummer','raeumlicheelemnte_projekt',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Entw_Bodenstruktur_Linie.Bautyp','bautyp','raeumlicheelemnte_entw_bodenstruktur_linie',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.WerksID','werksid','raeumlicheelemnte_milchleitung_leitung',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Genossenschaft_Element.Element_Genossenschaft','element_genossenschaft_raeumlicheelemnte_wegebau_linie','raeumlicheelemnte_genossenschaft_element','raeumlicheelemnte_wegebau_linie');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.WerksID','werksid','raeumlicheelemnte_bewaesserung_linie',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Projekt_Element.Projekt','projekt','raeumlicheelemnte_milchleitung_leitung','raeumlicheelemnte_projekt');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Milchleitung_Lokal.Geometrie','geometrie','raeumlicheelemnte_milchleitung_lokal',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Werkeigentum_Element.Werkeigentum','werkeigentum','raeumlicheelemnte_wv_leitung_wasserversorgung','raeumlicheelemnte_werkseigentum');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.UnterhaltsID','unterhaltsid','raeumlicheelemnte_wegebau_linie',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Genossenschaft_Element.Element_Genossenschaft','element_genossenschaft_raeumlicheelemnte_hochbau','raeumlicheelemnte_genossenschaft_element','raeumlicheelemnte_hochbau');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.Bauabnahme_Datum','bauabnahme_datum','raeumlicheelemnte_wiederherstellung_punkt',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Projekt_Element.Projekt','projekt','raeumlicheelemnte_entw_bodenstruktur_linie','raeumlicheelemnte_projekt');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Wegebau_Linie.Funktionstyp','funktionstyp','raeumlicheelemnte_wegebau_linie',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Bewaesserung_Punkt.Bautyp','bautyp','raeumlicheelemnte_bewaesserung_punkt',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Entw_Bodenstruktur_Pumpwerk.Bautyp','bautyp','raeumlicheelemnte_entw_bodenstruktur_pumpwerk',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Projekt_Element.Projekt','projekt','raeumlicheelemnte_bewaesserung_linie','raeumlicheelemnte_projekt');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Genossenschaft_Dokument.Genossenschaft','genossenschaft','raeumlicheelemnte_genossenschaft_dokument','raeumlicheelemnte_genossenschaft');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Milchleitung_Lokal.Bautyp','bautyp','raeumlicheelemnte_milchleitung_lokal',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.UnterhaltsID','unterhaltsid','raeumlicheelemnte_milchleitung_lokal',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.Status','astatus','raeumlicheelemnte_oekologie_punkt',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Seilbahn_Linie.Bautyp','bautyp','raeumlicheelemnte_seilbahn_linie',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.Status_Datum','status_datum','raeumlicheelemnte_oekologie_trockenmauer',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Werkseigentum.Name','aname','raeumlicheelemnte_werkseigentum',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Werkeigentum_Element.Werkeigentum','werkeigentum','raeumlicheelemnte_bewaesserung_linie','raeumlicheelemnte_werkseigentum');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.Status_Datum','status_datum','raeumlicheelemnte_oekologie_linie',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.Status_Datum','status_datum','raeumlicheelemnte_oekologie_flaeche',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.UnterhaltsID','unterhaltsid','raeumlicheelemnte_wasserversorgung_punkt',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Genossenschaft.Unterhaltsobjekt','unterhaltsobjekt','raeumlicheelemnte_genossenschaft',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Werkeigentum_Element.Werkeigentum','werkeigentum','raeumlicheelemnte_entw_bodenstruktur_flaeche','raeumlicheelemnte_werkseigentum');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.Status','astatus','raeumlicheelemnte_bewaesserung_linie',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Genossenschaft_Element.Element_Genossenschaft','element_genossenschaft_raemlchlmnt_ntwdnstrktr_pmpwerk','raeumlicheelemnte_genossenschaft_element','raeumlicheelemnte_entw_bodenstruktur_pumpwerk');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.UnterhaltsID','unterhaltsid','raeumlicheelemnte_oekologie_linie',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.Status_Datum','status_datum','raeumlicheelemnte_ev_punkt',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.UnterhaltsID','unterhaltsid','raeumlicheelemnte_bew_flaechen_bewaesserung',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Beizugsgebiet.Geometrie','geometrie','raeumlicheelemnte_beizugsgebiet',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Projekt.Projekttypen','projekttypen','raeumlicheelemnte_projekt',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Werkseigentum.Adresse','adresse','raeumlicheelemnte_werkseigentum',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Milchleitung_Leitung.Bautyp','bautyp','raeumlicheelemnte_milchleitung_leitung',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.Bauabnahme_Datum','bauabnahme_datum','raeumlicheelemnte_oekologie_punkt',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Projekt_Element.Projekt','projekt','raeumlicheelemnte_seilbahn_linie','raeumlicheelemnte_projekt');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.WerksID','werksid','raeumlicheelemnte_entw_bodenstruktur_pumpwerk',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.Status','astatus','raeumlicheelemnte_wiederherstellung_punkt',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Beizugsgebiet.Typ','typ','raeumlicheelemnte_beizugsgebiet',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Genossenschaft_Element.Element_Genossenschaft','element_genossenschaft_raeumlicheelemnte_oekologi_lnie','raeumlicheelemnte_genossenschaft_element','raeumlicheelemnte_oekologie_linie');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Beizugsgebiet.Datum_Nachfuehrung','datum_nachfuehrung','raeumlicheelemnte_beizugsgebiet',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.UnterhaltsID','unterhaltsid','raeumlicheelemnte_wiederherstellung_punkt',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Wasserversorgung_Punkt.Typ','typ','raeumlicheelemnte_wasserversorgung_punkt',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Genossenschaft_Element.Element_Genossenschaft','element_genossenschaft_raemlchlmnt_ntw_bdnstrktr_flche','raeumlicheelemnte_genossenschaft_element','raeumlicheelemnte_entw_bodenstruktur_flaeche');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.Status_Datum','status_datum','raeumlicheelemnte_wv_leitung_wasserversorgung',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.WerksID','werksid','raeumlicheelemnte_seilbahn_linie',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.Status','astatus','raeumlicheelemnte_milchleitung_lokal',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Wege_Bruecke_Lehnenviadukt.Widerlager','widerlager','raeumlicheelemnte_wege_bruecke_lehnenviadukt',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Projekt_Element.Projekt','projekt','raeumlicheelemnte_entw_bodenstruktur_pumpwerk','raeumlicheelemnte_projekt');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Oekologie_Linie.Geometrie','geometrie','raeumlicheelemnte_oekologie_linie',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Oekologie_Punkt.Geometrie','geometrie','raeumlicheelemnte_oekologie_punkt',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Wasserversorgung_Punkt.Bautyp','bautyp','raeumlicheelemnte_wasserversorgung_punkt',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.Bauabnahme_Datum','bauabnahme_datum','raeumlicheelemnte_entw_bodenstruktur_linie',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Oekologie_Flaeche.Typ','typ','raeumlicheelemnte_oekologie_flaeche',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Entw_Bodenstruktur_Pumpwerk.Geometrie','geometrie','raeumlicheelemnte_entw_bodenstruktur_pumpwerk',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Werkeigentum_Element.Werkeigentum','werkeigentum','raeumlicheelemnte_entw_bodenstruktur_pumpwerk','raeumlicheelemnte_werkseigentum');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Wegebau_Linie.Techn_Schwierigkeit','techn_schwierigkeit','raeumlicheelemnte_wegebau_linie',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.Status','astatus','raeumlicheelemnte_oekologie_linie',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Beizugsgebiet_Projekt.Beizugsgebiet','beizugsgebiet','raeumlicheelemnte_beizugsgebiet_projekt','raeumlicheelemnte_beizugsgebiet');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.EV_Punkt.Bautyp','bautyp','raeumlicheelemnte_ev_punkt',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Werkeigentum_Element.Werkeigentum','werkeigentum','raeumlicheelemnte_oekologie_flaeche','raeumlicheelemnte_werkseigentum');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Wegebau_Linie.Bautyp','bautyp','raeumlicheelemnte_wegebau_linie',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.Bauabnahme_Datum','bauabnahme_datum','raeumlicheelemnte_entw_bodenstruktur_pumpwerk',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Projekt_Element.Projekt','projekt','raeumlicheelemnte_milchleitung_lokal','raeumlicheelemnte_projekt');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.Status','astatus','raeumlicheelemnte_entw_bodenstruktur_pumpwerk',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.WerksID','werksid','raeumlicheelemnte_oekologie_flaeche',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Genossenschaft_Element.Element_Genossenschaft','element_genossenschaft_raeumlicheelemnt_mlchltng_ltung','raeumlicheelemnte_genossenschaft_element','raeumlicheelemnte_milchleitung_leitung');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.Status','astatus','raeumlicheelemnte_entw_bodenstruktur_flaeche',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.Bauabnahme_Datum','bauabnahme_datum','raeumlicheelemnte_milchleitung_lokal',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.Status_Datum','status_datum','raeumlicheelemnte_milchleitung_leitung',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Wiederherstellung_Punkt.Typ','typ','raeumlicheelemnte_wiederherstellung_punkt',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.UnterhaltsID','unterhaltsid','raeumlicheelemnte_ev_punkt',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.UnterhaltsID','unterhaltsid','raeumlicheelemnte_seilbahn_linie',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Projekt_Element.Projekt','projekt','raeumlicheelemnte_oekologie_linie','raeumlicheelemnte_projekt');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GeometryCHLV95_V1.LineStructure.Line','line','linestructure',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.UnterhaltsID','unterhaltsid','raeumlicheelemnte_milchleitung_leitung',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.EV_Linie.Bautyp','bautyp','raeumlicheelemnte_ev_linie',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.Bauabnahme_Datum','bauabnahme_datum','raeumlicheelemnte_bewaesserung_linie',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Wege_Bruecke_Lehnenviadukt.Bautyp','bautyp','raeumlicheelemnte_wege_bruecke_lehnenviadukt',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.Status_Datum','status_datum','raeumlicheelemnte_bew_flaechen_bewaesserung',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Wege_Bruecke_Lehnenviadukt.Tonnage','tonnage','raeumlicheelemnte_wege_bruecke_lehnenviadukt',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Oekologie_Punkt.Typ','typ','raeumlicheelemnte_oekologie_punkt',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Genossenschaft.Aufloesungsdatum','aufloesungsdatum','raeumlicheelemnte_genossenschaft',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Wasserversorgung_Punkt.Geometrie','geometrie','raeumlicheelemnte_wasserversorgung_punkt',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.EV_Linie.Geometrie','geometrie','raeumlicheelemnte_ev_linie',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.Status_Datum','status_datum','raeumlicheelemnte_hochbau',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Projekt.Kantonsnummer','kantonsnummer','raeumlicheelemnte_projekt',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Bew_Flaechen_Bewaesserung.Bautyp','bautyp','raeumlicheelemnte_bew_flaechen_bewaesserung',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.WerksID','werksid','raeumlicheelemnte_wiederherstellung_punkt',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.Bauabnahme_Datum','bauabnahme_datum','raeumlicheelemnte_entw_bodenstruktur_flaeche',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.Status_Datum','status_datum','raeumlicheelemnte_seilbahn_linie',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Genossenschaft.Typ','typ','raeumlicheelemnte_genossenschaft',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Projekt_Element.Projekt','projekt','raeumlicheelemnte_wiederherstellung_punkt','raeumlicheelemnte_projekt');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Dokument.Dateipfad','dateipfad','raeumlicheelemnte_dokument',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.Bauabnahme_Datum','bauabnahme_datum','raeumlicheelemnte_ev_punkt',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Wegebau_Linie.laenge_gerundet','laenge_gerundet','raeumlicheelemnte_wegebau_linie',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.Status','astatus','raeumlicheelemnte_wv_leitung_wasserversorgung',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Genossenschaft_Element.Genossenschaft_Element','genossenschaft_element','raeumlicheelemnte_genossenschaft_element','raeumlicheelemnte_genossenschaft');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Werkeigentum_Element.Werkeigentum','werkeigentum','raeumlicheelemnte_milchleitung_lokal','raeumlicheelemnte_werkseigentum');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Projekt_Element.Projekt','projekt','raeumlicheelemnte_oekologie_trockenmauer','raeumlicheelemnte_projekt');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Werkeigentum_Element.Werkeigentum','werkeigentum','raeumlicheelemnte_wiederherstellung_punkt','raeumlicheelemnte_werkseigentum');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.Status_Datum','status_datum','raeumlicheelemnte_wegebau_linie',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Projekt.Geometrie','geometrie','raeumlicheelemnte_projekt',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.UnterhaltsID','unterhaltsid','raeumlicheelemnte_entw_bodenstruktur_flaeche',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.Bauabnahme_Datum','bauabnahme_datum','raeumlicheelemnte_wv_leitung_wasserversorgung',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.Status_Datum','status_datum','raeumlicheelemnte_ev_linie',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Genossenschaft_Element.Element_Genossenschaft','element_genossenschaft_raeumlichelmnt_wssrvrsrgng_pnkt','raeumlicheelemnte_genossenschaft_element','raeumlicheelemnte_wasserversorgung_punkt');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.Status','astatus','raeumlicheelemnte_ev_punkt',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.Status_Datum','status_datum','raeumlicheelemnte_wasserversorgung_punkt',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Werkeigentum_Element.Werkeigentum','werkeigentum','raeumlicheelemnte_bew_flaechen_bewaesserung','raeumlicheelemnte_werkseigentum');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Projekt_Element.Projekt','projekt','raeumlicheelemnte_oekologie_flaeche','raeumlicheelemnte_projekt');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.UnterhaltsID','unterhaltsid','raeumlicheelemnte_bewaesserung_punkt',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Genossenschaft_Element.Element_Genossenschaft','element_genossenschaft_raeumlicheelemnte_seilbahn_lnie','raeumlicheelemnte_genossenschaft_element','raeumlicheelemnte_seilbahn_linie');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Bewaesserung_Linie.Bautyp','bautyp','raeumlicheelemnte_bewaesserung_linie',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.WerksID','werksid','raeumlicheelemnte_milchleitung_lokal',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.Status','astatus','raeumlicheelemnte_entw_bodenstruktur_linie',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Bew_Flaechen_Bewaesserung.Geometrie','geometrie','raeumlicheelemnte_bew_flaechen_bewaesserung',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Genossenschaft_Element.Element_Genossenschaft','element_genossenschaft_raeumlicheelemnte_ev_punkt','raeumlicheelemnte_genossenschaft_element','raeumlicheelemnte_ev_punkt');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Bewaesserung_Linie.Typ','typ','raeumlicheelemnte_bewaesserung_linie',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Oekologie_Trockenmauer.Typ','typ','raeumlicheelemnte_oekologie_trockenmauer',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Seilbahn_Station.Geometrie','geometrie','raeumlicheelemnte_seilbahn_station',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Genossenschaft.Gruendungsdatum','gruendungsdatum','raeumlicheelemnte_genossenschaft',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.WerksID','werksid','raeumlicheelemnte_bew_flaechen_bewaesserung',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Projekt_Element.Projekt','projekt','raeumlicheelemnte_bew_flaechen_bewaesserung','raeumlicheelemnte_projekt');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.Bauabnahme_Datum','bauabnahme_datum','raeumlicheelemnte_oekologie_linie',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Genossenschaft.Name','aname','raeumlicheelemnte_genossenschaft',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.UnterhaltsID','unterhaltsid','raeumlicheelemnte_hochbau',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Werkeigentum_Element.Werkeigentum','werkeigentum','raeumlicheelemnte_seilbahn_linie','raeumlicheelemnte_werkseigentum');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Genossenschaft.Genehmigungsdatum','genehmigungsdatum','raeumlicheelemnte_genossenschaft',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.Status_Datum','status_datum','raeumlicheelemnte_milchleitung_lokal',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.Status','astatus','raeumlicheelemnte_ev_linie',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Werkeigentum_Element.Werkeigentum','werkeigentum','raeumlicheelemnte_wegebau_linie','raeumlicheelemnte_werkseigentum');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Projekt_Element.Projekt','projekt','raeumlicheelemnte_wege_bruecke_lehnenviadukt','raeumlicheelemnte_projekt');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Hochbau.Typ','typ','raeumlicheelemnte_hochbau',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Seilbahn_Station.Bautyp','bautyp','raeumlicheelemnte_seilbahn_station',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.UnterhaltsID','unterhaltsid','raeumlicheelemnte_oekologie_trockenmauer',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Genossenschaft_Dokument.Dokument','dokument','raeumlicheelemnte_genossenschaft_dokument','raeumlicheelemnte_dokument');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.WerksID','werksid','raeumlicheelemnte_wasserversorgung_punkt',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Oekologie_Trockenmauer.Geometrie','geometrie','raeumlicheelemnte_oekologie_trockenmauer',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.UnterhaltsID','unterhaltsid','raeumlicheelemnte_oekologie_flaeche',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Genossenschaft_Element.Element_Genossenschaft','element_genossenschaft_raeumlchlmnt_ntw_bdnstrktr_lnie','raeumlicheelemnte_genossenschaft_element','raeumlicheelemnte_entw_bodenstruktur_linie');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Werkeigentum_Element.Werkeigentum','werkeigentum','raeumlicheelemnte_hochbau','raeumlicheelemnte_werkseigentum');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.Bauabnahme_Datum','bauabnahme_datum','raeumlicheelemnte_seilbahn_station',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Genossenschaft_Element.Element_Genossenschaft','element_genossenschaft_raeumlicheelemnte_mlchltng_lkal','raeumlicheelemnte_genossenschaft_element','raeumlicheelemnte_milchleitung_lokal');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.Status_Datum','status_datum','raeumlicheelemnte_wiederherstellung_punkt',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.UnterhaltsID','unterhaltsid','raeumlicheelemnte_bewaesserung_linie',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Werkeigentum_Element.Werkeigentum','werkeigentum','raeumlicheelemnte_wasserversorgung_punkt','raeumlicheelemnte_werkseigentum');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Entw_Bodenstruktur_Linie.Geometrie','geometrie','raeumlicheelemnte_entw_bodenstruktur_linie',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Genossenschaft_Element.Element_Genossenschaft','element_genossenschaft_raeumlicheelemnte_oekolog_flche','raeumlicheelemnte_genossenschaft_element','raeumlicheelemnte_oekologie_flaeche');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.WV_Leitung_Wasserversorgung.Geometrie','geometrie','raeumlicheelemnte_wv_leitung_wasserversorgung',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.Bauabnahme_Datum','bauabnahme_datum','raeumlicheelemnte_ev_linie',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.WerksID','werksid','raeumlicheelemnte_wegebau_linie',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.Status_Datum','status_datum','raeumlicheelemnte_entw_bodenstruktur_pumpwerk',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.EV_Punkt.Geometrie','geometrie','raeumlicheelemnte_ev_punkt',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.WerksID','werksid','raeumlicheelemnte_entw_bodenstruktur_flaeche',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Projekt_Element.Projekt','projekt','raeumlicheelemnte_entw_bodenstruktur_flaeche','raeumlicheelemnte_projekt');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.WerksID','werksid','raeumlicheelemnte_hochbau',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Projekt_Element.Projekt','projekt','raeumlicheelemnte_hochbau','raeumlicheelemnte_projekt');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Seilbahn_Linie.Typ','typ','raeumlicheelemnte_seilbahn_linie',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.Status','astatus','raeumlicheelemnte_seilbahn_station',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Projekt_Element.Projekt','projekt','raeumlicheelemnte_wegebau_linie','raeumlicheelemnte_projekt');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Bewaesserung_Punkt.Geometrie','geometrie','raeumlicheelemnte_bewaesserung_punkt',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Entw_Bodenstruktur_Flaeche.Bautyp','bautyp','raeumlicheelemnte_entw_bodenstruktur_flaeche',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.Status','astatus','raeumlicheelemnte_wasserversorgung_punkt',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Entw_Bodenstruktur_Flaeche.Typ','typ','raeumlicheelemnte_entw_bodenstruktur_flaeche',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Projekt.Name','aname','raeumlicheelemnte_projekt',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.Bauabnahme_Datum','bauabnahme_datum','raeumlicheelemnte_wegebau_linie',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Werkeigentum_Element.Werkeigentum','werkeigentum','raeumlicheelemnte_bewaesserung_punkt','raeumlicheelemnte_werkseigentum');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Projekt_Element.Projekt','projekt','raeumlicheelemnte_oekologie_punkt','raeumlicheelemnte_projekt');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Genossenschaft_Element.Element_Genossenschaft','element_genossenschaft_raeumlicheelemnte_bewssrng_pnkt','raeumlicheelemnte_genossenschaft_element','raeumlicheelemnte_bewaesserung_punkt');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Oekologie_Linie.Typ','typ','raeumlicheelemnte_oekologie_linie',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.WerksID','werksid','raeumlicheelemnte_oekologie_punkt',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Werkeigentum_Element.Werkeigentum','werkeigentum','raeumlicheelemnte_wege_bruecke_lehnenviadukt','raeumlicheelemnte_werkseigentum');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Werkeigentum_Element.Werkeigentum','werkeigentum','raeumlicheelemnte_entw_bodenstruktur_linie','raeumlicheelemnte_werkseigentum');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Genossenschaft_Element.Element_Genossenschaft','element_genossenschaft_raemlchlmnt_wv_tng_wssrvrsrgung','raeumlicheelemnte_genossenschaft_element','raeumlicheelemnte_wv_leitung_wasserversorgung');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.Status','astatus','raeumlicheelemnte_milchleitung_leitung',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GeometryCHLV95_V1.SurfaceStructure.Surface','surface','surfacestructure',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.WerksID','werksid','raeumlicheelemnte_entw_bodenstruktur_linie',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Oekologie_Trockenmauer.Hoehe','hoehe','raeumlicheelemnte_oekologie_trockenmauer',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Oekologie_Linie.Bautyp','bautyp','raeumlicheelemnte_oekologie_linie',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Seilbahn_Station.Typ','typ','raeumlicheelemnte_seilbahn_station',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Werkeigentum_Element.Werkeigentum','werkeigentum','raeumlicheelemnte_ev_linie','raeumlicheelemnte_werkseigentum');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Seilbahn_Linie.Geometrie','geometrie','raeumlicheelemnte_seilbahn_linie',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.Status','astatus','raeumlicheelemnte_wegebau_linie',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Projekt_Element.Projekt','projekt','raeumlicheelemnte_wasserversorgung_punkt','raeumlicheelemnte_projekt');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Wiederherstellung_Punkt.Geometrie','geometrie','raeumlicheelemnte_wiederherstellung_punkt',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Wegebau_Linie.Anteil_LW','anteil_lw','raeumlicheelemnte_wegebau_linie',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Genossenschaft_Element.Element_Genossenschaft','element_genossenschaft_raeumlichelmnt_wdrhrstllng_pnkt','raeumlicheelemnte_genossenschaft_element','raeumlicheelemnte_wiederherstellung_punkt');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Wiederherstellungs_Punkt_Bild.Wiederherstellungs_Punkt','wiederherstellungs_punkt','raeumlicheelemnte_dokument','raeumlicheelemnte_wiederherstellung_punkt');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Genossenschaft.Geometrie','geometrie','raeumlicheelemnte_genossenschaft',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.Bauabnahme_Datum','bauabnahme_datum','raeumlicheelemnte_milchleitung_leitung',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Genossenschaft_Element.Element_Genossenschaft','element_genossenschaft_raeumlicheelemnte_ev_linie','raeumlicheelemnte_genossenschaft_element','raeumlicheelemnte_ev_linie');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Beizugsgebiet_Projekt.Projekt','projekt','raeumlicheelemnte_beizugsgebiet_projekt','raeumlicheelemnte_projekt');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.Status','astatus','raeumlicheelemnte_seilbahn_linie',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Genossenschaft_Element.Element_Genossenschaft','element_genossenschaft_raeumlicheelemnte_klg_trcknmuer','raeumlicheelemnte_genossenschaft_element','raeumlicheelemnte_oekologie_trockenmauer');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.WerksID','werksid','raeumlicheelemnte_wege_bruecke_lehnenviadukt',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.Bauabnahme_Datum','bauabnahme_datum','raeumlicheelemnte_seilbahn_linie',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Projekt_Element.Projekt','projekt','raeumlicheelemnte_bewaesserung_punkt','raeumlicheelemnte_projekt');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Werkeigentum_Element.Werkeigentum','werkeigentum','raeumlicheelemnte_oekologie_trockenmauer','raeumlicheelemnte_werkseigentum');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.Status_Datum','status_datum','raeumlicheelemnte_wege_bruecke_lehnenviadukt',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Hochbau.Geometrie','geometrie','raeumlicheelemnte_hochbau',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.WerksID','werksid','raeumlicheelemnte_seilbahn_station',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Dokument.Typ','typ','raeumlicheelemnte_dokument',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Projekt_Element.Projekt','projekt','raeumlicheelemnte_seilbahn_station','raeumlicheelemnte_projekt');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Genossenschaft_Element.Element_Genossenschaft','element_genossenschaft_raeumlichlmnt_wg_brck_lhnnvdukt','raeumlicheelemnte_genossenschaft_element','raeumlicheelemnte_wege_bruecke_lehnenviadukt');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Genossenschaft.Bemerkung','bemerkung','raeumlicheelemnte_genossenschaft',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Wegebau_Linie.Geometrie','geometrie','raeumlicheelemnte_wegebau_linie',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Werkeigentum_Element.Werkeigentum','werkeigentum','raeumlicheelemnte_oekologie_punkt','raeumlicheelemnte_werkseigentum');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.WerksID','werksid','raeumlicheelemnte_bewaesserung_punkt',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.WerksID','werksid','raeumlicheelemnte_oekologie_trockenmauer',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.Bauabnahme_Datum','bauabnahme_datum','raeumlicheelemnte_wasserversorgung_punkt',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.UnterhaltsID','unterhaltsid','raeumlicheelemnte_oekologie_punkt',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Entw_Bodenstruktur_Flaeche.Geometrie','geometrie','raeumlicheelemnte_entw_bodenstruktur_flaeche',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Projekt_Element.Projekt','projekt','raeumlicheelemnte_ev_linie','raeumlicheelemnte_projekt');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Werkeigentum_Element.Werkeigentum','werkeigentum','raeumlicheelemnte_seilbahn_station','raeumlicheelemnte_werkseigentum');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.EV_Linie.Typ','typ','raeumlicheelemnte_ev_linie',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.Status_Datum','status_datum','raeumlicheelemnte_entw_bodenstruktur_linie',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.UnterhaltsID','unterhaltsid','raeumlicheelemnte_wege_bruecke_lehnenviadukt',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Wege_Bruecke_Lehnenviadukt.Fahrbahnbreite','fahrbahnbreite','raeumlicheelemnte_wege_bruecke_lehnenviadukt',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GeometryCHLV95_V1.MultiLine.Lines','multiline_lines','linestructure','multiline');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.WV_Leitung_Wasserversorgung.Bautyp','bautyp','raeumlicheelemnte_wv_leitung_wasserversorgung',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Genossenschaft_Element.Element_Genossenschaft','element_genossenschaft_raeumlichlmnt_bw_flchn_bwssrung','raeumlicheelemnte_genossenschaft_element','raeumlicheelemnte_bew_flaechen_bewaesserung');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.Stand_Gueterregulierung.Stand_Gueterregulierung.Stand','stand','stand_gutrrglrung_stand_gueterregulierung',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.UnterhaltsID','unterhaltsid','raeumlicheelemnte_seilbahn_station',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Wegebau_Linie.Typ','typ','raeumlicheelemnte_wegebau_linie',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.WerksID','werksid','raeumlicheelemnte_ev_linie',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Wege_Bruecke_Lehnenviadukt.Geometrie','geometrie','raeumlicheelemnte_wege_bruecke_lehnenviadukt',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Wege_Bruecke_Lehnenviadukt.Laenge','laenge','raeumlicheelemnte_wege_bruecke_lehnenviadukt',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Oekologie_Trockenmauer.Bautyp','bautyp','raeumlicheelemnte_oekologie_trockenmauer',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.EV_Punkt','ch.ehi.ili2db.inheritance','newAndSubClass');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('GeometryCHLV95_V1.MultiSurface','ch.ehi.ili2db.inheritance','newAndSubClass');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Entw_Bodenstruktur_Linie','ch.ehi.ili2db.inheritance','newAndSubClass');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Beizugsgebiet.Geometrie','ch.ehi.ili2db.multiSurfaceTrafo','coalesce');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Oekologie_Linie','ch.ehi.ili2db.inheritance','newAndSubClass');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Bewaesserung_Linie.Geometrie','ch.ehi.ili2db.multiLineTrafo','coalesce');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.EV_Linie','ch.ehi.ili2db.inheritance','newAndSubClass');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Oekologie_Punkt','ch.ehi.ili2db.inheritance','newAndSubClass');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Bew_Flaechen_Bewaesserung.Geometrie','ch.ehi.ili2db.multiSurfaceTrafo','coalesce');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Seilbahn_Station','ch.ehi.ili2db.inheritance','newAndSubClass');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Bewaesserung_Linie','ch.ehi.ili2db.inheritance','newAndSubClass');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Seilbahn_Linie.Geometrie','ch.ehi.ili2db.multiLineTrafo','coalesce');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Bewaesserung_Punkt','ch.ehi.ili2db.inheritance','newAndSubClass');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Milchleitung_Leitung','ch.ehi.ili2db.inheritance','newAndSubClass');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Entw_Bodenstruktur_Pumpwerk','ch.ehi.ili2db.inheritance','newAndSubClass');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Entw_Bodenstruktur_Flaeche','ch.ehi.ili2db.inheritance','newAndSubClass');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.WV_Leitung_Wasserversorgung','ch.ehi.ili2db.inheritance','newAndSubClass');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element','ch.ehi.ili2db.inheritance','subClass');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Milchleitung_Leitung.Geometrie','ch.ehi.ili2db.multiLineTrafo','coalesce');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Projekt','ch.ehi.ili2db.inheritance','newAndSubClass');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Entw_Bodenstruktur_Flaeche.Geometrie','ch.ehi.ili2db.multiSurfaceTrafo','coalesce');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Oekologie_Trockenmauer','ch.ehi.ili2db.inheritance','newAndSubClass');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Beizugsgebiet','ch.ehi.ili2db.inheritance','newAndSubClass');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.WV_Leitung_Wasserversorgung.Geometrie','ch.ehi.ili2db.multiLineTrafo','coalesce');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('SO_ALW_Strukturverbesserungen_20190912.Stand_Gueterregulierung.Stand_Gueterregulierung','ch.ehi.ili2db.inheritance','newAndSubClass');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Genossenschaft_Dokument','ch.ehi.ili2db.inheritance','newAndSubClass');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Seilbahn_Linie','ch.ehi.ili2db.inheritance','newAndSubClass');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Wegebau_Linie','ch.ehi.ili2db.inheritance','newAndSubClass');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Oekologie_Linie.Geometrie','ch.ehi.ili2db.multiLineTrafo','coalesce');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Wasserversorgung_Punkt','ch.ehi.ili2db.inheritance','newAndSubClass');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('GeometryCHLV95_V1.MultiLine','ch.ehi.ili2db.inheritance','newAndSubClass');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Wiederherstellung_Punkt','ch.ehi.ili2db.inheritance','newAndSubClass');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Oekologie_Flaeche','ch.ehi.ili2db.inheritance','newAndSubClass');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Oekologie_Flaeche.Geometrie','ch.ehi.ili2db.multiSurfaceTrafo','coalesce');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Genossenschaft','ch.ehi.ili2db.inheritance','newAndSubClass');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Genossenschaft.Geometrie','ch.ehi.ili2db.multiSurfaceTrafo','coalesce');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Werkseigentum','ch.ehi.ili2db.inheritance','newAndSubClass');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Milchleitung_Lokal','ch.ehi.ili2db.inheritance','newAndSubClass');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Projekt_Element','ch.ehi.ili2db.inheritance','embedded');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Genossenschaft_Element','ch.ehi.ili2db.inheritance','newAndSubClass');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Werkeigentum_Element','ch.ehi.ili2db.inheritance','embedded');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Wegebau_Linie.Geometrie','ch.ehi.ili2db.multiLineTrafo','coalesce');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.EV_Linie.Geometrie','ch.ehi.ili2db.multiLineTrafo','coalesce');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Hochbau','ch.ehi.ili2db.inheritance','newAndSubClass');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Beizugsgebiet_Projekt','ch.ehi.ili2db.inheritance','newAndSubClass');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Entw_Bodenstruktur_Linie.Geometrie','ch.ehi.ili2db.multiLineTrafo','coalesce');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Dokument','ch.ehi.ili2db.inheritance','newAndSubClass');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('GeometryCHLV95_V1.LineStructure','ch.ehi.ili2db.inheritance','newAndSubClass');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Bew_Flaechen_Bewaesserung','ch.ehi.ili2db.inheritance','newAndSubClass');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Wege_Bruecke_Lehnenviadukt','ch.ehi.ili2db.inheritance','newAndSubClass');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('GeometryCHLV95_V1.SurfaceStructure','ch.ehi.ili2db.inheritance','newAndSubClass');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Wiederherstellungs_Punkt_Bild','ch.ehi.ili2db.inheritance','embedded');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Oekologie_Trockenmauer.Geometrie','ch.ehi.ili2db.multiLineTrafo','coalesce');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('GeometryCHLV95_V1.LineStructure',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.EV_Linie','SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Projekt_Element',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Dokument',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Milchleitung_Lokal','SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Oekologie_Trockenmauer','SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.EV_Punkt','SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Beizugsgebiet_Projekt',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Wasserversorgung_Punkt','SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('GeometryCHLV95_V1.SurfaceStructure',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Milchleitung_Leitung','SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Entw_Bodenstruktur_Flaeche','SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('GeometryCHLV95_V1.MultiSurface',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('GeometryCHLV95_V1.MultiLine',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Genossenschaft',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('SO_ALW_Strukturverbesserungen_20190912.Stand_Gueterregulierung.Stand_Gueterregulierung',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Oekologie_Punkt','SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Entw_Bodenstruktur_Pumpwerk','SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Entw_Bodenstruktur_Linie','SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Werkseigentum',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Oekologie_Flaeche','SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Genossenschaft_Dokument',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Oekologie_Linie','SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Bewaesserung_Punkt','SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Genossenschaft_Element',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Wege_Bruecke_Lehnenviadukt','SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Wegebau_Linie','SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Bewaesserung_Linie','SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Projekt',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.WV_Leitung_Wasserversorgung','SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Seilbahn_Linie','SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Bew_Flaechen_Bewaesserung','SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Wiederherstellung_Punkt','SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Werkeigentum_Element',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Wiederherstellungs_Punkt_Bild',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Hochbau','SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Beizugsgebiet',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Seilbahn_Station','SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element');
INSERT INTO alw_strukturverbesserungen.seilbahnen_linien (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Monorail_u_aehnliche',0,'Monorail u aehnliche','0',NULL);
INSERT INTO alw_strukturverbesserungen.seilbahnen_linien (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Materialseilbahn',1,'Materialseilbahn','0',NULL);
INSERT INTO alw_strukturverbesserungen.seilbahnen_linien (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Personenseilbahn',2,'Personenseilbahn','0',NULL);
INSERT INTO alw_strukturverbesserungen.seilbahnen_linien (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Abbruch_Seilbahn',3,'Abbruch Seilbahn','0',NULL);
INSERT INTO alw_strukturverbesserungen.genossenschaften (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Flurgenossenschaft',0,'Flurgenossenschaft','0',NULL);
INSERT INTO alw_strukturverbesserungen.genossenschaften (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Unterhaltsgenossenschaft',1,'Unterhaltsgenossenschaft','0',NULL);
INSERT INTO alw_strukturverbesserungen.genossenschaften (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Bewaesserungsgenossenschaft',2,'Bewaesserungsgenossenschaft','0',NULL);
INSERT INTO alw_strukturverbesserungen.raeumlichelmnte_wege_bruecke_lehnenviadukt_material (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Beton',0,'Beton','0',NULL);
INSERT INTO alw_strukturverbesserungen.raeumlichelmnte_wege_bruecke_lehnenviadukt_material (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Holz',1,'Holz','0',NULL);
INSERT INTO alw_strukturverbesserungen.raeumlichelmnte_wege_bruecke_lehnenviadukt_material (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'uebrige',2,'uebrige','0',NULL);
INSERT INTO alw_strukturverbesserungen.wiederherstellung_punkte (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Holzkasten',0,'Holzkasten','0',NULL);
INSERT INTO alw_strukturverbesserungen.wiederherstellung_punkte (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Weitere_Boeschungssicherungsmassnahmen',1,'Weitere Boeschungssicherungsmassnahmen','0',NULL);
INSERT INTO alw_strukturverbesserungen.wasserversorgung_punkte (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Grundwasserfassung',0,'Grundwasserfassung','0',NULL);
INSERT INTO alw_strukturverbesserungen.wasserversorgung_punkte (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Quellfassung_inkl_Brunnenstube',1,'Quellfassung inkl Brunnenstube','0',NULL);
INSERT INTO alw_strukturverbesserungen.wasserversorgung_punkte (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Traenkeanlage',2,'Traenkeanlage','0',NULL);
INSERT INTO alw_strukturverbesserungen.wasserversorgung_punkte (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Aufbereitungsanlage',3,'Aufbereitungsanlage','0',NULL);
INSERT INTO alw_strukturverbesserungen.wasserversorgung_punkte (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Pumpwerk',4,'Pumpwerk','0',NULL);
INSERT INTO alw_strukturverbesserungen.wasserversorgung_punkte (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Fernwirkanlage',5,'Fernwirkanlage','0',NULL);
INSERT INTO alw_strukturverbesserungen.wasserversorgung_punkte (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Reservoir',6,'Reservoir','0',NULL);
INSERT INTO alw_strukturverbesserungen.bewaesserung_punkte (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Fassung_Entsander',0,'Fassung Entsander','0',NULL);
INSERT INTO alw_strukturverbesserungen.bewaesserung_punkte (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Pumpwerk',1,'Pumpwerk','0',NULL);
INSERT INTO alw_strukturverbesserungen.bewaesserung_punkte (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Speicher',2,'Speicher','0',NULL);
INSERT INTO alw_strukturverbesserungen.hochbau_punkte (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Anlage_fuer_gewerblichen_Kleinbetrieb',0,'Anlage fuer gewerblichen Kleinbetrieb','0',NULL);
INSERT INTO alw_strukturverbesserungen.hochbau_punkte (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Gemeinschaftliche_Anlage_fuer_die_Verabeitung_Lagerung_und_Verkauf',1,'Gemeinschaftliche Anlage fuer die Verabeitung Lagerung und Verkauf','0',NULL);
INSERT INTO alw_strukturverbesserungen.hochbau_punkte (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Gemeinschaftliche_Anlage_fuer_die_Milchverarbeitung',2,'Gemeinschaftliche Anlage fuer die Milchverarbeitung','0',NULL);
INSERT INTO alw_strukturverbesserungen.hochbau_punkte (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Oekonomiegebaeude',3,'Oekonomiegebaeude','0',NULL);
INSERT INTO alw_strukturverbesserungen.hochbau_punkte (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Alpgebaeude',4,'Alpgebaeude','0',NULL);
INSERT INTO alw_strukturverbesserungen.hochbau_punkte (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Gemeinschaftliche_Anlage_zur_Produktion_erneuerbarer_Energie_aus_Biomasse',5,'Gemeinschaftliche Anlage zur Produktion erneuerbarer Energie aus Biomasse','0',NULL);
INSERT INTO alw_strukturverbesserungen.hochbau_punkte (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Anlage_fuer_produzierenden_Gartenbaubetrieb',6,'Anlage fuer produzierenden Gartenbaubetrieb','0',NULL);
INSERT INTO alw_strukturverbesserungen.hochbau_punkte (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Anlage_zur_Diversifizierung',7,'Anlage zur Diversifizierung','0',NULL);
INSERT INTO alw_strukturverbesserungen.hochbau_punkte (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Anlage_fuer_einheimischen_Fischfang_und_Fischzucht',8,'Anlage fuer einheimischen Fischfang und Fischzucht','0',NULL);
INSERT INTO alw_strukturverbesserungen.hochbau_punkte (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Anlage_fuer_Spezialkulturen',9,'Anlage fuer Spezialkulturen','0',NULL);
INSERT INTO alw_strukturverbesserungen.hochbau_punkte (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Gefluegelstall',10,'Gefluegelstall','0',NULL);
INSERT INTO alw_strukturverbesserungen.hochbau_punkte (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Schweinestall',11,'Schweinestall','0',NULL);
INSERT INTO alw_strukturverbesserungen.hochbau_punkte (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Wohngebaeude',12,'Wohngebaeude','0',NULL);
INSERT INTO alw_strukturverbesserungen.hochbau_punkte (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'PRE_andere_Gebaeude_und_Einrichtungen',13,'PRE andere Gebaeude und Einrichtungen','0',NULL);
INSERT INTO alw_strukturverbesserungen.entw_bodenstruktur_linien (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Hauptleitung_Ableitung',0,'Hauptleitung Ableitung','0',NULL);
INSERT INTO alw_strukturverbesserungen.entw_bodenstruktur_linien (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Drainageleitung_perforiert',1,'Drainageleitung perforiert','0',NULL);
INSERT INTO alw_strukturverbesserungen.entw_bodenstruktur_linien (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Entwaesserungsgraben',2,'Entwaesserungsgraben','0',NULL);
INSERT INTO alw_strukturverbesserungen.wege (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Wanderweg_bauliche_Massnahmen',0,'Wanderweg bauliche Massnahmen','0',NULL);
INSERT INTO alw_strukturverbesserungen.wege (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Viehtrieb_Reitweg',1,'Viehtrieb Reitweg','0',NULL);
INSERT INTO alw_strukturverbesserungen.wege (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Tunnel',2,'Tunnel','0',NULL);
INSERT INTO alw_strukturverbesserungen.wege (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Aufhebung_von_Wegen',3,'Aufhebung von Wegen','0',NULL);
INSERT INTO alw_strukturverbesserungen.wege (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Rasenweg',4,'Rasenweg','0',NULL);
INSERT INTO alw_strukturverbesserungen.wege (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Spurweg_Rasengitter',5,'Spurweg Rasengitter','0',NULL);
INSERT INTO alw_strukturverbesserungen.wege (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Spurweg_Beton',6,'Spurweg Beton','0',NULL);
INSERT INTO alw_strukturverbesserungen.wege (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Spurweg_Bitumen',7,'Spurweg Bitumen','0',NULL);
INSERT INTO alw_strukturverbesserungen.wege (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Belagseinbau_auf_Kiesweg',8,'Belagseinbau auf Kiesweg','0',NULL);
INSERT INTO alw_strukturverbesserungen.wege (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Betonweg',9,'Betonweg','0',NULL);
INSERT INTO alw_strukturverbesserungen.wege (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Bituminoeser_Weg',10,'Bituminoeser Weg','0',NULL);
INSERT INTO alw_strukturverbesserungen.wege (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Kiesweg',11,'Kiesweg','0',NULL);
INSERT INTO alw_strukturverbesserungen.entw_bodenstruktur_flaechen (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Rutschhangstabiliserung',0,'Rutschhangstabiliserung','0',NULL);
INSERT INTO alw_strukturverbesserungen.entw_bodenstruktur_flaechen (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Entwaesserung_FFF',1,'Entwaesserung FFF','0',NULL);
INSERT INTO alw_strukturverbesserungen.entw_bodenstruktur_flaechen (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Entwaesserung_uebrige_Flaechen',2,'Entwaesserung uebrige Flaechen','0',NULL);
INSERT INTO alw_strukturverbesserungen.entw_bodenstruktur_flaechen (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Aufbringung_Humus',3,'Aufbringung Humus','0',NULL);
INSERT INTO alw_strukturverbesserungen.entw_bodenstruktur_flaechen (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Bodenstrukturverbesserung',4,'Bodenstrukturverbesserung','0',NULL);
INSERT INTO alw_strukturverbesserungen.entw_bodenstruktur_flaechen (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Wiederherstellung_Kulturland',5,'Wiederherstellung Kulturland','0',NULL);
INSERT INTO alw_strukturverbesserungen.technische_schwierigkeit (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'nicht_relevant',0,'nicht relevant','0',NULL);
INSERT INTO alw_strukturverbesserungen.technische_schwierigkeit (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'gering',1,'gering','0',NULL);
INSERT INTO alw_strukturverbesserungen.technische_schwierigkeit (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'maessig',2,'maessig','0',NULL);
INSERT INTO alw_strukturverbesserungen.technische_schwierigkeit (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'gross',3,'gross','0',NULL);
INSERT INTO alw_strukturverbesserungen.oekologie_linien (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Revitalisierung_Gewaesser',0,'Revitalisierung Gewaesser','0',NULL);
INSERT INTO alw_strukturverbesserungen.oekologie_linien (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Ausdolung_Gewaesser',1,'Ausdolung Gewaesser','0',NULL);
INSERT INTO alw_strukturverbesserungen.oekologie_linien (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Hecke',2,'Hecke','0',NULL);
INSERT INTO alw_strukturverbesserungen.oekologie_linien (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Waldrandaufwertung',3,'Waldrandaufwertung','0',NULL);
INSERT INTO alw_strukturverbesserungen.oekologie_linien (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Bach_und_Ufervegetation',4,'Bach und Ufervegetation','0',NULL);
INSERT INTO alw_strukturverbesserungen.funktionstyp (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Nebenwege_nicht_fahrbar',0,'Nebenwege nicht fahrbar','0',NULL);
INSERT INTO alw_strukturverbesserungen.funktionstyp (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Nebenwege_fahrbar',1,'Nebenwege fahrbar','0',NULL);
INSERT INTO alw_strukturverbesserungen.funktionstyp (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Uebrige_Hauptwege',2,'Uebrige Hauptwege','0',NULL);
INSERT INTO alw_strukturverbesserungen.funktionstyp (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Hofzufahrten',3,'Hofzufahrten','0',NULL);
INSERT INTO alw_strukturverbesserungen.funktionstyp (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Berghofzufahrten',4,'Berghofzufahrten','0',NULL);
INSERT INTO alw_strukturverbesserungen.elektrizitaet_punkte (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Trafostation',0,'Trafostation','0',NULL);
INSERT INTO alw_strukturverbesserungen.elektrizitaet_punkte (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Stromerzeugung',1,'Stromerzeugung','0',NULL);
INSERT INTO alw_strukturverbesserungen.oekologie_punkte (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Einzelbaum',0,'Einzelbaum','0',NULL);
INSERT INTO alw_strukturverbesserungen.oekologie_punkte (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Andere_Massnahme',1,'Andere Massnahme','0',NULL);
INSERT INTO alw_strukturverbesserungen.bewaesserung_flaechen (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Tropfen_Mikrobewaesserung',0,'Tropfen Mikrobewaesserung','0',NULL);
INSERT INTO alw_strukturverbesserungen.bewaesserung_flaechen (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Beregnungsanlage',1,'Beregnungsanlage','0',NULL);
INSERT INTO alw_strukturverbesserungen.bewaesserung_flaechen (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Traditionelle_Berieselung',2,'Traditionelle Berieselung','0',NULL);
INSERT INTO alw_strukturverbesserungen.elektrizitaet_linien (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Kabel_unterirdisch',0,'Kabel unterirdisch','0',NULL);
INSERT INTO alw_strukturverbesserungen.elektrizitaet_linien (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Abbruch_Leitung',1,'Abbruch Leitung','0',NULL);
INSERT INTO alw_strukturverbesserungen.elektrizitaet_linien (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Freileitung',2,'Freileitung','0',NULL);
INSERT INTO alw_strukturverbesserungen.bautyp (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Neubau',0,'Neubau','0',NULL);
INSERT INTO alw_strukturverbesserungen.bautyp (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'PWI',1,'PWI','0',NULL);
INSERT INTO alw_strukturverbesserungen.bautyp (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Ausbau_Ersatz',2,'Ausbau Ersatz','0',NULL);
INSERT INTO alw_strukturverbesserungen.bautyp (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Wiederherstellung',3,'Wiederherstellung','0',NULL);
INSERT INTO alw_strukturverbesserungen.seilbahnen_punkte (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Station',0,'Station','0',NULL);
INSERT INTO alw_strukturverbesserungen.seilbahnen_punkte (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Abbruch_Station',1,'Abbruch Station','0',NULL);
INSERT INTO alw_strukturverbesserungen.astatus (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'projektiert',0,'projektiert','0',NULL);
INSERT INTO alw_strukturverbesserungen.astatus (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'in_Ausfuehrung',1,'in Ausfuehrung','0',NULL);
INSERT INTO alw_strukturverbesserungen.astatus (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'ausgefuehrt',2,'ausgefuehrt','0',NULL);
INSERT INTO alw_strukturverbesserungen.astatus (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'sistiert',3,'sistiert','0',NULL);
INSERT INTO alw_strukturverbesserungen.astatus (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'untergegangen',4,'untergegangen','0',NULL);
INSERT INTO alw_strukturverbesserungen.astatus (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'unbekannt',5,'unbekannt','0',NULL);
INSERT INTO alw_strukturverbesserungen.bewaesserung_linien (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Stollen',0,'Stollen','0',NULL);
INSERT INTO alw_strukturverbesserungen.bewaesserung_linien (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Kanal',1,'Kanal','0',NULL);
INSERT INTO alw_strukturverbesserungen.bewaesserung_linien (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Verteilleitung',2,'Verteilleitung','0',NULL);
INSERT INTO alw_strukturverbesserungen.bewaesserung_linien (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Zuleitung_Bewaesserung',3,'Zuleitung Bewaesserung','0',NULL);
INSERT INTO alw_strukturverbesserungen.oekologische_flaechen (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Biotop',0,'Biotop','0',NULL);
INSERT INTO alw_strukturverbesserungen.oekologische_flaechen (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Andere_Massnahme',1,'Andere Massnahme','0',NULL);
INSERT INTO alw_strukturverbesserungen.oekologische_flaechen (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Perimeter_Vernetzungsprojekt',2,'Perimeter Vernetzungsprojekt','0',NULL);
INSERT INTO alw_strukturverbesserungen.oekologische_flaechen (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Hochstammobstanlagen',3,'Hochstammobstanlagen','0',NULL);
INSERT INTO alw_strukturverbesserungen.dokumententyp (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Bericht',0,'Bericht','0',NULL);
INSERT INTO alw_strukturverbesserungen.dokumententyp (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Unterhaltsreglement',1,'Unterhaltsreglement','0',NULL);
INSERT INTO alw_strukturverbesserungen.dokumententyp (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Statuten',2,'Statuten','0',NULL);
INSERT INTO alw_strukturverbesserungen.dokumententyp (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Regierungsratsbeschluss',3,'Regierungsratsbeschluss','0',NULL);
INSERT INTO alw_strukturverbesserungen.dokumententyp (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Bild',4,'Bild','0',NULL);
INSERT INTO alw_strukturverbesserungen.projekt (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'PRE',0,'PRE','0',NULL);
INSERT INTO alw_strukturverbesserungen.projekt (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Landumlegung',1,'Landumlegung','0',NULL);
INSERT INTO alw_strukturverbesserungen.projekt (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Uebrige',2,'Uebrige','0',NULL);
INSERT INTO alw_strukturverbesserungen.projekt (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Projektinitiative',3,'Projektinitiative','0',NULL);
INSERT INTO alw_strukturverbesserungen.projekt (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Grundlagen_generell',4,'Grundlagen generell','0',NULL);
INSERT INTO alw_strukturverbesserungen.projekt (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Landwirtschaftliche_Planung',5,'Landwirtschaftliche Planung','0',NULL);
INSERT INTO alw_strukturverbesserungen.projekt (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Gemeinschaftliche_Initiative_zur_Senkung_der_Produktionskosten',6,'Gemeinschaftliche Initiative zur Senkung der Produktionskosten','0',NULL);
INSERT INTO alw_strukturverbesserungen.oekologie_trockenmauern (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'freistehende_Trockenmauer',0,'freistehende Trockenmauer','0',NULL);
INSERT INTO alw_strukturverbesserungen.oekologie_trockenmauern (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Terrasse_Trockenmauer',1,'Terrasse Trockenmauer','0',NULL);
INSERT INTO alw_strukturverbesserungen.beizugsgebiete (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Alter_Bestand',0,'Alter Bestand','0',NULL);
INSERT INTO alw_strukturverbesserungen.beizugsgebiete (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Neuer_Bestand',1,'Neuer Bestand','0',NULL);
INSERT INTO alw_strukturverbesserungen.beizugsgebiete (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'uebrige',2,'uebrige','0',NULL);
INSERT INTO alw_strukturverbesserungen.stand (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Regulierungsbeduerftige_Flaechen_vorhanden',0,'Regulierungsbeduerftige Flaechen vorhanden','0',NULL);
INSERT INTO alw_strukturverbesserungen.stand (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Umfassende_SV_Massnahmen_in_Arbeit',1,'Umfassende SV Massnahmen in Arbeit','0',NULL);
INSERT INTO alw_strukturverbesserungen.stand (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Gueterregulierung_in_Arbeit',2,'Gueterregulierung in Arbeit','0',NULL);
INSERT INTO alw_strukturverbesserungen.stand (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Gueterregulierung_ausgefuehrt',3,'Gueterregulierung ausgefuehrt','0',NULL);
INSERT INTO alw_strukturverbesserungen.stand (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Keine_Gueterregulierung_notwendig',4,'Keine Gueterregulierung notwendig','0',NULL);
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_oekologie_trockenmauer',NULL,'hoehe','ch.ehi.ili2db.unit','m');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_entw_bodenstruktur_pumpwerk',NULL,'projekt','ch.ehi.ili2db.foreignKey','raeumlicheelemnte_projekt');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_milchleitung_leitung',NULL,'werkeigentum','ch.ehi.ili2db.foreignKey','raeumlicheelemnte_werkseigentum');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_bewaesserung_punkt',NULL,'projekt','ch.ehi.ili2db.foreignKey','raeumlicheelemnte_projekt');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_bewaesserung_linie',NULL,'geometrie','ch.ehi.ili2db.coordDimension','2');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_bewaesserung_linie',NULL,'geometrie','ch.ehi.ili2db.c1Max','2870000.000');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_bewaesserung_linie',NULL,'geometrie','ch.ehi.ili2db.c2Max','1310000.000');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_bewaesserung_linie',NULL,'geometrie','ch.ehi.ili2db.geomType','MULTILINESTRING');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_bewaesserung_linie',NULL,'geometrie','ch.ehi.ili2db.c1Min','2460000.000');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_bewaesserung_linie',NULL,'geometrie','ch.ehi.ili2db.c2Min','1045000.000');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_bewaesserung_linie',NULL,'geometrie','ch.ehi.ili2db.srid','2056');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_genossenschaft_element',NULL,'element_genossenschaft_raeumlicheelemnte_bewssrng_lnie','ch.ehi.ili2db.foreignKey','raeumlicheelemnte_bewaesserung_linie');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_wegebau_linie',NULL,'werkeigentum','ch.ehi.ili2db.foreignKey','raeumlicheelemnte_werkseigentum');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_wv_leitung_wasserversorgung',NULL,'projekt','ch.ehi.ili2db.foreignKey','raeumlicheelemnte_projekt');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_ev_linie',NULL,'projekt','ch.ehi.ili2db.foreignKey','raeumlicheelemnte_projekt');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_entw_bodenstruktur_linie',NULL,'werkeigentum','ch.ehi.ili2db.foreignKey','raeumlicheelemnte_werkseigentum');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_genossenschaft_element',NULL,'element_genossenschaft_raeumlicheelemnte_mlchltng_lkal','ch.ehi.ili2db.foreignKey','raeumlicheelemnte_milchleitung_lokal');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('linestructure',NULL,'line','ch.ehi.ili2db.coordDimension','2');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('linestructure',NULL,'line','ch.ehi.ili2db.c1Max','2870000.000');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('linestructure',NULL,'line','ch.ehi.ili2db.c2Max','1310000.000');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('linestructure',NULL,'line','ch.ehi.ili2db.geomType','LINESTRING');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('linestructure',NULL,'line','ch.ehi.ili2db.c1Min','2460000.000');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('linestructure',NULL,'line','ch.ehi.ili2db.c2Min','1045000.000');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('linestructure',NULL,'line','ch.ehi.ili2db.srid','2056');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_hochbau',NULL,'werkeigentum','ch.ehi.ili2db.foreignKey','raeumlicheelemnte_werkseigentum');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_wege_bruecke_lehnenviadukt',NULL,'werkeigentum','ch.ehi.ili2db.foreignKey','raeumlicheelemnte_werkseigentum');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_milchleitung_lokal',NULL,'werkeigentum','ch.ehi.ili2db.foreignKey','raeumlicheelemnte_werkseigentum');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_projekt',NULL,'geometrie','ch.ehi.ili2db.coordDimension','2');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_projekt',NULL,'geometrie','ch.ehi.ili2db.c1Max','2870000.000');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_projekt',NULL,'geometrie','ch.ehi.ili2db.c2Max','1310000.000');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_projekt',NULL,'geometrie','ch.ehi.ili2db.geomType','POINT');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_projekt',NULL,'geometrie','ch.ehi.ili2db.c1Min','2460000.000');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_projekt',NULL,'geometrie','ch.ehi.ili2db.c2Min','1045000.000');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_projekt',NULL,'geometrie','ch.ehi.ili2db.srid','2056');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_wege_bruecke_lehnenviadukt',NULL,'tonnage','ch.ehi.ili2db.unit','t');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_wasserversorgung_punkt',NULL,'geometrie','ch.ehi.ili2db.coordDimension','2');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_wasserversorgung_punkt',NULL,'geometrie','ch.ehi.ili2db.c1Max','2870000.000');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_wasserversorgung_punkt',NULL,'geometrie','ch.ehi.ili2db.c2Max','1310000.000');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_wasserversorgung_punkt',NULL,'geometrie','ch.ehi.ili2db.geomType','POINT');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_wasserversorgung_punkt',NULL,'geometrie','ch.ehi.ili2db.c1Min','2460000.000');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_wasserversorgung_punkt',NULL,'geometrie','ch.ehi.ili2db.c2Min','1045000.000');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_wasserversorgung_punkt',NULL,'geometrie','ch.ehi.ili2db.srid','2056');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_wiederherstellung_punkt',NULL,'projekt','ch.ehi.ili2db.foreignKey','raeumlicheelemnte_projekt');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_entw_bodenstruktur_flaeche',NULL,'projekt','ch.ehi.ili2db.foreignKey','raeumlicheelemnte_projekt');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_milchleitung_lokal',NULL,'geometrie','ch.ehi.ili2db.coordDimension','2');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_milchleitung_lokal',NULL,'geometrie','ch.ehi.ili2db.c1Max','2870000.000');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_milchleitung_lokal',NULL,'geometrie','ch.ehi.ili2db.c2Max','1310000.000');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_milchleitung_lokal',NULL,'geometrie','ch.ehi.ili2db.geomType','POINT');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_milchleitung_lokal',NULL,'geometrie','ch.ehi.ili2db.c1Min','2460000.000');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_milchleitung_lokal',NULL,'geometrie','ch.ehi.ili2db.c2Min','1045000.000');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_milchleitung_lokal',NULL,'geometrie','ch.ehi.ili2db.srid','2056');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_genossenschaft_element',NULL,'element_genossenschaft_raeumlichlmnt_bw_flchn_bwssrung','ch.ehi.ili2db.foreignKey','raeumlicheelemnte_bew_flaechen_bewaesserung');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_beizugsgebiet',NULL,'geometrie','ch.ehi.ili2db.coordDimension','2');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_beizugsgebiet',NULL,'geometrie','ch.ehi.ili2db.c1Max','2870000.000');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_beizugsgebiet',NULL,'geometrie','ch.ehi.ili2db.c2Max','1310000.000');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_beizugsgebiet',NULL,'geometrie','ch.ehi.ili2db.geomType','MULTIPOLYGON');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_beizugsgebiet',NULL,'geometrie','ch.ehi.ili2db.c1Min','2460000.000');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_beizugsgebiet',NULL,'geometrie','ch.ehi.ili2db.c2Min','1045000.000');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_beizugsgebiet',NULL,'geometrie','ch.ehi.ili2db.srid','2056');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_genossenschaft_element',NULL,'element_genossenschaft_raeumlicheelemnte_klg_trcknmuer','ch.ehi.ili2db.foreignKey','raeumlicheelemnte_oekologie_trockenmauer');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_oekologie_flaeche',NULL,'projekt','ch.ehi.ili2db.foreignKey','raeumlicheelemnte_projekt');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_genossenschaft_element',NULL,'element_genossenschaft_raeumlichelmnt_wssrvrsrgng_pnkt','ch.ehi.ili2db.foreignKey','raeumlicheelemnte_wasserversorgung_punkt');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_genossenschaft_element',NULL,'element_genossenschaft_raeumlicheelemnte_selbhn_sttion','ch.ehi.ili2db.foreignKey','raeumlicheelemnte_seilbahn_station');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_genossenschaft_element',NULL,'element_genossenschaft_raeumlicheelemnte_oekolog_flche','ch.ehi.ili2db.foreignKey','raeumlicheelemnte_oekologie_flaeche');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_hochbau',NULL,'geometrie','ch.ehi.ili2db.coordDimension','2');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_hochbau',NULL,'geometrie','ch.ehi.ili2db.c1Max','2870000.000');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_hochbau',NULL,'geometrie','ch.ehi.ili2db.c2Max','1310000.000');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_hochbau',NULL,'geometrie','ch.ehi.ili2db.geomType','POINT');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_hochbau',NULL,'geometrie','ch.ehi.ili2db.c1Min','2460000.000');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_hochbau',NULL,'geometrie','ch.ehi.ili2db.c2Min','1045000.000');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_hochbau',NULL,'geometrie','ch.ehi.ili2db.srid','2056');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_genossenschaft_element',NULL,'element_genossenschaft_raeumlicheelemnte_seilbahn_lnie','ch.ehi.ili2db.foreignKey','raeumlicheelemnte_seilbahn_linie');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_wege_bruecke_lehnenviadukt',NULL,'geometrie','ch.ehi.ili2db.coordDimension','2');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_wege_bruecke_lehnenviadukt',NULL,'geometrie','ch.ehi.ili2db.c1Max','2870000.000');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_wege_bruecke_lehnenviadukt',NULL,'geometrie','ch.ehi.ili2db.c2Max','1310000.000');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_wege_bruecke_lehnenviadukt',NULL,'geometrie','ch.ehi.ili2db.geomType','POINT');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_wege_bruecke_lehnenviadukt',NULL,'geometrie','ch.ehi.ili2db.c1Min','2460000.000');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_wege_bruecke_lehnenviadukt',NULL,'geometrie','ch.ehi.ili2db.c2Min','1045000.000');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_wege_bruecke_lehnenviadukt',NULL,'geometrie','ch.ehi.ili2db.srid','2056');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_oekologie_punkt',NULL,'geometrie','ch.ehi.ili2db.coordDimension','2');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_oekologie_punkt',NULL,'geometrie','ch.ehi.ili2db.c1Max','2870000.000');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_oekologie_punkt',NULL,'geometrie','ch.ehi.ili2db.c2Max','1310000.000');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_oekologie_punkt',NULL,'geometrie','ch.ehi.ili2db.geomType','POINT');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_oekologie_punkt',NULL,'geometrie','ch.ehi.ili2db.c1Min','2460000.000');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_oekologie_punkt',NULL,'geometrie','ch.ehi.ili2db.c2Min','1045000.000');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_oekologie_punkt',NULL,'geometrie','ch.ehi.ili2db.srid','2056');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('linestructure',NULL,'multiline_lines','ch.ehi.ili2db.foreignKey','multiline');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_wegebau_linie',NULL,'anteil_lw','ch.ehi.ili2db.unit','Percent');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_seilbahn_station',NULL,'werkeigentum','ch.ehi.ili2db.foreignKey','raeumlicheelemnte_werkseigentum');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_bewaesserung_punkt',NULL,'werkeigentum','ch.ehi.ili2db.foreignKey','raeumlicheelemnte_werkseigentum');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_genossenschaft_element',NULL,'element_genossenschaft_raemlchlmnt_wv_tng_wssrvrsrgung','ch.ehi.ili2db.foreignKey','raeumlicheelemnte_wv_leitung_wasserversorgung');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_beizugsgebiet_projekt',NULL,'projekt','ch.ehi.ili2db.foreignKey','raeumlicheelemnte_projekt');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_seilbahn_linie',NULL,'geometrie','ch.ehi.ili2db.coordDimension','2');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_seilbahn_linie',NULL,'geometrie','ch.ehi.ili2db.c1Max','2870000.000');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_seilbahn_linie',NULL,'geometrie','ch.ehi.ili2db.c2Max','1310000.000');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_seilbahn_linie',NULL,'geometrie','ch.ehi.ili2db.geomType','MULTILINESTRING');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_seilbahn_linie',NULL,'geometrie','ch.ehi.ili2db.c1Min','2460000.000');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_seilbahn_linie',NULL,'geometrie','ch.ehi.ili2db.c2Min','1045000.000');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_seilbahn_linie',NULL,'geometrie','ch.ehi.ili2db.srid','2056');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_wiederherstellung_punkt',NULL,'geometrie','ch.ehi.ili2db.coordDimension','2');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_wiederherstellung_punkt',NULL,'geometrie','ch.ehi.ili2db.c1Max','2870000.000');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_wiederherstellung_punkt',NULL,'geometrie','ch.ehi.ili2db.c2Max','1310000.000');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_wiederherstellung_punkt',NULL,'geometrie','ch.ehi.ili2db.geomType','POINT');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_wiederherstellung_punkt',NULL,'geometrie','ch.ehi.ili2db.c1Min','2460000.000');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_wiederherstellung_punkt',NULL,'geometrie','ch.ehi.ili2db.c2Min','1045000.000');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_wiederherstellung_punkt',NULL,'geometrie','ch.ehi.ili2db.srid','2056');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_bewaesserung_linie',NULL,'werkeigentum','ch.ehi.ili2db.foreignKey','raeumlicheelemnte_werkseigentum');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_genossenschaft_element',NULL,'element_genossenschaft_raeumlicheelemnte_oekologi_lnie','ch.ehi.ili2db.foreignKey','raeumlicheelemnte_oekologie_linie');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_wege_bruecke_lehnenviadukt',NULL,'projekt','ch.ehi.ili2db.foreignKey','raeumlicheelemnte_projekt');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_genossenschaft_element',NULL,'element_genossenschaft_raeumlicheelemnte_ev_linie','ch.ehi.ili2db.foreignKey','raeumlicheelemnte_ev_linie');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_wegebau_linie',NULL,'geometrie','ch.ehi.ili2db.coordDimension','2');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_wegebau_linie',NULL,'geometrie','ch.ehi.ili2db.c1Max','2870000.000');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_wegebau_linie',NULL,'geometrie','ch.ehi.ili2db.c2Max','1310000.000');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_wegebau_linie',NULL,'geometrie','ch.ehi.ili2db.geomType','MULTILINESTRING');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_wegebau_linie',NULL,'geometrie','ch.ehi.ili2db.c1Min','2460000.000');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_wegebau_linie',NULL,'geometrie','ch.ehi.ili2db.c2Min','1045000.000');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_wegebau_linie',NULL,'geometrie','ch.ehi.ili2db.srid','2056');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_oekologie_flaeche',NULL,'werkeigentum','ch.ehi.ili2db.foreignKey','raeumlicheelemnte_werkseigentum');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_wasserversorgung_punkt',NULL,'werkeigentum','ch.ehi.ili2db.foreignKey','raeumlicheelemnte_werkseigentum');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_oekologie_trockenmauer',NULL,'projekt','ch.ehi.ili2db.foreignKey','raeumlicheelemnte_projekt');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_seilbahn_station',NULL,'geometrie','ch.ehi.ili2db.coordDimension','2');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_seilbahn_station',NULL,'geometrie','ch.ehi.ili2db.c1Max','2870000.000');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_seilbahn_station',NULL,'geometrie','ch.ehi.ili2db.c2Max','1310000.000');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_seilbahn_station',NULL,'geometrie','ch.ehi.ili2db.geomType','POINT');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_seilbahn_station',NULL,'geometrie','ch.ehi.ili2db.c1Min','2460000.000');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_seilbahn_station',NULL,'geometrie','ch.ehi.ili2db.c2Min','1045000.000');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_seilbahn_station',NULL,'geometrie','ch.ehi.ili2db.srid','2056');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_wegebau_linie',NULL,'laenge_gerundet','ch.ehi.ili2db.unit','m');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_wiederherstellung_punkt',NULL,'werkeigentum','ch.ehi.ili2db.foreignKey','raeumlicheelemnte_werkseigentum');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_wasserversorgung_punkt',NULL,'projekt','ch.ehi.ili2db.foreignKey','raeumlicheelemnte_projekt');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_genossenschaft_element',NULL,'element_genossenschaft_raeumlicheelemnt_mlchltng_ltung','ch.ehi.ili2db.foreignKey','raeumlicheelemnte_milchleitung_leitung');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_beizugsgebiet_projekt',NULL,'beizugsgebiet','ch.ehi.ili2db.foreignKey','raeumlicheelemnte_beizugsgebiet');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_oekologie_flaeche',NULL,'geometrie','ch.ehi.ili2db.coordDimension','2');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_oekologie_flaeche',NULL,'geometrie','ch.ehi.ili2db.c1Max','2870000.000');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_oekologie_flaeche',NULL,'geometrie','ch.ehi.ili2db.c2Max','1310000.000');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_oekologie_flaeche',NULL,'geometrie','ch.ehi.ili2db.geomType','MULTIPOLYGON');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_oekologie_flaeche',NULL,'geometrie','ch.ehi.ili2db.c1Min','2460000.000');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_oekologie_flaeche',NULL,'geometrie','ch.ehi.ili2db.c2Min','1045000.000');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_oekologie_flaeche',NULL,'geometrie','ch.ehi.ili2db.srid','2056');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_oekologie_trockenmauer',NULL,'werkeigentum','ch.ehi.ili2db.foreignKey','raeumlicheelemnte_werkseigentum');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_seilbahn_linie',NULL,'projekt','ch.ehi.ili2db.foreignKey','raeumlicheelemnte_projekt');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_genossenschaft_element',NULL,'element_genossenschaft_raeumlchlmnt_ntw_bdnstrktr_lnie','ch.ehi.ili2db.foreignKey','raeumlicheelemnte_entw_bodenstruktur_linie');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_seilbahn_station',NULL,'projekt','ch.ehi.ili2db.foreignKey','raeumlicheelemnte_projekt');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_genossenschaft_element',NULL,'element_genossenschaft_raeumlicheelemnte_oekologi_pnkt','ch.ehi.ili2db.foreignKey','raeumlicheelemnte_oekologie_punkt');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_seilbahn_linie',NULL,'werkeigentum','ch.ehi.ili2db.foreignKey','raeumlicheelemnte_werkseigentum');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_oekologie_trockenmauer',NULL,'geometrie','ch.ehi.ili2db.coordDimension','2');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_oekologie_trockenmauer',NULL,'geometrie','ch.ehi.ili2db.c1Max','2870000.000');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_oekologie_trockenmauer',NULL,'geometrie','ch.ehi.ili2db.c2Max','1310000.000');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_oekologie_trockenmauer',NULL,'geometrie','ch.ehi.ili2db.geomType','MULTILINESTRING');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_oekologie_trockenmauer',NULL,'geometrie','ch.ehi.ili2db.c1Min','2460000.000');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_oekologie_trockenmauer',NULL,'geometrie','ch.ehi.ili2db.c2Min','1045000.000');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_oekologie_trockenmauer',NULL,'geometrie','ch.ehi.ili2db.srid','2056');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_bewaesserung_linie',NULL,'projekt','ch.ehi.ili2db.foreignKey','raeumlicheelemnte_projekt');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_genossenschaft',NULL,'geometrie','ch.ehi.ili2db.coordDimension','2');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_genossenschaft',NULL,'geometrie','ch.ehi.ili2db.c1Max','2870000.000');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_genossenschaft',NULL,'geometrie','ch.ehi.ili2db.c2Max','1310000.000');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_genossenschaft',NULL,'geometrie','ch.ehi.ili2db.geomType','MULTIPOLYGON');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_genossenschaft',NULL,'geometrie','ch.ehi.ili2db.c1Min','2460000.000');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_genossenschaft',NULL,'geometrie','ch.ehi.ili2db.c2Min','1045000.000');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_genossenschaft',NULL,'geometrie','ch.ehi.ili2db.srid','2056');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_genossenschaft_dokument',NULL,'genossenschaft','ch.ehi.ili2db.foreignKey','raeumlicheelemnte_genossenschaft');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_bew_flaechen_bewaesserung',NULL,'werkeigentum','ch.ehi.ili2db.foreignKey','raeumlicheelemnte_werkseigentum');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_genossenschaft_element',NULL,'element_genossenschaft_raeumlicheelemnte_bewssrng_pnkt','ch.ehi.ili2db.foreignKey','raeumlicheelemnte_bewaesserung_punkt');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_bewaesserung_punkt',NULL,'geometrie','ch.ehi.ili2db.coordDimension','2');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_bewaesserung_punkt',NULL,'geometrie','ch.ehi.ili2db.c1Max','2870000.000');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_bewaesserung_punkt',NULL,'geometrie','ch.ehi.ili2db.c2Max','1310000.000');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_bewaesserung_punkt',NULL,'geometrie','ch.ehi.ili2db.geomType','POINT');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_bewaesserung_punkt',NULL,'geometrie','ch.ehi.ili2db.c1Min','2460000.000');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_bewaesserung_punkt',NULL,'geometrie','ch.ehi.ili2db.c2Min','1045000.000');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_bewaesserung_punkt',NULL,'geometrie','ch.ehi.ili2db.srid','2056');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_genossenschaft_element',NULL,'element_genossenschaft_raeumlichlmnt_wg_brck_lhnnvdukt','ch.ehi.ili2db.foreignKey','raeumlicheelemnte_wege_bruecke_lehnenviadukt');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_wege_bruecke_lehnenviadukt',NULL,'fahrbahnbreite','ch.ehi.ili2db.unit','m');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_genossenschaft_element',NULL,'element_genossenschaft_raemlchlmnt_ntwdnstrktr_pmpwerk','ch.ehi.ili2db.foreignKey','raeumlicheelemnte_entw_bodenstruktur_pumpwerk');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_dokument',NULL,'wiederherstellungs_punkt','ch.ehi.ili2db.foreignKey','raeumlicheelemnte_wiederherstellung_punkt');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_genossenschaft_element',NULL,'element_genossenschaft_raeumlicheelemnte_ev_punkt','ch.ehi.ili2db.foreignKey','raeumlicheelemnte_ev_punkt');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_oekologie_linie',NULL,'geometrie','ch.ehi.ili2db.coordDimension','2');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_oekologie_linie',NULL,'geometrie','ch.ehi.ili2db.c1Max','2870000.000');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_oekologie_linie',NULL,'geometrie','ch.ehi.ili2db.c2Max','1310000.000');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_oekologie_linie',NULL,'geometrie','ch.ehi.ili2db.geomType','MULTILINESTRING');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_oekologie_linie',NULL,'geometrie','ch.ehi.ili2db.c1Min','2460000.000');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_oekologie_linie',NULL,'geometrie','ch.ehi.ili2db.c2Min','1045000.000');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_oekologie_linie',NULL,'geometrie','ch.ehi.ili2db.srid','2056');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_wegebau_linie',NULL,'projekt','ch.ehi.ili2db.foreignKey','raeumlicheelemnte_projekt');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_bew_flaechen_bewaesserung',NULL,'projekt','ch.ehi.ili2db.foreignKey','raeumlicheelemnte_projekt');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_wv_leitung_wasserversorgung',NULL,'geometrie','ch.ehi.ili2db.coordDimension','2');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_wv_leitung_wasserversorgung',NULL,'geometrie','ch.ehi.ili2db.c1Max','2870000.000');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_wv_leitung_wasserversorgung',NULL,'geometrie','ch.ehi.ili2db.c2Max','1310000.000');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_wv_leitung_wasserversorgung',NULL,'geometrie','ch.ehi.ili2db.geomType','MULTILINESTRING');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_wv_leitung_wasserversorgung',NULL,'geometrie','ch.ehi.ili2db.c1Min','2460000.000');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_wv_leitung_wasserversorgung',NULL,'geometrie','ch.ehi.ili2db.c2Min','1045000.000');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_wv_leitung_wasserversorgung',NULL,'geometrie','ch.ehi.ili2db.srid','2056');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_entw_bodenstruktur_pumpwerk',NULL,'werkeigentum','ch.ehi.ili2db.foreignKey','raeumlicheelemnte_werkseigentum');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_milchleitung_leitung',NULL,'projekt','ch.ehi.ili2db.foreignKey','raeumlicheelemnte_projekt');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('surfacestructure',NULL,'multisurface_surfaces','ch.ehi.ili2db.foreignKey','multisurface');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_bew_flaechen_bewaesserung',NULL,'geometrie','ch.ehi.ili2db.coordDimension','2');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_bew_flaechen_bewaesserung',NULL,'geometrie','ch.ehi.ili2db.c1Max','2870000.000');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_bew_flaechen_bewaesserung',NULL,'geometrie','ch.ehi.ili2db.c2Max','1310000.000');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_bew_flaechen_bewaesserung',NULL,'geometrie','ch.ehi.ili2db.geomType','MULTIPOLYGON');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_bew_flaechen_bewaesserung',NULL,'geometrie','ch.ehi.ili2db.c1Min','2460000.000');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_bew_flaechen_bewaesserung',NULL,'geometrie','ch.ehi.ili2db.c2Min','1045000.000');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_bew_flaechen_bewaesserung',NULL,'geometrie','ch.ehi.ili2db.srid','2056');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_entw_bodenstruktur_linie',NULL,'geometrie','ch.ehi.ili2db.coordDimension','2');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_entw_bodenstruktur_linie',NULL,'geometrie','ch.ehi.ili2db.c1Max','2870000.000');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_entw_bodenstruktur_linie',NULL,'geometrie','ch.ehi.ili2db.c2Max','1310000.000');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_entw_bodenstruktur_linie',NULL,'geometrie','ch.ehi.ili2db.geomType','MULTILINESTRING');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_entw_bodenstruktur_linie',NULL,'geometrie','ch.ehi.ili2db.c1Min','2460000.000');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_entw_bodenstruktur_linie',NULL,'geometrie','ch.ehi.ili2db.c2Min','1045000.000');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_entw_bodenstruktur_linie',NULL,'geometrie','ch.ehi.ili2db.srid','2056');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_genossenschaft_element',NULL,'element_genossenschaft_raeumlicheelemnte_wegebau_linie','ch.ehi.ili2db.foreignKey','raeumlicheelemnte_wegebau_linie');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_entw_bodenstruktur_flaeche',NULL,'geometrie','ch.ehi.ili2db.coordDimension','2');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_entw_bodenstruktur_flaeche',NULL,'geometrie','ch.ehi.ili2db.c1Max','2870000.000');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_entw_bodenstruktur_flaeche',NULL,'geometrie','ch.ehi.ili2db.c2Max','1310000.000');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_entw_bodenstruktur_flaeche',NULL,'geometrie','ch.ehi.ili2db.geomType','MULTIPOLYGON');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_entw_bodenstruktur_flaeche',NULL,'geometrie','ch.ehi.ili2db.c1Min','2460000.000');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_entw_bodenstruktur_flaeche',NULL,'geometrie','ch.ehi.ili2db.c2Min','1045000.000');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_entw_bodenstruktur_flaeche',NULL,'geometrie','ch.ehi.ili2db.srid','2056');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_genossenschaft_element',NULL,'genossenschaft_element','ch.ehi.ili2db.foreignKey','raeumlicheelemnte_genossenschaft');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_milchleitung_lokal',NULL,'projekt','ch.ehi.ili2db.foreignKey','raeumlicheelemnte_projekt');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_ev_punkt',NULL,'geometrie','ch.ehi.ili2db.coordDimension','2');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_ev_punkt',NULL,'geometrie','ch.ehi.ili2db.c1Max','2870000.000');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_ev_punkt',NULL,'geometrie','ch.ehi.ili2db.c2Max','1310000.000');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_ev_punkt',NULL,'geometrie','ch.ehi.ili2db.geomType','POINT');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_ev_punkt',NULL,'geometrie','ch.ehi.ili2db.c1Min','2460000.000');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_ev_punkt',NULL,'geometrie','ch.ehi.ili2db.c2Min','1045000.000');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_ev_punkt',NULL,'geometrie','ch.ehi.ili2db.srid','2056');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('surfacestructure',NULL,'surface','ch.ehi.ili2db.coordDimension','2');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('surfacestructure',NULL,'surface','ch.ehi.ili2db.c1Max','2870000.000');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('surfacestructure',NULL,'surface','ch.ehi.ili2db.c2Max','1310000.000');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('surfacestructure',NULL,'surface','ch.ehi.ili2db.geomType','POLYGON');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('surfacestructure',NULL,'surface','ch.ehi.ili2db.c1Min','2460000.000');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('surfacestructure',NULL,'surface','ch.ehi.ili2db.c2Min','1045000.000');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('surfacestructure',NULL,'surface','ch.ehi.ili2db.srid','2056');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_ev_linie',NULL,'geometrie','ch.ehi.ili2db.coordDimension','2');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_ev_linie',NULL,'geometrie','ch.ehi.ili2db.c1Max','2870000.000');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_ev_linie',NULL,'geometrie','ch.ehi.ili2db.c2Max','1310000.000');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_ev_linie',NULL,'geometrie','ch.ehi.ili2db.geomType','MULTILINESTRING');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_ev_linie',NULL,'geometrie','ch.ehi.ili2db.c1Min','2460000.000');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_ev_linie',NULL,'geometrie','ch.ehi.ili2db.c2Min','1045000.000');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_ev_linie',NULL,'geometrie','ch.ehi.ili2db.srid','2056');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_wegebau_linie',NULL,'fahrbahnbreite','ch.ehi.ili2db.unit','m');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_oekologie_punkt',NULL,'werkeigentum','ch.ehi.ili2db.foreignKey','raeumlicheelemnte_werkseigentum');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_wv_leitung_wasserversorgung',NULL,'werkeigentum','ch.ehi.ili2db.foreignKey','raeumlicheelemnte_werkseigentum');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_oekologie_linie',NULL,'werkeigentum','ch.ehi.ili2db.foreignKey','raeumlicheelemnte_werkseigentum');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_genossenschaft_element',NULL,'element_genossenschaft_raeumlichelmnt_wdrhrstllng_pnkt','ch.ehi.ili2db.foreignKey','raeumlicheelemnte_wiederherstellung_punkt');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_genossenschaft_element',NULL,'element_genossenschaft_raeumlicheelemnte_hochbau','ch.ehi.ili2db.foreignKey','raeumlicheelemnte_hochbau');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_genossenschaft_element',NULL,'element_genossenschaft_raemlchlmnt_ntw_bdnstrktr_flche','ch.ehi.ili2db.foreignKey','raeumlicheelemnte_entw_bodenstruktur_flaeche');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_ev_punkt',NULL,'projekt','ch.ehi.ili2db.foreignKey','raeumlicheelemnte_projekt');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_entw_bodenstruktur_pumpwerk',NULL,'geometrie','ch.ehi.ili2db.coordDimension','2');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_entw_bodenstruktur_pumpwerk',NULL,'geometrie','ch.ehi.ili2db.c1Max','2870000.000');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_entw_bodenstruktur_pumpwerk',NULL,'geometrie','ch.ehi.ili2db.c2Max','1310000.000');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_entw_bodenstruktur_pumpwerk',NULL,'geometrie','ch.ehi.ili2db.geomType','POINT');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_entw_bodenstruktur_pumpwerk',NULL,'geometrie','ch.ehi.ili2db.c1Min','2460000.000');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_entw_bodenstruktur_pumpwerk',NULL,'geometrie','ch.ehi.ili2db.c2Min','1045000.000');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_entw_bodenstruktur_pumpwerk',NULL,'geometrie','ch.ehi.ili2db.srid','2056');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_milchleitung_leitung',NULL,'geometrie','ch.ehi.ili2db.coordDimension','2');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_milchleitung_leitung',NULL,'geometrie','ch.ehi.ili2db.c1Max','2870000.000');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_milchleitung_leitung',NULL,'geometrie','ch.ehi.ili2db.c2Max','1310000.000');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_milchleitung_leitung',NULL,'geometrie','ch.ehi.ili2db.geomType','MULTILINESTRING');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_milchleitung_leitung',NULL,'geometrie','ch.ehi.ili2db.c1Min','2460000.000');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_milchleitung_leitung',NULL,'geometrie','ch.ehi.ili2db.c2Min','1045000.000');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_milchleitung_leitung',NULL,'geometrie','ch.ehi.ili2db.srid','2056');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_entw_bodenstruktur_flaeche',NULL,'werkeigentum','ch.ehi.ili2db.foreignKey','raeumlicheelemnte_werkseigentum');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_ev_linie',NULL,'werkeigentum','ch.ehi.ili2db.foreignKey','raeumlicheelemnte_werkseigentum');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_oekologie_linie',NULL,'projekt','ch.ehi.ili2db.foreignKey','raeumlicheelemnte_projekt');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_oekologie_punkt',NULL,'projekt','ch.ehi.ili2db.foreignKey','raeumlicheelemnte_projekt');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_hochbau',NULL,'projekt','ch.ehi.ili2db.foreignKey','raeumlicheelemnte_projekt');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_genossenschaft_dokument',NULL,'dokument','ch.ehi.ili2db.foreignKey','raeumlicheelemnte_dokument');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_ev_punkt',NULL,'werkeigentum','ch.ehi.ili2db.foreignKey','raeumlicheelemnte_werkseigentum');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_wege_bruecke_lehnenviadukt',NULL,'laenge','ch.ehi.ili2db.unit','m');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('raeumlicheelemnte_entw_bodenstruktur_linie',NULL,'projekt','ch.ehi.ili2db.foreignKey','raeumlicheelemnte_projekt');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('beizugsgebiete','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('linestructure','ch.ehi.ili2db.tableKind','STRUCTURE');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('projekt','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('raeumlicheelemnte_seilbahn_station','ch.ehi.ili2db.tableKind','CLASS');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('oekologie_linien','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('funktionstyp','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('raeumlicheelemnte_entw_bodenstruktur_pumpwerk','ch.ehi.ili2db.tableKind','CLASS');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('raeumlicheelemnte_bewaesserung_punkt','ch.ehi.ili2db.tableKind','CLASS');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('oekologie_trockenmauern','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('raeumlicheelemnte_werkseigentum','ch.ehi.ili2db.tableKind','CLASS');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('raeumlicheelemnte_wv_leitung_wasserversorgung','ch.ehi.ili2db.tableKind','CLASS');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('raeumlicheelemnte_oekologie_linie','ch.ehi.ili2db.tableKind','CLASS');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('wasserversorgung_punkte','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('raeumlicheelemnte_oekologie_punkt','ch.ehi.ili2db.tableKind','CLASS');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('elektrizitaet_linien','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('astatus','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('wege','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('genossenschaften','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('raeumlicheelemnte_wasserversorgung_punkt','ch.ehi.ili2db.tableKind','CLASS');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('raeumlicheelemnte_oekologie_flaeche','ch.ehi.ili2db.tableKind','CLASS');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('raeumlicheelemnte_entw_bodenstruktur_flaeche','ch.ehi.ili2db.tableKind','CLASS');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('raeumlicheelemnte_wiederherstellung_punkt','ch.ehi.ili2db.tableKind','CLASS');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('raeumlicheelemnte_projekt','ch.ehi.ili2db.tableKind','CLASS');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('bewaesserung_punkte','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('raeumlicheelemnte_genossenschaft','ch.ehi.ili2db.tableKind','CLASS');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('raeumlicheelemnte_genossenschaft_element','ch.ehi.ili2db.tableKind','ASSOCIATION');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('raeumlicheelemnte_dokument','ch.ehi.ili2db.tableKind','CLASS');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('multiline','ch.ehi.ili2db.tableKind','STRUCTURE');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('raeumlicheelemnte_ev_linie','ch.ehi.ili2db.tableKind','CLASS');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('raeumlicheelemnte_oekologie_trockenmauer','ch.ehi.ili2db.tableKind','CLASS');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('raeumlicheelemnte_ev_punkt','ch.ehi.ili2db.tableKind','CLASS');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('entw_bodenstruktur_flaechen','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('seilbahnen_punkte','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('raeumlicheelemnte_milchleitung_leitung','ch.ehi.ili2db.tableKind','CLASS');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('hochbau_punkte','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('raeumlicheelemnte_beizugsgebiet_projekt','ch.ehi.ili2db.tableKind','ASSOCIATION');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('wiederherstellung_punkte','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('raeumlicheelemnte_genossenschaft_dokument','ch.ehi.ili2db.tableKind','ASSOCIATION');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('stand_gutrrglrung_stand_gueterregulierung','ch.ehi.ili2db.tableKind','CLASS');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('bewaesserung_linien','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('raeumlicheelemnte_entw_bodenstruktur_linie','ch.ehi.ili2db.tableKind','CLASS');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('raeumlicheelemnte_beizugsgebiet','ch.ehi.ili2db.tableKind','CLASS');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('oekologische_flaechen','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('raeumlicheelemnte_seilbahn_linie','ch.ehi.ili2db.tableKind','CLASS');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('raeumlicheelemnte_hochbau','ch.ehi.ili2db.tableKind','CLASS');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('multisurface','ch.ehi.ili2db.tableKind','STRUCTURE');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('raeumlicheelemnte_wegebau_linie','ch.ehi.ili2db.tableKind','CLASS');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('stand','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('raeumlicheelemnte_bew_flaechen_bewaesserung','ch.ehi.ili2db.tableKind','CLASS');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('technische_schwierigkeit','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('elektrizitaet_punkte','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('seilbahnen_linien','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('raeumlicheelemnte_bewaesserung_linie','ch.ehi.ili2db.tableKind','CLASS');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('raeumlicheelemnte_milchleitung_lokal','ch.ehi.ili2db.tableKind','CLASS');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('raeumlicheelemnte_wege_bruecke_lehnenviadukt','ch.ehi.ili2db.tableKind','CLASS');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('entw_bodenstruktur_linien','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('bewaesserung_flaechen','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('dokumententyp','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('surfacestructure','ch.ehi.ili2db.tableKind','STRUCTURE');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('oekologie_punkte','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('bautyp','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('raeumlichelmnte_wege_bruecke_lehnenviadukt_material','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_MODEL (filename,iliversion,modelName,content,importDate) VALUES ('Units-20120220.ili','2.3','Units','!! File Units.ili Release 2012-02-20

INTERLIS 2.3;

!! 2012-02-20 definition of "Bar [bar]" corrected
!!@precursorVersion = 2005-06-06

CONTRACTED TYPE MODEL Units (en) AT "http://www.interlis.ch/models"
  VERSION "2012-02-20" =

  UNIT
    !! abstract Units
    Area (ABSTRACT) = (INTERLIS.LENGTH*INTERLIS.LENGTH);
    Volume (ABSTRACT) = (INTERLIS.LENGTH*INTERLIS.LENGTH*INTERLIS.LENGTH);
    Velocity (ABSTRACT) = (INTERLIS.LENGTH/INTERLIS.TIME);
    Acceleration (ABSTRACT) = (Velocity/INTERLIS.TIME);
    Force (ABSTRACT) = (INTERLIS.MASS*INTERLIS.LENGTH/INTERLIS.TIME/INTERLIS.TIME);
    Pressure (ABSTRACT) = (Force/Area);
    Energy (ABSTRACT) = (Force*INTERLIS.LENGTH);
    Power (ABSTRACT) = (Energy/INTERLIS.TIME);
    Electric_Potential (ABSTRACT) = (Power/INTERLIS.ELECTRIC_CURRENT);
    Frequency (ABSTRACT) = (INTERLIS.DIMENSIONLESS/INTERLIS.TIME);

    Millimeter [mm] = 0.001 [INTERLIS.m];
    Centimeter [cm] = 0.01 [INTERLIS.m];
    Decimeter [dm] = 0.1 [INTERLIS.m];
    Kilometer [km] = 1000 [INTERLIS.m];

    Square_Meter [m2] EXTENDS Area = (INTERLIS.m*INTERLIS.m);
    Cubic_Meter [m3] EXTENDS Volume = (INTERLIS.m*INTERLIS.m*INTERLIS.m);

    Minute [min] = 60 [INTERLIS.s];
    Hour [h] = 60 [min];
    Day [d] = 24 [h];

    Kilometer_per_Hour [kmh] EXTENDS Velocity = (km/h);
    Meter_per_Second [ms] = 3.6 [kmh];
    Newton [N] EXTENDS Force = (INTERLIS.kg*INTERLIS.m/INTERLIS.s/INTERLIS.s);
    Pascal [Pa] EXTENDS Pressure = (N/m2);
    Joule [J] EXTENDS Energy = (N*INTERLIS.m);
    Watt [W] EXTENDS Power = (J/INTERLIS.s);
    Volt [V] EXTENDS Electric_Potential = (W/INTERLIS.A);

    Inch [in] = 2.54 [cm];
    Foot [ft] = 0.3048 [INTERLIS.m];
    Mile [mi] = 1.609344 [km];

    Are [a] = 100 [m2];
    Hectare [ha] = 100 [a];
    Square_Kilometer [km2] = 100 [ha];
    Acre [acre] = 4046.873 [m2];

    Liter [L] = 1 / 1000 [m3];
    US_Gallon [USgal] = 3.785412 [L];

    Angle_Degree = 180 / PI [INTERLIS.rad];
    Angle_Minute = 1 / 60 [Angle_Degree];
    Angle_Second = 1 / 60 [Angle_Minute];

    Gon = 200 / PI [INTERLIS.rad];

    Gram [g] = 1 / 1000 [INTERLIS.kg];
    Ton [t] = 1000 [INTERLIS.kg];
    Pound [lb] = 0.4535924 [INTERLIS.kg];

    Calorie [cal] = 4.1868 [J];
    Kilowatt_Hour [kWh] = 0.36E7 [J];

    Horsepower = 746 [W];

    Techn_Atmosphere [at] = 98066.5 [Pa];
    Atmosphere [atm] = 101325 [Pa];
    Bar [bar] = 100000 [Pa];
    Millimeter_Mercury [mmHg] = 133.3224 [Pa];
    Torr = 133.3224 [Pa]; !! Torr = [mmHg]

    Decibel [dB] = FUNCTION // 10**(dB/20) * 0.00002 // [Pa];

    Degree_Celsius [oC] = FUNCTION // oC+273.15 // [INTERLIS.K];
    Degree_Fahrenheit [oF] = FUNCTION // (oF+459.67)/1.8 // [INTERLIS.K];

    CountedObjects EXTENDS INTERLIS.DIMENSIONLESS;

    Hertz [Hz] EXTENDS Frequency = (CountedObjects/INTERLIS.s);
    KiloHertz [KHz] = 1000 [Hz];
    MegaHertz [MHz] = 1000 [KHz];

    Percent = 0.01 [CountedObjects];
    Permille = 0.001 [CountedObjects];

    !! ISO 4217 Currency Abbreviation
    USDollar [USD] EXTENDS INTERLIS.MONEY;
    Euro [EUR] EXTENDS INTERLIS.MONEY;
    SwissFrancs [CHF] EXTENDS INTERLIS.MONEY;

END Units.

','2020-03-24 16:13:58.333');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_MODEL (filename,iliversion,modelName,content,importDate) VALUES ('CHBase_Part2_LOCALISATION_20110830.ili','2.3','InternationalCodes_V1 Localisation_V1{ InternationalCodes_V1} LocalisationCH_V1{ InternationalCodes_V1 Localisation_V1} Dictionaries_V1{ InternationalCodes_V1} DictionariesCH_V1{ InternationalCodes_V1 Dictionaries_V1}','/* ########################################################################
   CHBASE - BASE MODULES OF THE SWISS FEDERATION FOR MINIMAL GEODATA MODELS
   ======
   BASISMODULE DES BUNDES           MODULES DE BASE DE LA CONFEDERATION
   FÜR MINIMALE GEODATENMODELLE     POUR LES MODELES DE GEODONNEES MINIMAUX
   
   PROVIDER: GKG/KOGIS - GCS/COSIG             CONTACT: models@geo.admin.ch
   PUBLISHED: 2011-08-30
   ########################################################################
*/

INTERLIS 2.3;

/* ########################################################################
   ########################################################################
   PART II -- LOCALISATION
   - Package InternationalCodes
   - Packages Localisation, LocalisationCH
   - Packages Dictionaries, DictionariesCH
*/

!! ########################################################################
!!@technicalContact=models@geo.admin.ch
!!@furtherInformation=http://www.geo.admin.ch/internet/geoportal/de/home/topics/geobasedata/models.html
TYPE MODEL InternationalCodes_V1 (en)
  AT "http://www.geo.admin.ch" VERSION "2011-08-30" =

  DOMAIN
    LanguageCode_ISO639_1 = (de,fr,it,rm,en,
      aa,ab,af,am,ar,as,ay,az,ba,be,bg,bh,bi,bn,bo,br,ca,co,cs,cy,da,dz,el,
      eo,es,et,eu,fa,fi,fj,fo,fy,ga,gd,gl,gn,gu,ha,he,hi,hr,hu,hy,ia,id,ie,
      ik,is,iu,ja,jw,ka,kk,kl,km,kn,ko,ks,ku,ky,la,ln,lo,lt,lv,mg,mi,mk,ml,
      mn,mo,mr,ms,mt,my,na,ne,nl,no,oc,om,or,pa,pl,ps,pt,qu,rn,ro,ru,rw,sa,
      sd,sg,sh,si,sk,sl,sm,sn,so,sq,sr,ss,st,su,sv,sw,ta,te,tg,th,ti,tk,tl,
      tn,to,tr,ts,tt,tw,ug,uk,ur,uz,vi,vo,wo,xh,yi,yo,za,zh,zu);

    CountryCode_ISO3166_1 = (CHE,
      ABW,AFG,AGO,AIA,ALA,ALB,AND_,ANT,ARE,ARG,ARM,ASM,ATA,ATF,ATG,AUS,
      AUT,AZE,BDI,BEL,BEN,BFA,BGD,BGR,BHR,BHS,BIH,BLR,BLZ,BMU,BOL,BRA,
      BRB,BRN,BTN,BVT,BWA,CAF,CAN,CCK,CHL,CHN,CIV,CMR,COD,COG,COK,COL,
      COM,CPV,CRI,CUB,CXR,CYM,CYP,CZE,DEU,DJI,DMA,DNK,DOM,DZA,ECU,EGY,
      ERI,ESH,ESP,EST,ETH,FIN,FJI,FLK,FRA,FRO,FSM,GAB,GBR,GEO,GGY,GHA,
      GIB,GIN,GLP,GMB,GNB,GNQ,GRC,GRD,GRL,GTM,GUF,GUM,GUY,HKG,HMD,HND,
      HRV,HTI,HUN,IDN,IMN,IND,IOT,IRL,IRN,IRQ,ISL,ISR,ITA,JAM,JEY,JOR,
      JPN,KAZ,KEN,KGZ,KHM,KIR,KNA,KOR,KWT,LAO,LBN,LBR,LBY,LCA,LIE,LKA,
      LSO,LTU,LUX,LVA,MAC,MAR,MCO,MDA,MDG,MDV,MEX,MHL,MKD,MLI,MLT,MMR,
      MNE,MNG,MNP,MOZ,MRT,MSR,MTQ,MUS,MWI,MYS,MYT,NAM,NCL,NER,NFK,NGA,
      NIC,NIU,NLD,NOR,NPL,NRU,NZL,OMN,PAK,PAN,PCN,PER,PHL,PLW,PNG,POL,
      PRI,PRK,PRT,PRY,PSE,PYF,QAT,REU,ROU,RUS,RWA,SAU,SDN,SEN,SGP,SGS,
      SHN,SJM,SLB,SLE,SLV,SMR,SOM,SPM,SRB,STP,SUR,SVK,SVN,SWE,SWZ,SYC,
      SYR,TCA,TCD,TGO,THA,TJK,TKL,TKM,TLS,TON,TTO,TUN,TUR,TUV,TWN,TZA,
      UGA,UKR,UMI,URY,USA,UZB,VAT,VCT,VEN,VGB,VIR,VNM,VUT,WLF,WSM,YEM,
      ZAF,ZMB,ZWE);

END InternationalCodes_V1.

!! ########################################################################
!!@technicalContact=models@geo.admin.ch
!!@furtherInformation=http://www.geo.admin.ch/internet/geoportal/de/home/topics/geobasedata/models.html
TYPE MODEL Localisation_V1 (en)
  AT "http://www.geo.admin.ch" VERSION "2011-08-30" =

  IMPORTS UNQUALIFIED InternationalCodes_V1;

  STRUCTURE LocalisedText =
    Language: LanguageCode_ISO639_1;
    Text: MANDATORY TEXT;
  END LocalisedText;
  
  STRUCTURE LocalisedMText =
    Language: LanguageCode_ISO639_1;
    Text: MANDATORY MTEXT;
  END LocalisedMText;

  STRUCTURE MultilingualText =
    LocalisedText : BAG {1..*} OF LocalisedText;
    UNIQUE (LOCAL) LocalisedText:Language;
  END MultilingualText;  
  
  STRUCTURE MultilingualMText =
    LocalisedText : BAG {1..*} OF LocalisedMText;
    UNIQUE (LOCAL) LocalisedText:Language;
  END MultilingualMText;

END Localisation_V1.

!! ########################################################################
!!@technicalContact=models@geo.admin.ch
!!@furtherInformation=http://www.geo.admin.ch/internet/geoportal/de/home/topics/geobasedata/models.html
TYPE MODEL LocalisationCH_V1 (en)
  AT "http://www.geo.admin.ch" VERSION "2011-08-30" =

  IMPORTS UNQUALIFIED InternationalCodes_V1;
  IMPORTS Localisation_V1;

  STRUCTURE LocalisedText EXTENDS Localisation_V1.LocalisedText =
  MANDATORY CONSTRAINT
    Language == #de OR
    Language == #fr OR
    Language == #it OR
    Language == #rm OR
    Language == #en;
  END LocalisedText;
  
  STRUCTURE LocalisedMText EXTENDS Localisation_V1.LocalisedMText =
  MANDATORY CONSTRAINT
    Language == #de OR
    Language == #fr OR
    Language == #it OR
    Language == #rm OR
    Language == #en;
  END LocalisedMText;

  STRUCTURE MultilingualText EXTENDS Localisation_V1.MultilingualText =
    LocalisedText(EXTENDED) : BAG {1..*} OF LocalisedText;
  END MultilingualText;  
  
  STRUCTURE MultilingualMText EXTENDS Localisation_V1.MultilingualMText =
    LocalisedText(EXTENDED) : BAG {1..*} OF LocalisedMText;
  END MultilingualMText;

END LocalisationCH_V1.

!! ########################################################################
!!@technicalContact=models@geo.admin.ch
!!@furtherInformation=http://www.geo.admin.ch/internet/geoportal/de/home/topics/geobasedata/models.html
MODEL Dictionaries_V1 (en)
  AT "http://www.geo.admin.ch" VERSION "2011-08-30" =

  IMPORTS UNQUALIFIED InternationalCodes_V1;

  TOPIC Dictionaries (ABSTRACT) =

    STRUCTURE Entry (ABSTRACT) =
      Text: MANDATORY TEXT;
    END Entry;
      
    CLASS Dictionary =
      Language: MANDATORY LanguageCode_ISO639_1;
      Entries: LIST OF Entry;
    END Dictionary;

  END Dictionaries;

END Dictionaries_V1.

!! ########################################################################
!!@technicalContact=models@geo.admin.ch
!!@furtherInformation=http://www.geo.admin.ch/internet/geoportal/de/home/topics/geobasedata/models.html
MODEL DictionariesCH_V1 (en)
  AT "http://www.geo.admin.ch" VERSION "2011-08-30" =

  IMPORTS UNQUALIFIED InternationalCodes_V1;
  IMPORTS Dictionaries_V1;

  TOPIC Dictionaries (ABSTRACT) EXTENDS Dictionaries_V1.Dictionaries =

    CLASS Dictionary (EXTENDED) =
    MANDATORY CONSTRAINT
      Language == #de OR
      Language == #fr OR
      Language == #it OR
      Language == #rm OR
      Language == #en;
    END Dictionary;

  END Dictionaries;

END DictionariesCH_V1.

!! ########################################################################
','2020-03-24 16:13:58.333');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_MODEL (filename,iliversion,modelName,content,importDate) VALUES ('CHBase_Part1_GEOMETRY_20110830.ili','2.3','GeometryCHLV03_V1{ CoordSys Units INTERLIS} GeometryCHLV95_V1{ CoordSys Units INTERLIS}','/* ########################################################################
   CHBASE - BASE MODULES OF THE SWISS FEDERATION FOR MINIMAL GEODATA MODELS
   ======
   BASISMODULE DES BUNDES           MODULES DE BASE DE LA CONFEDERATION
   FÜR MINIMALE GEODATENMODELLE     POUR LES MODELES DE GEODONNEES MINIMAUX
   
   PROVIDER: GKG/KOGIS - GCS/COSIG             CONTACT: models@geo.admin.ch
   PUBLISHED: 2011-0830
   ########################################################################
*/

INTERLIS 2.3;

/* ########################################################################
   ########################################################################
   PART I -- GEOMETRY
   - Package GeometryCHLV03
   - Package GeometryCHLV95
*/

!! ########################################################################

!! Version    | Who   | Modification
!!------------------------------------------------------------------------------
!! 2015-02-20 | KOGIS | WITHOUT OVERLAPS added (line 57, 58, 65 and 66)
!! 2015-11-12 | KOGIS | WITHOUT OVERLAPS corrected (line 57 and 58)
!! 2017-11-27 | KOGIS | Meta-Attributes @furtherInformation adapted and @CRS added (line 31, 44 and 50)
!! 2017-12-04 | KOGIS | Meta-Attribute @CRS corrected

!!@technicalContact=models@geo.admin.ch
!!@furtherInformation=https://www.geo.admin.ch/de/geoinformation-schweiz/geobasisdaten/geodata-models.html
TYPE MODEL GeometryCHLV03_V1 (en)
  AT "http://www.geo.admin.ch" VERSION "2017-12-04" =

  IMPORTS UNQUALIFIED INTERLIS;
  IMPORTS Units;
  IMPORTS CoordSys;

  REFSYSTEM BASKET BCoordSys ~ CoordSys.CoordsysTopic
    OBJECTS OF GeoCartesian2D: CHLV03
    OBJECTS OF GeoHeight: SwissOrthometricAlt;

  DOMAIN
    !!@CRS=EPSG:21781
    Coord2 = COORD
      460000.000 .. 870000.000 [m] {CHLV03[1]},
       45000.000 .. 310000.000 [m] {CHLV03[2]},
      ROTATION 2 -> 1;

    !!@CRS=EPSG:21781
    Coord3 = COORD
      460000.000 .. 870000.000 [m] {CHLV03[1]},
       45000.000 .. 310000.000 [m] {CHLV03[2]},
        -200.000 ..   5000.000 [m] {SwissOrthometricAlt[1]},
      ROTATION 2 -> 1;

    Surface = SURFACE WITH (STRAIGHTS, ARCS) VERTEX Coord2 WITHOUT OVERLAPS > 0.001;
    Area = AREA WITH (STRAIGHTS, ARCS) VERTEX Coord2 WITHOUT OVERLAPS > 0.001;
    Line = POLYLINE WITH (STRAIGHTS, ARCS) VERTEX Coord2;
    DirectedLine EXTENDS Line = DIRECTED POLYLINE;
    LineWithAltitude = POLYLINE WITH (STRAIGHTS, ARCS) VERTEX Coord3;
    DirectedLineWithAltitude = DIRECTED POLYLINE WITH (STRAIGHTS, ARCS) VERTEX Coord3;
    
    /* minimal overlaps only (2mm) */
    SurfaceWithOverlaps2mm = SURFACE WITH (STRAIGHTS, ARCS) VERTEX Coord2 WITHOUT OVERLAPS > 0.002;
    AreaWithOverlaps2mm = AREA WITH (STRAIGHTS, ARCS) VERTEX Coord2 WITHOUT OVERLAPS > 0.002;

    Orientation = 0.00000 .. 359.99999 CIRCULAR [Units.Angle_Degree] <Coord2>;

    Accuracy = (cm, cm50, m, m10, m50, vague);
    Method = (measured, sketched, calculated);

    STRUCTURE LineStructure = 
      Line: Line;
    END LineStructure;

    STRUCTURE DirectedLineStructure =
      Line: DirectedLine;
    END DirectedLineStructure;

    STRUCTURE MultiLine =
      Lines: BAG {1..*} OF LineStructure;
    END MultiLine;

    STRUCTURE MultiDirectedLine =
      Lines: BAG {1..*} OF DirectedLineStructure;
    END MultiDirectedLine;

    STRUCTURE SurfaceStructure =
      Surface: Surface;
    END SurfaceStructure;

    STRUCTURE MultiSurface =
      Surfaces: BAG {1..*} OF SurfaceStructure;
    END MultiSurface;

END GeometryCHLV03_V1.

!! ########################################################################

!! Version    | Who   | Modification
!!------------------------------------------------------------------------------
!! 2015-02-20 | KOGIS | WITHOUT OVERLAPS added (line 135, 136, 143 and 144)
!! 2015-11-12 | KOGIS | WITHOUT OVERLAPS corrected (line 135 and 136)
!! 2017-11-27 | KOGIS | Meta-Attributes @furtherInformation adapted and @CRS added (line 109, 122 and 128)
!! 2017-12-04 | KOGIS | Meta-Attribute @CRS corrected

!!@technicalContact=models@geo.admin.ch
!!@furtherInformation=https://www.geo.admin.ch/de/geoinformation-schweiz/geobasisdaten/geodata-models.html
TYPE MODEL GeometryCHLV95_V1 (en)
  AT "http://www.geo.admin.ch" VERSION "2017-12-04" =

  IMPORTS UNQUALIFIED INTERLIS;
  IMPORTS Units;
  IMPORTS CoordSys;

  REFSYSTEM BASKET BCoordSys ~ CoordSys.CoordsysTopic
    OBJECTS OF GeoCartesian2D: CHLV95
    OBJECTS OF GeoHeight: SwissOrthometricAlt;

  DOMAIN
    !!@CRS=EPSG:2056
    Coord2 = COORD
      2460000.000 .. 2870000.000 [m] {CHLV95[1]},
      1045000.000 .. 1310000.000 [m] {CHLV95[2]},
      ROTATION 2 -> 1;

    !!@CRS=EPSG:2056
    Coord3 = COORD
      2460000.000 .. 2870000.000 [m] {CHLV95[1]},
      1045000.000 .. 1310000.000 [m] {CHLV95[2]},
         -200.000 ..   5000.000 [m] {SwissOrthometricAlt[1]},
      ROTATION 2 -> 1;

    Surface = SURFACE WITH (STRAIGHTS, ARCS) VERTEX Coord2 WITHOUT OVERLAPS > 0.001;
    Area = AREA WITH (STRAIGHTS, ARCS) VERTEX Coord2 WITHOUT OVERLAPS > 0.001;
    Line = POLYLINE WITH (STRAIGHTS, ARCS) VERTEX Coord2;
    DirectedLine EXTENDS Line = DIRECTED POLYLINE;
    LineWithAltitude = POLYLINE WITH (STRAIGHTS, ARCS) VERTEX Coord3;
    DirectedLineWithAltitude = DIRECTED POLYLINE WITH (STRAIGHTS, ARCS) VERTEX Coord3;
    
    /* minimal overlaps only (2mm) */
    SurfaceWithOverlaps2mm = SURFACE WITH (STRAIGHTS, ARCS) VERTEX Coord2 WITHOUT OVERLAPS > 0.002;
    AreaWithOverlaps2mm = AREA WITH (STRAIGHTS, ARCS) VERTEX Coord2 WITHOUT OVERLAPS > 0.002;

    Orientation = 0.00000 .. 359.99999 CIRCULAR [Units.Angle_Degree] <Coord2>;

    Accuracy = (cm, cm50, m, m10, m50, vague);
    Method = (measured, sketched, calculated);

    STRUCTURE LineStructure = 
      Line: Line;
    END LineStructure;

    STRUCTURE DirectedLineStructure =
      Line: DirectedLine;
    END DirectedLineStructure;

    STRUCTURE MultiLine =
      Lines: BAG {1..*} OF LineStructure;
    END MultiLine;

    STRUCTURE MultiDirectedLine =
      Lines: BAG {1..*} OF DirectedLineStructure;
    END MultiDirectedLine;

    STRUCTURE SurfaceStructure =
      Surface: Surface;
    END SurfaceStructure;

    STRUCTURE MultiSurface =
      Surfaces: BAG {1..*} OF SurfaceStructure;
    END MultiSurface;

END GeometryCHLV95_V1.

!! ########################################################################
','2020-03-24 16:13:58.333');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_MODEL (filename,iliversion,modelName,content,importDate) VALUES ('CHBase_Part4_ADMINISTRATIVEUNITS_20110830.ili','2.3','CHAdminCodes_V1 AdministrativeUnits_V1{ CHAdminCodes_V1 InternationalCodes_V1 Dictionaries_V1 Localisation_V1 INTERLIS} AdministrativeUnitsCH_V1{ CHAdminCodes_V1 InternationalCodes_V1 LocalisationCH_V1 AdministrativeUnits_V1 INTERLIS}','/* ########################################################################
   CHBASE - BASE MODULES OF THE SWISS FEDERATION FOR MINIMAL GEODATA MODELS
   ======
   BASISMODULE DES BUNDES           MODULES DE BASE DE LA CONFEDERATION
   FÜR MINIMALE GEODATENMODELLE     POUR LES MODELES DE GEODONNEES MINIMAUX
   
   PROVIDER: GKG/KOGIS - GCS/COSIG             CONTACT: models@geo.admin.ch
   PUBLISHED: 2011-08-30
   ########################################################################
*/

INTERLIS 2.3;

/* ########################################################################
   ########################################################################
   PART IV -- ADMINISTRATIVE UNITS
   - Package CHAdminCodes
   - Package AdministrativeUnits
   - Package AdministrativeUnitsCH
*/

!! Version    | Who   | Modification
!!------------------------------------------------------------------------------
!! 2018-02-19 | KOGIS | CHCantonCode adapted (FL and CH added) (line 34)

!! ########################################################################
!!@technicalContact=models@geo.admin.ch
!!@furtherInformation=https://www.geo.admin.ch/de/geoinformation-schweiz/geobasisdaten/geodata-models.html
TYPE MODEL CHAdminCodes_V1 (en)
  AT "http://www.geo.admin.ch" VERSION "2018-02-19" =

  DOMAIN
    CHCantonCode = (ZH,BE,LU,UR,SZ,OW,NW,GL,ZG,FR,SO,BS,BL,SH,AR,AI,SG,
                    GR,AG,TG,TI,VD,VS,NE,GE,JU,FL,CH);

    CHMunicipalityCode = 1..9999;  !! BFS-Nr

END CHAdminCodes_V1.

!! ########################################################################
!!@technicalContact=models@geo.admin.ch
!!@furtherInformation=http://www.geo.admin.ch/internet/geoportal/de/home/topics/geobasedata/models.html
MODEL AdministrativeUnits_V1 (en)
  AT "http://www.geo.admin.ch" VERSION "2011-08-30" =

  IMPORTS UNQUALIFIED INTERLIS;
  IMPORTS UNQUALIFIED CHAdminCodes_V1;
  IMPORTS UNQUALIFIED InternationalCodes_V1;
  IMPORTS Localisation_V1;
  IMPORTS Dictionaries_V1;

  TOPIC AdministrativeUnits (ABSTRACT) =

    CLASS AdministrativeElement (ABSTRACT) =
    END AdministrativeElement;

    CLASS AdministrativeUnit (ABSTRACT) EXTENDS AdministrativeElement =
    END AdministrativeUnit;

    ASSOCIATION Hierarchy =
      UpperLevelUnit (EXTERNAL) -<> {0..1} AdministrativeUnit;
      LowerLevelUnit -- AdministrativeUnit;
    END Hierarchy;

    CLASS AdministrativeUnion (ABSTRACT) EXTENDS AdministrativeElement =
    END AdministrativeUnion;

    ASSOCIATION UnionMembers =
      Union -<> AdministrativeUnion;
      Member -- AdministrativeElement; 
    END UnionMembers;

  END AdministrativeUnits;

  TOPIC Countries EXTENDS AdministrativeUnits =

    CLASS Country EXTENDS AdministrativeUnit =
      Code: MANDATORY CountryCode_ISO3166_1;
    UNIQUE Code;
    END Country;

  END Countries;

  TOPIC CountryNames EXTENDS Dictionaries_V1.Dictionaries =
    DEPENDS ON AdministrativeUnits_V1.Countries;

    STRUCTURE CountryName EXTENDS Entry =
      Code: MANDATORY CountryCode_ISO3166_1;
    END CountryName;
      
    CLASS CountryNamesTranslation EXTENDS Dictionary  =
      Entries(EXTENDED): LIST OF CountryName;
    UNIQUE Entries->Code;
    EXISTENCE CONSTRAINT
      Entries->Code REQUIRED IN AdministrativeUnits_V1.Countries.Country: Code;
    END CountryNamesTranslation;

  END CountryNames;

  TOPIC Agencies (ABSTRACT) =
    DEPENDS ON AdministrativeUnits_V1.AdministrativeUnits;

    CLASS Agency (ABSTRACT) =
    END Agency;

    ASSOCIATION Authority =
      Supervisor (EXTERNAL) -<> {1..1} Agency OR AdministrativeUnits_V1.AdministrativeUnits.AdministrativeElement;
      Agency -- Agency;
    END Authority;

    ASSOCIATION Organisation =
      Orderer (EXTERNAL) -- Agency OR AdministrativeUnits_V1.AdministrativeUnits.AdministrativeElement;
      Executor -- Agency;
    END Organisation;

  END Agencies;

END AdministrativeUnits_V1.

!! ########################################################################
!!@technicalContact=models@geo.admin.ch
!!@furtherInformation=http://www.geo.admin.ch/internet/geoportal/de/home/topics/geobasedata/models.html
MODEL AdministrativeUnitsCH_V1 (en)
  AT "http://www.geo.admin.ch" VERSION "2011-08-30" =

  IMPORTS UNQUALIFIED INTERLIS;
  IMPORTS UNQUALIFIED CHAdminCodes_V1;
  IMPORTS UNQUALIFIED InternationalCodes_V1;
  IMPORTS LocalisationCH_V1;
  IMPORTS AdministrativeUnits_V1;

  TOPIC CHCantons EXTENDS AdministrativeUnits_V1.AdministrativeUnits =
    DEPENDS ON AdministrativeUnits_V1.Countries;

    CLASS CHCanton EXTENDS AdministrativeUnit =
      Code: MANDATORY CHCantonCode;
      Name: LocalisationCH_V1.MultilingualText;
      Web: URI;
    UNIQUE Code;
    END CHCanton;

    ASSOCIATION Hierarchy (EXTENDED) =
      UpperLevelUnit (EXTENDED, EXTERNAL) -<> {1..1} AdministrativeUnits_V1.Countries.Country;
      LowerLevelUnit (EXTENDED) -- CHCanton;
    MANDATORY CONSTRAINT
      UpperLevelUnit->Code == "CHE";
    END Hierarchy;

  END CHCantons;

  TOPIC CHDistricts EXTENDS AdministrativeUnits_V1.AdministrativeUnits =
    DEPENDS ON AdministrativeUnitsCH_V1.CHCantons;

    CLASS CHDistrict EXTENDS AdministrativeUnit =
      ShortName: MANDATORY TEXT*20;
      Name: LocalisationCH_V1.MultilingualText;
      Web: MANDATORY URI;
    END CHDistrict;

    ASSOCIATION Hierarchy (EXTENDED) =
      UpperLevelUnit (EXTENDED, EXTERNAL) -<> {1..1} AdministrativeUnitsCH_V1.CHCantons.CHCanton;
      LowerLevelUnit (EXTENDED) -- CHDistrict;
    UNIQUE UpperLevelUnit->Code, LowerLevelUnit->ShortName;
    END Hierarchy;

  END CHDistricts;

  TOPIC CHMunicipalities EXTENDS AdministrativeUnits_V1.AdministrativeUnits =
    DEPENDS ON AdministrativeUnitsCH_V1.CHCantons;
    DEPENDS ON AdministrativeUnitsCH_V1.CHDistricts;

    CLASS CHMunicipality EXTENDS AdministrativeUnit =
      Code: MANDATORY CHMunicipalityCode;
      Name: LocalisationCH_V1.MultilingualText;
      Web: URI;
    UNIQUE Code;
    END CHMunicipality;

    ASSOCIATION Hierarchy (EXTENDED) =
      UpperLevelUnit (EXTENDED, EXTERNAL) -<> {1..1} AdministrativeUnitsCH_V1.CHCantons.CHCanton
      OR AdministrativeUnitsCH_V1.CHDistricts.CHDistrict;
      LowerLevelUnit (EXTENDED) -- CHMunicipality;
    END Hierarchy;

  END CHMunicipalities;

  TOPIC CHAdministrativeUnions EXTENDS AdministrativeUnits_V1.AdministrativeUnits =
    DEPENDS ON AdministrativeUnits_V1.Countries;
    DEPENDS ON AdministrativeUnitsCH_V1.CHCantons;
    DEPENDS ON AdministrativeUnitsCH_V1.CHDistricts;
    DEPENDS ON AdministrativeUnitsCH_V1.CHMunicipalities;

    CLASS AdministrativeUnion (EXTENDED) =
    OID AS UUIDOID;
      Name: LocalisationCH_V1.MultilingualText;
      Web: URI;
      Description: LocalisationCH_V1.MultilingualMText;
    END AdministrativeUnion;

  END CHAdministrativeUnions;

  TOPIC CHAgencies EXTENDS AdministrativeUnits_V1.Agencies =
    DEPENDS ON AdministrativeUnits_V1.Countries;
    DEPENDS ON AdministrativeUnitsCH_V1.CHCantons;
    DEPENDS ON AdministrativeUnitsCH_V1.CHDistricts;
    DEPENDS ON AdministrativeUnitsCH_V1.CHMunicipalities;

    CLASS Agency (EXTENDED) =
    OID AS UUIDOID;
      Name: LocalisationCH_V1.MultilingualText;
      Web: URI;
      Description: LocalisationCH_V1.MultilingualMText;
    END Agency;

  END CHAgencies;

END AdministrativeUnitsCH_V1.

!! ########################################################################
','2020-03-24 16:13:58.333');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_MODEL (filename,iliversion,modelName,content,importDate) VALUES ('SO_ALW_Strukturverbesserungen_20190912.ili','2.3','SO_ALW_Strukturverbesserungen_20190912{ GeometryCHLV95_V1 CHAdminCodes_V1 Units}','INTERLIS 2.3;

/** ------------------------------------------------------------------------------
 * Version    | wer | Änderung
 *  ------------------------------------------------------------------------------
 * 2019-09-05 | al  | Initialversion
 * 2020-02-13 | an  | Einarbeitung Feedback Johannes Zehnder nach Besprechung
 *                  | - Klasse (Abstract) "Raeumliches_Element", Aenderung folgender Attribute:
 *                  |   * WerksID: Aenderung in Zeichenkette*20 statt Domain WerksID
 *                  |   * UnterhaltsID: Aenderung in Zeichenkette*20 statt Domain UnterhaltsID
 *                  | - Klasse "Wegebau_Linie", neue Attribute:
 *                  |   * Bezeichnung (Zeichenkette 50)
 *                  |   * Techn_Schwierigkeit (Aufzählungstyp Technische_Schwierigkeit)
 *                  |   * Anteil_LW (Prozent)
 *                  |   * laenge_gerundet (numerisch, soll auf 5m gerundet werden)
 *                  | - Klasse "Projekt", Aenderung folgender Attribute:
 *                  |   * Geschaeftsnummerdef: Aenderung in Zeichenkette*10 statt Domain Geschaeftsnummerdef
 *                  | - Klasse "Dokument": bei Attribut "Dateipfad" Verlängerung auf 255 Zeichen
 *                  | - Domain "Funktionstyp": Korrektur Schreibfehler
 *                  | - Association "Beizugsgebiet_Projekt": Korrektur Schreibfehler
 *                  | - Klassen "Genossenschaft", "Wegebau_Linie", "Werkseigentum", "Dokument", "Wiederherstellung_Punkt"
 *                  |   und "Oekologie_Punkt": diverse Attribute gemäss QS-Dokument als MANDATORY gesetzt
 * 2020-02-24 | an  | OID AS INTERLIS.UUIDOID bei den Topics hinzugefügt
 * ==============================================================================
 * 
 * Erweiterung des Modells Strukturverbesserungen_LV95_V2. Da keine Beziehungen modelliert sind, konnte das Bundes-Modell nicht erweitert werden.
 */
MODEL SO_ALW_Strukturverbesserungen_20190912 (de)
AT "http://www.geo.so.ch/models"
VERSION "2019-09-05"  // eugr // =
  IMPORTS GeometryCHLV95_V1,Units,CHAdminCodes_V1;

  DOMAIN

    Datum = FORMAT INTERLIS.XMLDate "1800-01-01" .. "2099-12-31";

    Dokumententyp = (
      Bericht,
      Unterhaltsreglement,
      Statuten,
      Regierungsratsbeschluss,
      Bild
    );

    Funktionstyp = (
      Nebenwege_nicht_fahrbar,
      Nebenwege_fahrbar,
      Uebrige_Hauptwege,
      Hofzufahrten,
      Berghofzufahrten
    );

    Genossenschaften (FINAL) = (
      Flurgenossenschaft,
      Unterhaltsgenossenschaft,
      Bewaesserungsgenossenschaft
    );

    Oekologie_Punkte = (
      Einzelbaum,
      Andere_Massnahme
    );

    Projekt (FINAL) = (
      PRE,
      Landumlegung,
      Uebrige,
      Projektinitiative,
      Grundlagen_generell,
      Landwirtschaftliche_Planung,
      Gemeinschaftliche_Initiative_zur_Senkung_der_Produktionskosten
    );

    Stand = (
      Regulierungsbeduerftige_Flaechen_vorhanden,
      Umfassende_SV_Massnahmen_in_Arbeit,
      Gueterregulierung_in_Arbeit,
      Gueterregulierung_ausgefuehrt,
      Keine_Gueterregulierung_notwendig
    );

    Technische_Schwierigkeit (FINAL) = (
      nicht_relevant,
      gering,
      maessig,
      gross
    );

    Wiederherstellung_Punkte = (
      Holzkasten,
      Weitere_Boeschungssicherungsmassnahmen
    );

    Beizugsgebiete (FINAL) = (
      Alter_Bestand,
      Neuer_Bestand,
      uebrige
    );

    Bautyp (FINAL) = (
      Neubau,
      PWI,
      Ausbau_Ersatz,
      Wiederherstellung
    );

    Oekologische_Flaechen (FINAL) = (
      Biotop,
      Andere_Massnahme,
      Perimeter_Vernetzungsprojekt,
      Hochstammobstanlagen
    );

    Oekologie_Linien (FINAL) = (
      Revitalisierung_Gewaesser,
      Ausdolung_Gewaesser,
      Hecke,
      Waldrandaufwertung,
      Bach_und_Ufervegetation
    );

    Oekologie_Trockenmauern (FINAL) = (
      freistehende_Trockenmauer,
      Terrasse_Trockenmauer
    );

    Status (FINAL) = (
      projektiert,
      in_Ausfuehrung,
      ausgefuehrt,
      sistiert,
      untergegangen,
      unbekannt
    );

    Wege (FINAL) = (
      Wanderweg_bauliche_Massnahmen,
      Viehtrieb_Reitweg,
      Tunnel,
      Aufhebung_von_Wegen,
      Rasenweg,
      Spurweg_Rasengitter,
      Spurweg_Beton,
      Spurweg_Bitumen,
      Belagseinbau_auf_Kiesweg,
      Betonweg,
      Bituminoeser_Weg,
      Kiesweg
    );

    Seilbahnen_Linien (FINAL) = (
      Monorail_u_aehnliche,
      Materialseilbahn,
      Personenseilbahn,
      Abbruch_Seilbahn
    );

    Seilbahnen_Punkte (FINAL) = (
      Station,
      Abbruch_Station
    );

    Entw_Bodenstruktur_Flaechen (FINAL) = (
      Rutschhangstabiliserung,
      Entwaesserung_FFF,
      Entwaesserung_uebrige_Flaechen,
      Aufbringung_Humus,
      Bodenstrukturverbesserung,
      Wiederherstellung_Kulturland
    );

    Entw_Bodenstruktur_Linien (FINAL) = (
      Hauptleitung_Ableitung,
      Drainageleitung_perforiert,
      Entwaesserungsgraben
    );

    Bewaesserung_Linien (FINAL) = (
      Stollen,
      Kanal,
      Verteilleitung,
      Zuleitung_Bewaesserung
    );

    Bewaesserung_Flaechen (FINAL) = (
      Tropfen_Mikrobewaesserung,
      Beregnungsanlage,
      Traditionelle_Berieselung
    );

    Bewaesserung_Punkte (FINAL) = (
      Fassung_Entsander,
      Pumpwerk,
      Speicher
    );

    Wasserversorgung_Punkte (FINAL) = (
      Grundwasserfassung,
      Quellfassung_inkl_Brunnenstube,
      Traenkeanlage,
      Aufbereitungsanlage,
      Pumpwerk,
      Fernwirkanlage,
      Reservoir
    );

    Elektrizitaet_Punkte (FINAL) = (
      Trafostation,
      Stromerzeugung
    );

    Elektrizitaet_Linien (FINAL) = (
      Kabel_unterirdisch,
      Abbruch_Leitung,
      Freileitung
    );

    Hochbau_Punkte (FINAL) = (
      Anlage_fuer_gewerblichen_Kleinbetrieb,
      Gemeinschaftliche_Anlage_fuer_die_Verabeitung_Lagerung_und_Verkauf,
      Gemeinschaftliche_Anlage_fuer_die_Milchverarbeitung,
      Oekonomiegebaeude,
      Alpgebaeude,
      Gemeinschaftliche_Anlage_zur_Produktion_erneuerbarer_Energie_aus_Biomasse,
      Anlage_fuer_produzierenden_Gartenbaubetrieb,
      Anlage_zur_Diversifizierung,
      Anlage_fuer_einheimischen_Fischfang_und_Fischzucht,
      Anlage_fuer_Spezialkulturen,
      Gefluegelstall,
      Schweinestall,
      Wohngebaeude,
      PRE_andere_Gebaeude_und_Einrichtungen
    );

  TOPIC Stand_Gueterregulierung =
    OID AS INTERLIS.UUIDOID;

    CLASS Stand_Gueterregulierung =
      /** BFSNr. einer Gemeinde
       */
      BFSNr : MANDATORY CHAdminCodes_V1.CHMunicipalityCode;
      /** Stand der Güterregulierung
       */
      Stand : MANDATORY SO_ALW_Strukturverbesserungen_20190912.Stand;
    END Stand_Gueterregulierung;

  END Stand_Gueterregulierung;

  TOPIC RaeumlicheElemente =
    OID AS INTERLIS.UUIDOID;

    CLASS Dokument =
      Titel : MANDATORY TEXT*30;
      Typ : MANDATORY SO_ALW_Strukturverbesserungen_20190912.Dokumententyp;
      Dateipfad : MANDATORY TEXT*255;
    END Dokument;

    CLASS Genossenschaft =
      Typ : MANDATORY SO_ALW_Strukturverbesserungen_20190912.Genossenschaften;
      Name : MANDATORY TEXT*100;
      Gruendungsdatum : MANDATORY SO_ALW_Strukturverbesserungen_20190912.Datum;
      Genehmigungsdatum : MANDATORY SO_ALW_Strukturverbesserungen_20190912.Datum;
      Reorganisationsdatum : SO_ALW_Strukturverbesserungen_20190912.Datum;
      Aufloesungsdatum : SO_ALW_Strukturverbesserungen_20190912.Datum;
      Bemerkung : TEXT*255;
      Geometrie : MANDATORY GeometryCHLV95_V1.MultiSurface;
      Unterhaltsobjekt : TEXT*50;
    END Genossenschaft;

    CLASS Raeumliches_Element (ABSTRACT) =
      Status : MANDATORY SO_ALW_Strukturverbesserungen_20190912.Status;
      Status_Datum : MANDATORY SO_ALW_Strukturverbesserungen_20190912.Datum;
      Bauabnahme_Datum : SO_ALW_Strukturverbesserungen_20190912.Datum;
      WerksID : TEXT*20;
      UnterhaltsID : TEXT*20;
    END Raeumliches_Element;

    CLASS Werkseigentum =
      Name : MANDATORY TEXT*50;
      Adresse : MANDATORY TEXT*50;
    END Werkseigentum;

    CLASS Oekologie_Punkt
    EXTENDS Raeumliches_Element =
      Typ : MANDATORY SO_ALW_Strukturverbesserungen_20190912.Oekologie_Punkte;
      Geometrie : MANDATORY GeometryCHLV95_V1.Coord2;
    END Oekologie_Punkt;

    CLASS Wegebau_Linie
    EXTENDS Raeumliches_Element =
      Typ : MANDATORY SO_ALW_Strukturverbesserungen_20190912.Wege;
      Bautyp : MANDATORY SO_ALW_Strukturverbesserungen_20190912.Bautyp;
      /** in Meter
       */
      Fahrbahnbreite : 0.0 .. 10.0 [INTERLIS.m];
      Geometrie : MANDATORY GeometryCHLV95_V1.MultiLine;
      Funktionstyp : MANDATORY SO_ALW_Strukturverbesserungen_20190912.Funktionstyp;
      Bezeichnung : TEXT*50;
      /** Angaben in Prozent (0-100)
       */
      Anteil_LW : 0 .. 100 [Units.Percent];
      Techn_Schwierigkeit : SO_ALW_Strukturverbesserungen_20190912.Technische_Schwierigkeit;
      /** auf 5m gerundet
       */
      laenge_gerundet : 0 .. 1000000 [INTERLIS.m];
    END Wegebau_Linie;

    CLASS Wiederherstellung_Punkt
    EXTENDS Raeumliches_Element =
      Typ : MANDATORY SO_ALW_Strukturverbesserungen_20190912.Wiederherstellung_Punkte;
      Geometrie : MANDATORY GeometryCHLV95_V1.Coord2;
    END Wiederherstellung_Punkt;

    CLASS Wege_Bruecke_Lehnenviadukt
    EXTENDS Raeumliches_Element =
      Fahrbahnbreite : 0.0 .. 10.0 [INTERLIS.m];
      Laenge : 0.0 .. 100000000.0 [INTERLIS.m];
      Bautyp : MANDATORY SO_ALW_Strukturverbesserungen_20190912.Bautyp;
      Tonnage : 0.0 .. 100.0 [Units.t];
      Material (FINAL) : MANDATORY (
        Beton,
        Holz,
        uebrige
      );
      Widerlager : BOOLEAN;
      Geometrie : MANDATORY GeometryCHLV95_V1.Coord2;
    END Wege_Bruecke_Lehnenviadukt;

    CLASS Seilbahn_Linie
    EXTENDS Raeumliches_Element =
      Typ : MANDATORY SO_ALW_Strukturverbesserungen_20190912.Seilbahnen_Linien;
      Bautyp : MANDATORY SO_ALW_Strukturverbesserungen_20190912.Bautyp;
      Geometrie : MANDATORY GeometryCHLV95_V1.MultiLine;
    END Seilbahn_Linie;

    CLASS Seilbahn_Station
    EXTENDS Raeumliches_Element =
      Typ : MANDATORY SO_ALW_Strukturverbesserungen_20190912.Seilbahnen_Punkte;
      Bautyp : MANDATORY SO_ALW_Strukturverbesserungen_20190912.Bautyp;
      Geometrie : MANDATORY GeometryCHLV95_V1.Coord2;
    END Seilbahn_Station;

    CLASS Entw_Bodenstruktur_Flaeche
    EXTENDS Raeumliches_Element =
      Typ : MANDATORY SO_ALW_Strukturverbesserungen_20190912.Entw_Bodenstruktur_Flaechen;
      Bautyp : MANDATORY SO_ALW_Strukturverbesserungen_20190912.Bautyp;
      Geometrie : MANDATORY GeometryCHLV95_V1.MultiSurface;
    END Entw_Bodenstruktur_Flaeche;

    CLASS Entw_Bodenstruktur_Linie
    EXTENDS Raeumliches_Element =
      Typ : MANDATORY SO_ALW_Strukturverbesserungen_20190912.Entw_Bodenstruktur_Linien;
      Bautyp : MANDATORY SO_ALW_Strukturverbesserungen_20190912.Bautyp;
      Geometrie : MANDATORY GeometryCHLV95_V1.MultiLine;
    END Entw_Bodenstruktur_Linie;

    CLASS Entw_Bodenstruktur_Pumpwerk
    EXTENDS Raeumliches_Element =
      Geometrie : MANDATORY GeometryCHLV95_V1.Coord2;
      Bautyp : MANDATORY SO_ALW_Strukturverbesserungen_20190912.Bautyp;
    END Entw_Bodenstruktur_Pumpwerk;

    CLASS Bew_Flaechen_Bewaesserung
    EXTENDS Raeumliches_Element =
      Typ : MANDATORY SO_ALW_Strukturverbesserungen_20190912.Bewaesserung_Flaechen;
      Bautyp : MANDATORY SO_ALW_Strukturverbesserungen_20190912.Bautyp;
      Geometrie : MANDATORY GeometryCHLV95_V1.MultiSurface;
    END Bew_Flaechen_Bewaesserung;

    CLASS Bewaesserung_Linie
    EXTENDS Raeumliches_Element =
      Typ : MANDATORY SO_ALW_Strukturverbesserungen_20190912.Bewaesserung_Linien;
      Bautyp : MANDATORY SO_ALW_Strukturverbesserungen_20190912.Bautyp;
      Geometrie : MANDATORY GeometryCHLV95_V1.MultiLine;
    END Bewaesserung_Linie;

    CLASS Bewaesserung_Punkt
    EXTENDS Raeumliches_Element =
      Typ : MANDATORY SO_ALW_Strukturverbesserungen_20190912.Bewaesserung_Punkte;
      Bautyp : MANDATORY SO_ALW_Strukturverbesserungen_20190912.Bautyp;
      Geometrie : MANDATORY GeometryCHLV95_V1.Coord2;
    END Bewaesserung_Punkt;

    CLASS Wasserversorgung_Punkt
    EXTENDS Raeumliches_Element =
      Typ : MANDATORY SO_ALW_Strukturverbesserungen_20190912.Wasserversorgung_Punkte;
      Bautyp : MANDATORY SO_ALW_Strukturverbesserungen_20190912.Bautyp;
      Geometrie : MANDATORY GeometryCHLV95_V1.Coord2;
    END Wasserversorgung_Punkt;

    CLASS WV_Leitung_Wasserversorgung
    EXTENDS Raeumliches_Element =
      Geometrie : MANDATORY GeometryCHLV95_V1.MultiLine;
      Bautyp : MANDATORY SO_ALW_Strukturverbesserungen_20190912.Bautyp;
    END WV_Leitung_Wasserversorgung;

    CLASS EV_Punkt
    EXTENDS Raeumliches_Element =
      Typ : MANDATORY SO_ALW_Strukturverbesserungen_20190912.Elektrizitaet_Punkte;
      Bautyp : MANDATORY SO_ALW_Strukturverbesserungen_20190912.Bautyp;
      Geometrie : MANDATORY GeometryCHLV95_V1.Coord2;
    END EV_Punkt;

    CLASS EV_Linie
    EXTENDS Raeumliches_Element =
      Typ : MANDATORY SO_ALW_Strukturverbesserungen_20190912.Elektrizitaet_Linien;
      Bautyp : MANDATORY SO_ALW_Strukturverbesserungen_20190912.Bautyp;
      Geometrie : MANDATORY GeometryCHLV95_V1.MultiLine;
    END EV_Linie;

    CLASS Milchleitung_Leitung
    EXTENDS Raeumliches_Element =
      Bautyp : MANDATORY SO_ALW_Strukturverbesserungen_20190912.Bautyp;
      Geometrie : MANDATORY GeometryCHLV95_V1.MultiLine;
    END Milchleitung_Leitung;

    CLASS Milchleitung_Lokal
    EXTENDS Raeumliches_Element =
      Bautyp : MANDATORY SO_ALW_Strukturverbesserungen_20190912.Bautyp;
      Geometrie : MANDATORY GeometryCHLV95_V1.Coord2;
    END Milchleitung_Lokal;

    CLASS Oekologie_Linie
    EXTENDS Raeumliches_Element =
      Bautyp : MANDATORY SO_ALW_Strukturverbesserungen_20190912.Bautyp;
      Typ : MANDATORY SO_ALW_Strukturverbesserungen_20190912.Oekologie_Linien;
      Geometrie : MANDATORY GeometryCHLV95_V1.MultiLine;
    END Oekologie_Linie;

    CLASS Oekologie_Trockenmauer
    EXTENDS Raeumliches_Element =
      Typ : MANDATORY SO_ALW_Strukturverbesserungen_20190912.Oekologie_Trockenmauern;
      Hoehe : 0.0 .. 50.0 [INTERLIS.m];
      Bautyp : MANDATORY SO_ALW_Strukturverbesserungen_20190912.Bautyp;
      Geometrie : MANDATORY GeometryCHLV95_V1.MultiLine;
    END Oekologie_Trockenmauer;

    CLASS Oekologie_Flaeche
    EXTENDS Raeumliches_Element =
      Typ : MANDATORY SO_ALW_Strukturverbesserungen_20190912.Oekologische_Flaechen;
      Bautyp : MANDATORY SO_ALW_Strukturverbesserungen_20190912.Bautyp;
      Geometrie : MANDATORY GeometryCHLV95_V1.MultiSurface;
    END Oekologie_Flaeche;

    CLASS Hochbau
    EXTENDS Raeumliches_Element =
      Typ : MANDATORY SO_ALW_Strukturverbesserungen_20190912.Hochbau_Punkte;
      Geometrie : MANDATORY GeometryCHLV95_V1.Coord2;
    END Hochbau;

    CLASS Beizugsgebiet =
      Geometrie : MANDATORY GeometryCHLV95_V1.MultiSurface;
      Datum_Nachfuehrung : SO_ALW_Strukturverbesserungen_20190912.Datum;
      Typ : MANDATORY SO_ALW_Strukturverbesserungen_20190912.Beizugsgebiete;
    END Beizugsgebiet;

    /** Kantonale Projekte werden erfasst. In seltenen Fällen können zwei kantonale Projekte die gleiche Geschäftsnummer haben.
     */
    CLASS Projekt =
      Geometrie : MANDATORY GeometryCHLV95_V1.Coord2;
      Projekttypen : MANDATORY SO_ALW_Strukturverbesserungen_20190912.Projekt;
      Geschaeftsnummer : TEXT*10;
      Kantonsnummer : TEXT*40;
      Name : TEXT*50;
      UNIQUE Kantonsnummer;
    END Projekt;

    /** Zum Wiederherstellung_Punkt können mehrere Bilder erfasst werden z.B. bei Unwetterschäden
     */
    ASSOCIATION Wiederherstellungs_Punkt_Bild =
      Wiederherstellungs_Punkt -- {1} Wiederherstellung_Punkt;
      Bild -- {0..*} Dokument;
    END Wiederherstellungs_Punkt_Bild;

    ASSOCIATION Genossenschaft_Dokument =
      Dokument -- {0..*} Dokument;
      Genossenschaft -- {1..*} Genossenschaft;
    END Genossenschaft_Dokument;

    ASSOCIATION Genossenschaft_Element =
      Genossenschaft_Element -- {0..*} Genossenschaft;
      Element_Genossenschaft -- {0..*} Raeumliches_Element;
    END Genossenschaft_Element;

    ASSOCIATION Werkeigentum_Element =
      Element -- {0..*} Raeumliches_Element;
      Werkeigentum -- {0..1} Werkseigentum;
    END Werkeigentum_Element;

    ASSOCIATION Beizugsgebiet_Projekt =
      Beizugsgebiet -- {0..*} Beizugsgebiet;
      Projekt -- {0..*} Projekt;
    END Beizugsgebiet_Projekt;

    ASSOCIATION Projekt_Element =
      Projekt -- {1} Projekt;
      Massnahme -- {0..*} Raeumliches_Element;
    END Projekt_Element;

  END RaeumlicheElemente;

END SO_ALW_Strukturverbesserungen_20190912.
','2020-03-24 16:13:58.333');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_MODEL (filename,iliversion,modelName,content,importDate) VALUES ('CoordSys-20151124.ili','2.3','CoordSys','!! File CoordSys.ili Release 2015-11-24

INTERLIS 2.3;

!! 2015-11-24 Cardinalities adapted (line 122, 123, 124, 132, 133, 134, 142, 143,
!!                                   148, 149, 163, 164, 168, 169, 206 and 207)
!!@precursorVersion = 2005-06-16

REFSYSTEM MODEL CoordSys (en) AT "http://www.interlis.ch/models"
  VERSION "2015-11-24" =

  UNIT
    Angle_Degree = 180 / PI [INTERLIS.rad];
    Angle_Minute = 1 / 60 [Angle_Degree];
    Angle_Second = 1 / 60 [Angle_Minute];

  STRUCTURE Angle_DMS_S =
    Degrees: -180 .. 180 CIRCULAR [Angle_Degree];
    CONTINUOUS SUBDIVISION Minutes: 0 .. 59 CIRCULAR [Angle_Minute];
    CONTINUOUS SUBDIVISION Seconds: 0.000 .. 59.999 CIRCULAR [Angle_Second];
  END Angle_DMS_S;

  DOMAIN
    Angle_DMS = FORMAT BASED ON Angle_DMS_S (Degrees ":" Minutes ":" Seconds);
    Angle_DMS_90 EXTENDS Angle_DMS = "-90:00:00.000" .. "90:00:00.000";


  TOPIC CoordsysTopic =

    !! Special space aspects to be referenced
    !! **************************************

    CLASS Ellipsoid EXTENDS INTERLIS.REFSYSTEM =
      EllipsoidAlias: TEXT*70;
      SemiMajorAxis: MANDATORY 6360000.0000 .. 6390000.0000 [INTERLIS.m];
      InverseFlattening: MANDATORY 0.00000000 .. 350.00000000;
      !! The inverse flattening 0 characterizes the 2-dim sphere
      Remarks: TEXT*70;
    END Ellipsoid;

    CLASS GravityModel EXTENDS INTERLIS.REFSYSTEM =
      GravityModAlias: TEXT*70;
      Definition: TEXT*70;
    END GravityModel;

    CLASS GeoidModel EXTENDS INTERLIS.REFSYSTEM =
      GeoidModAlias: TEXT*70;
      Definition: TEXT*70;
    END GeoidModel;


    !! Coordinate systems for geodetic purposes
    !! ****************************************

    STRUCTURE LengthAXIS EXTENDS INTERLIS.AXIS =
      ShortName: TEXT*12;
      Description: TEXT*255;
    PARAMETER
      Unit (EXTENDED): NUMERIC [INTERLIS.LENGTH];
    END LengthAXIS;

    STRUCTURE AngleAXIS EXTENDS INTERLIS.AXIS =
      ShortName: TEXT*12;
      Description: TEXT*255;
    PARAMETER
      Unit (EXTENDED): NUMERIC [INTERLIS.ANGLE];
    END AngleAXIS;

    CLASS GeoCartesian1D EXTENDS INTERLIS.COORDSYSTEM =
      Axis (EXTENDED): LIST {1} OF LengthAXIS;
    END GeoCartesian1D;

    CLASS GeoHeight EXTENDS GeoCartesian1D =
      System: MANDATORY (
        normal,
        orthometric,
        ellipsoidal,
        other);
      ReferenceHeight: MANDATORY -10000.000 .. +10000.000 [INTERLIS.m];
      ReferenceHeightDescr: TEXT*70;
    END GeoHeight;

    ASSOCIATION HeightEllips =
      GeoHeightRef -- {*} GeoHeight;
      EllipsoidRef -- {1} Ellipsoid;
    END HeightEllips;

    ASSOCIATION HeightGravit =
      GeoHeightRef -- {*} GeoHeight;
      GravityRef -- {1} GravityModel;
    END HeightGravit;

    ASSOCIATION HeightGeoid =
      GeoHeightRef -- {*} GeoHeight;
      GeoidRef -- {1} GeoidModel;
    END HeightGeoid;

    CLASS GeoCartesian2D EXTENDS INTERLIS.COORDSYSTEM =
      Definition: TEXT*70;
      Axis (EXTENDED): LIST {2} OF LengthAXIS;
    END GeoCartesian2D;

    CLASS GeoCartesian3D EXTENDS INTERLIS.COORDSYSTEM =
      Definition: TEXT*70;
      Axis (EXTENDED): LIST {3} OF LengthAXIS;
    END GeoCartesian3D;

    CLASS GeoEllipsoidal EXTENDS INTERLIS.COORDSYSTEM =
      Definition: TEXT*70;
      Axis (EXTENDED): LIST {2} OF AngleAXIS;
    END GeoEllipsoidal;

    ASSOCIATION EllCSEllips =
      GeoEllipsoidalRef -- {*} GeoEllipsoidal;
      EllipsoidRef -- {1} Ellipsoid;
    END EllCSEllips;


    !! Mappings between coordinate systems
    !! ***********************************

    ASSOCIATION ToGeoEllipsoidal =
      From -- {0..*} GeoCartesian3D;
      To -- {0..*} GeoEllipsoidal;
      ToHeight -- {0..*} GeoHeight;
    MANDATORY CONSTRAINT
      ToHeight -> System == #ellipsoidal;
    MANDATORY CONSTRAINT
      To -> EllipsoidRef -> Name == ToHeight -> EllipsoidRef -> Name;
    END ToGeoEllipsoidal;

    ASSOCIATION ToGeoCartesian3D =
      From2 -- {0..*} GeoEllipsoidal;
      FromHeight-- {0..*} GeoHeight;
      To3 -- {0..*} GeoCartesian3D;
    MANDATORY CONSTRAINT
      FromHeight -> System == #ellipsoidal;
    MANDATORY CONSTRAINT
      From2 -> EllipsoidRef -> Name == FromHeight -> EllipsoidRef -> Name;
    END ToGeoCartesian3D;

    ASSOCIATION BidirectGeoCartesian2D =
      From -- {0..*} GeoCartesian2D;
      To -- {0..*} GeoCartesian2D;
    END BidirectGeoCartesian2D;

    ASSOCIATION BidirectGeoCartesian3D =
      From -- {0..*} GeoCartesian3D;
      To2 -- {0..*} GeoCartesian3D;
      Precision: MANDATORY (
        exact,
        measure_based);
      ShiftAxis1: MANDATORY -10000.000 .. 10000.000 [INTERLIS.m];
      ShiftAxis2: MANDATORY -10000.000 .. 10000.000 [INTERLIS.m];
      ShiftAxis3: MANDATORY -10000.000 .. 10000.000 [INTERLIS.m];
      RotationAxis1: Angle_DMS_90;
      RotationAxis2: Angle_DMS_90;
      RotationAxis3: Angle_DMS_90;
      NewScale: 0.000001 .. 1000000.000000;
    END BidirectGeoCartesian3D;

    ASSOCIATION BidirectGeoEllipsoidal =
      From4 -- {0..*} GeoEllipsoidal;
      To4 -- {0..*} GeoEllipsoidal;
    END BidirectGeoEllipsoidal;

    ASSOCIATION MapProjection (ABSTRACT) =
      From5 -- {0..*} GeoEllipsoidal;
      To5 -- {0..*} GeoCartesian2D;
      FromCo1_FundPt: MANDATORY Angle_DMS_90;
      FromCo2_FundPt: MANDATORY Angle_DMS_90;
      ToCoord1_FundPt: MANDATORY -10000000 .. +10000000 [INTERLIS.m];
      ToCoord2_FundPt: MANDATORY -10000000 .. +10000000 [INTERLIS.m];
    END MapProjection;

    ASSOCIATION TransverseMercator EXTENDS MapProjection =
    END TransverseMercator;

    ASSOCIATION SwissProjection EXTENDS MapProjection =
      IntermFundP1: MANDATORY Angle_DMS_90;
      IntermFundP2: MANDATORY Angle_DMS_90;
    END SwissProjection;

    ASSOCIATION Mercator EXTENDS MapProjection =
    END Mercator;

    ASSOCIATION ObliqueMercator EXTENDS MapProjection =
    END ObliqueMercator;

    ASSOCIATION Lambert EXTENDS MapProjection =
    END Lambert;

    ASSOCIATION Polyconic EXTENDS MapProjection =
    END Polyconic;

    ASSOCIATION Albus EXTENDS MapProjection =
    END Albus;

    ASSOCIATION Azimutal EXTENDS MapProjection =
    END Azimutal;

    ASSOCIATION Stereographic EXTENDS MapProjection =
    END Stereographic;

    ASSOCIATION HeightConversion =
      FromHeight -- {0..*} GeoHeight;
      ToHeight -- {0..*} GeoHeight;
      Definition: TEXT*70;
    END HeightConversion;

  END CoordsysTopic;

END CoordSys.

','2020-03-24 16:13:58.333');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.createMetaInfo','True');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.beautifyEnumDispName','underscore');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.arrayTrafo','coalesce');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.nameOptimization','topic');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.localisedTrafo','expand');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.numericCheckConstraints','create');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.sender','ili2pg-4.4.1-e9ddc1895e1a7f13ff029644af1442ddb79dcaa4');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.createForeignKey','yes');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.sqlgen.createGeomIndex','True');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.defaultSrsAuthority','EPSG');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.defaultSrsCode','2056');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.uuidDefaultValue','uuid_generate_v4()');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.StrokeArcs','enable');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.multiLineTrafo','coalesce');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.interlis.ili2c.ilidirs','%ILI_FROM_DB;%XTF_DIR;http://models.interlis.ch/;%JAR_DIR');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.createForeignKeyIndex','yes');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.jsonTrafo','coalesce');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.createEnumDefs','multiTable');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.uniqueConstraints','create');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.maxSqlNameLength','60');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.inheritanceTrafo','smart2');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.catalogueRefTrafo','coalesce');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.multiPointTrafo','coalesce');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.multiSurfaceTrafo','coalesce');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.multilingualTrafo','expand');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('AdministrativeUnitsCH_V1.CHAgencies.Agency.Name','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('AdministrativeUnitsCH_V1.CHAgencies.Agency.Name','ili2db.ili.attrCardinalityMin','0');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Bewaesserung_Linie.Bautyp','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Bewaesserung_Linie.Bautyp','ili2db.ili.attrCardinalityMin','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('AdministrativeUnitsCH_V1.CHMunicipalities.Hierarchy.UpperLevelUnit','ili2db.ili.assocCardinalityMin','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('AdministrativeUnitsCH_V1.CHMunicipalities.Hierarchy.UpperLevelUnit','ili2db.ili.assocCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('AdministrativeUnitsCH_V1.CHMunicipalities.Hierarchy.UpperLevelUnit','ili2db.ili.assocKind','AGGREGATE');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('AdministrativeUnits_V1','furtherInformation','http://www.geo.admin.ch/internet/geoportal/de/home/topics/geobasedata/models.html');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('AdministrativeUnits_V1','technicalContact','models@geo.admin.ch');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Wasserversorgung_Punkt.Typ','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Wasserversorgung_Punkt.Typ','ili2db.ili.attrCardinalityMin','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('AdministrativeUnits_V1.AdministrativeUnits.UnionMembers.Union','ili2db.ili.assocCardinalityMin','0');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('AdministrativeUnits_V1.AdministrativeUnits.UnionMembers.Union','ili2db.ili.assocCardinalityMax','*');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('AdministrativeUnits_V1.AdministrativeUnits.UnionMembers.Union','ili2db.ili.assocKind','AGGREGATE');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.Status','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.Status','ili2db.ili.attrCardinalityMin','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('AdministrativeUnits_V1.CountryNames.CountryName.Code','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('AdministrativeUnits_V1.CountryNames.CountryName.Code','ili2db.ili.attrCardinalityMin','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Seilbahn_Linie.Typ','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Seilbahn_Linie.Typ','ili2db.ili.attrCardinalityMin','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Bewaesserung_Linie.Geometrie','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Bewaesserung_Linie.Geometrie','ili2db.ili.attrCardinalityMin','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Genossenschaft.Genehmigungsdatum','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Genossenschaft.Genehmigungsdatum','ili2db.ili.attrCardinalityMin','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Wiederherstellungs_Punkt_Bild.Bild','ili2db.ili.assocCardinalityMin','0');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Wiederherstellungs_Punkt_Bild.Bild','ili2db.ili.assocCardinalityMax','*');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Wiederherstellungs_Punkt_Bild.Bild','ili2db.ili.assocKind','ASSOCIATE');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('AdministrativeUnitsCH_V1.CHCantons.CHCanton.Code','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('AdministrativeUnitsCH_V1.CHCantons.CHCanton.Code','ili2db.ili.attrCardinalityMin','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Wegebau_Linie.Funktionstyp','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Wegebau_Linie.Funktionstyp','ili2db.ili.attrCardinalityMin','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Bew_Flaechen_Bewaesserung.Geometrie','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Bew_Flaechen_Bewaesserung.Geometrie','ili2db.ili.attrCardinalityMin','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Beizugsgebiet_Projekt.Beizugsgebiet','ili2db.ili.assocCardinalityMin','0');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Beizugsgebiet_Projekt.Beizugsgebiet','ili2db.ili.assocCardinalityMax','*');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Beizugsgebiet_Projekt.Beizugsgebiet','ili2db.ili.assocKind','ASSOCIATE');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Bewaesserung_Punkt.Typ','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Bewaesserung_Punkt.Typ','ili2db.ili.attrCardinalityMin','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Seilbahn_Linie.Geometrie','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Seilbahn_Linie.Geometrie','ili2db.ili.attrCardinalityMin','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Entw_Bodenstruktur_Flaeche.Bautyp','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Entw_Bodenstruktur_Flaeche.Bautyp','ili2db.ili.attrCardinalityMin','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Wege_Bruecke_Lehnenviadukt.Fahrbahnbreite','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Wege_Bruecke_Lehnenviadukt.Fahrbahnbreite','ili2db.ili.attrCardinalityMin','0');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Genossenschaft_Dokument.Dokument','ili2db.ili.assocCardinalityMin','0');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Genossenschaft_Dokument.Dokument','ili2db.ili.assocCardinalityMax','*');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Genossenschaft_Dokument.Dokument','ili2db.ili.assocKind','ASSOCIATE');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Hochbau.Geometrie','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Hochbau.Geometrie','ili2db.ili.attrCardinalityMin','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.EV_Punkt.Bautyp','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.EV_Punkt.Bautyp','ili2db.ili.attrCardinalityMin','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Milchleitung_Lokal.Bautyp','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Milchleitung_Lokal.Bautyp','ili2db.ili.attrCardinalityMin','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Milchleitung_Leitung.Geometrie','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Milchleitung_Leitung.Geometrie','ili2db.ili.attrCardinalityMin','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Wiederherstellungs_Punkt_Bild.Wiederherstellungs_Punkt','ili2db.ili.assocCardinalityMin','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Wiederherstellungs_Punkt_Bild.Wiederherstellungs_Punkt','ili2db.ili.assocCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Wiederherstellungs_Punkt_Bild.Wiederherstellungs_Punkt','ili2db.ili.assocKind','ASSOCIATE');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Wege_Bruecke_Lehnenviadukt.Bautyp','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Wege_Bruecke_Lehnenviadukt.Bautyp','ili2db.ili.attrCardinalityMin','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('AdministrativeUnits_V1.AdministrativeUnits.Hierarchy.UpperLevelUnit','ili2db.ili.assocCardinalityMin','0');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('AdministrativeUnits_V1.AdministrativeUnits.Hierarchy.UpperLevelUnit','ili2db.ili.assocCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('AdministrativeUnits_V1.AdministrativeUnits.Hierarchy.UpperLevelUnit','ili2db.ili.assocKind','AGGREGATE');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('AdministrativeUnitsCH_V1.CHAgencies.Agency.Web','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('AdministrativeUnitsCH_V1.CHAgencies.Agency.Web','ili2db.ili.attrCardinalityMin','0');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.WV_Leitung_Wasserversorgung.Geometrie','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.WV_Leitung_Wasserversorgung.Geometrie','ili2db.ili.attrCardinalityMin','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('AdministrativeUnits_V1.Agencies.Organisation.Orderer','ili2db.ili.assocCardinalityMin','0');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('AdministrativeUnits_V1.Agencies.Organisation.Orderer','ili2db.ili.assocCardinalityMax','*');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('AdministrativeUnits_V1.Agencies.Organisation.Orderer','ili2db.ili.assocKind','ASSOCIATE');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('AdministrativeUnitsCH_V1.CHMunicipalities.Hierarchy.LowerLevelUnit','ili2db.ili.assocCardinalityMin','0');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('AdministrativeUnitsCH_V1.CHMunicipalities.Hierarchy.LowerLevelUnit','ili2db.ili.assocCardinalityMax','*');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('AdministrativeUnitsCH_V1.CHMunicipalities.Hierarchy.LowerLevelUnit','ili2db.ili.assocKind','ASSOCIATE');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('AdministrativeUnitsCH_V1.CHMunicipalities.CHMunicipality.Web','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('AdministrativeUnitsCH_V1.CHMunicipalities.CHMunicipality.Web','ili2db.ili.attrCardinalityMin','0');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Projekt_Element.Projekt','ili2db.ili.assocCardinalityMin','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Projekt_Element.Projekt','ili2db.ili.assocCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Projekt_Element.Projekt','ili2db.ili.assocKind','ASSOCIATE');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Werkseigentum.Adresse','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Werkseigentum.Adresse','ili2db.ili.attrCardinalityMin','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Bew_Flaechen_Bewaesserung.Typ','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Bew_Flaechen_Bewaesserung.Typ','ili2db.ili.attrCardinalityMin','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Oekologie_Flaeche.Typ','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Oekologie_Flaeche.Typ','ili2db.ili.attrCardinalityMin','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('AdministrativeUnitsCH_V1.CHAdministrativeUnions.AdministrativeUnion.Web','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('AdministrativeUnitsCH_V1.CHAdministrativeUnions.AdministrativeUnion.Web','ili2db.ili.attrCardinalityMin','0');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Oekologie_Linie.Bautyp','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Oekologie_Linie.Bautyp','ili2db.ili.attrCardinalityMin','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('Dictionaries_V1.Dictionaries.Entry.Text','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('Dictionaries_V1.Dictionaries.Entry.Text','ili2db.ili.attrCardinalityMin','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Wasserversorgung_Punkt.Bautyp','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Wasserversorgung_Punkt.Bautyp','ili2db.ili.attrCardinalityMin','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('AdministrativeUnitsCH_V1.CHAdministrativeUnions.AdministrativeUnion.Name','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('AdministrativeUnitsCH_V1.CHAdministrativeUnions.AdministrativeUnion.Name','ili2db.ili.attrCardinalityMin','0');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Genossenschaft.Geometrie','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Genossenschaft.Geometrie','ili2db.ili.attrCardinalityMin','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Genossenschaft.Aufloesungsdatum','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Genossenschaft.Aufloesungsdatum','ili2db.ili.attrCardinalityMin','0');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Oekologie_Linie.Typ','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Oekologie_Linie.Typ','ili2db.ili.attrCardinalityMin','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Wege_Bruecke_Lehnenviadukt.Widerlager','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Wege_Bruecke_Lehnenviadukt.Widerlager','ili2db.ili.attrCardinalityMin','0');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Wege_Bruecke_Lehnenviadukt.Material','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Wege_Bruecke_Lehnenviadukt.Material','ili2db.ili.attrCardinalityMin','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Projekt.Geschaeftsnummer','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Projekt.Geschaeftsnummer','ili2db.ili.attrCardinalityMin','0');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Beizugsgebiet_Projekt.Projekt','ili2db.ili.assocCardinalityMin','0');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Beizugsgebiet_Projekt.Projekt','ili2db.ili.assocCardinalityMax','*');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Beizugsgebiet_Projekt.Projekt','ili2db.ili.assocKind','ASSOCIATE');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Wegebau_Linie.Geometrie','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Wegebau_Linie.Geometrie','ili2db.ili.attrCardinalityMin','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.EV_Linie.Geometrie','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.EV_Linie.Geometrie','ili2db.ili.attrCardinalityMin','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.WerksID','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.WerksID','ili2db.ili.attrCardinalityMin','0');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Oekologie_Trockenmauer.Typ','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Oekologie_Trockenmauer.Typ','ili2db.ili.attrCardinalityMin','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Hochbau.Typ','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Hochbau.Typ','ili2db.ili.attrCardinalityMin','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('Dictionaries_V1.Dictionaries.Dictionary.Language','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('Dictionaries_V1.Dictionaries.Dictionary.Language','ili2db.ili.attrCardinalityMin','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Dokument.Typ','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Dokument.Typ','ili2db.ili.attrCardinalityMin','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Entw_Bodenstruktur_Linie.Geometrie','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Entw_Bodenstruktur_Linie.Geometrie','ili2db.ili.attrCardinalityMin','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Genossenschaft.Name','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Genossenschaft.Name','ili2db.ili.attrCardinalityMin','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('AdministrativeUnitsCH_V1.CHDistricts.CHDistrict.Name','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('AdministrativeUnitsCH_V1.CHDistricts.CHDistrict.Name','ili2db.ili.attrCardinalityMin','0');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Wege_Bruecke_Lehnenviadukt.Geometrie','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Wege_Bruecke_Lehnenviadukt.Geometrie','ili2db.ili.attrCardinalityMin','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Entw_Bodenstruktur_Linie.Typ','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Entw_Bodenstruktur_Linie.Typ','ili2db.ili.attrCardinalityMin','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Bewaesserung_Punkt.Geometrie','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Bewaesserung_Punkt.Geometrie','ili2db.ili.attrCardinalityMin','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('AdministrativeUnits_V1.Agencies.Authority.Agency','ili2db.ili.assocCardinalityMin','0');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('AdministrativeUnits_V1.Agencies.Authority.Agency','ili2db.ili.assocCardinalityMax','*');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('AdministrativeUnits_V1.Agencies.Authority.Agency','ili2db.ili.assocKind','ASSOCIATE');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Genossenschaft_Element.Genossenschaft_Element','ili2db.ili.assocCardinalityMin','0');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Genossenschaft_Element.Genossenschaft_Element','ili2db.ili.assocCardinalityMax','*');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Genossenschaft_Element.Genossenschaft_Element','ili2db.ili.assocKind','ASSOCIATE');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('AdministrativeUnitsCH_V1.CHDistricts.CHDistrict.Web','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('AdministrativeUnitsCH_V1.CHDistricts.CHDistrict.Web','ili2db.ili.attrCardinalityMin','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Genossenschaft.Unterhaltsobjekt','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Genossenschaft.Unterhaltsobjekt','ili2db.ili.attrCardinalityMin','0');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('AdministrativeUnits_V1.CountryNames.CountryNamesTranslation.Entries','ili2db.ili.attrCardinalityMax','*');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('AdministrativeUnits_V1.CountryNames.CountryNamesTranslation.Entries','ili2db.ili.attrCardinalityMin','0');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Bewaesserung_Linie.Typ','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Bewaesserung_Linie.Typ','ili2db.ili.attrCardinalityMin','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('DictionariesCH_V1','furtherInformation','http://www.geo.admin.ch/internet/geoportal/de/home/topics/geobasedata/models.html');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('DictionariesCH_V1','technicalContact','models@geo.admin.ch');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Seilbahn_Linie.Bautyp','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Seilbahn_Linie.Bautyp','ili2db.ili.attrCardinalityMin','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.EV_Punkt.Geometrie','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.EV_Punkt.Geometrie','ili2db.ili.attrCardinalityMin','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Genossenschaft.Reorganisationsdatum','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Genossenschaft.Reorganisationsdatum','ili2db.ili.attrCardinalityMin','0');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Wegebau_Linie.Bezeichnung','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Wegebau_Linie.Bezeichnung','ili2db.ili.attrCardinalityMin','0');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.EV_Linie.Bautyp','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.EV_Linie.Bautyp','ili2db.ili.attrCardinalityMin','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Beizugsgebiet.Datum_Nachfuehrung','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Beizugsgebiet.Datum_Nachfuehrung','ili2db.ili.attrCardinalityMin','0');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Seilbahn_Station.Geometrie','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Seilbahn_Station.Geometrie','ili2db.ili.attrCardinalityMin','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Projekt_Element.Massnahme','ili2db.ili.assocCardinalityMin','0');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Projekt_Element.Massnahme','ili2db.ili.assocCardinalityMax','*');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Projekt_Element.Massnahme','ili2db.ili.assocKind','ASSOCIATE');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Beizugsgebiet.Geometrie','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Beizugsgebiet.Geometrie','ili2db.ili.attrCardinalityMin','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Beizugsgebiet.Typ','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Beizugsgebiet.Typ','ili2db.ili.attrCardinalityMin','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('AdministrativeUnitsCH_V1.CHDistricts.CHDistrict.ShortName','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('AdministrativeUnitsCH_V1.CHDistricts.CHDistrict.ShortName','ili2db.ili.attrCardinalityMin','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Wege_Bruecke_Lehnenviadukt.Laenge','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Wege_Bruecke_Lehnenviadukt.Laenge','ili2db.ili.attrCardinalityMin','0');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Werkseigentum.Name','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Werkseigentum.Name','ili2db.ili.attrCardinalityMin','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Dokument.Dateipfad','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Dokument.Dateipfad','ili2db.ili.attrCardinalityMin','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('AdministrativeUnitsCH_V1.CHAdministrativeUnions.AdministrativeUnion.Description','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('AdministrativeUnitsCH_V1.CHAdministrativeUnions.AdministrativeUnion.Description','ili2db.ili.attrCardinalityMin','0');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Entw_Bodenstruktur_Pumpwerk.Geometrie','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Entw_Bodenstruktur_Pumpwerk.Geometrie','ili2db.ili.attrCardinalityMin','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('AdministrativeUnitsCH_V1.CHDistricts.Hierarchy.UpperLevelUnit','ili2db.ili.assocCardinalityMin','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('AdministrativeUnitsCH_V1.CHDistricts.Hierarchy.UpperLevelUnit','ili2db.ili.assocCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('AdministrativeUnitsCH_V1.CHDistricts.Hierarchy.UpperLevelUnit','ili2db.ili.assocKind','AGGREGATE');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Projekt.Kantonsnummer','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Projekt.Kantonsnummer','ili2db.ili.attrCardinalityMin','0');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Wegebau_Linie.Bautyp','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Wegebau_Linie.Bautyp','ili2db.ili.attrCardinalityMin','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Entw_Bodenstruktur_Linie.Bautyp','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Entw_Bodenstruktur_Linie.Bautyp','ili2db.ili.attrCardinalityMin','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Oekologie_Flaeche.Bautyp','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Oekologie_Flaeche.Bautyp','ili2db.ili.attrCardinalityMin','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('AdministrativeUnitsCH_V1.CHDistricts.Hierarchy.LowerLevelUnit','ili2db.ili.assocCardinalityMin','0');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('AdministrativeUnitsCH_V1.CHDistricts.Hierarchy.LowerLevelUnit','ili2db.ili.assocCardinalityMax','*');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('AdministrativeUnitsCH_V1.CHDistricts.Hierarchy.LowerLevelUnit','ili2db.ili.assocKind','ASSOCIATE');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('Dictionaries_V1','furtherInformation','http://www.geo.admin.ch/internet/geoportal/de/home/topics/geobasedata/models.html');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('Dictionaries_V1','technicalContact','models@geo.admin.ch');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('AdministrativeUnitsCH_V1.CHCantons.CHCanton.Name','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('AdministrativeUnitsCH_V1.CHCantons.CHCanton.Name','ili2db.ili.attrCardinalityMin','0');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('AdministrativeUnitsCH_V1.CHCantons.Hierarchy.LowerLevelUnit','ili2db.ili.assocCardinalityMin','0');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('AdministrativeUnitsCH_V1.CHCantons.Hierarchy.LowerLevelUnit','ili2db.ili.assocCardinalityMax','*');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('AdministrativeUnitsCH_V1.CHCantons.Hierarchy.LowerLevelUnit','ili2db.ili.assocKind','ASSOCIATE');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Seilbahn_Station.Typ','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Seilbahn_Station.Typ','ili2db.ili.attrCardinalityMin','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Bewaesserung_Punkt.Bautyp','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Bewaesserung_Punkt.Bautyp','ili2db.ili.attrCardinalityMin','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Projekt.Geometrie','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Projekt.Geometrie','ili2db.ili.attrCardinalityMin','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Wiederherstellung_Punkt.Geometrie','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Wiederherstellung_Punkt.Geometrie','ili2db.ili.attrCardinalityMin','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('AdministrativeUnitsCH_V1.CHMunicipalities.CHMunicipality.Name','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('AdministrativeUnitsCH_V1.CHMunicipalities.CHMunicipality.Name','ili2db.ili.attrCardinalityMin','0');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Seilbahn_Station.Bautyp','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Seilbahn_Station.Bautyp','ili2db.ili.attrCardinalityMin','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('AdministrativeUnitsCH_V1.CHCantons.Hierarchy.UpperLevelUnit','ili2db.ili.assocCardinalityMin','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('AdministrativeUnitsCH_V1.CHCantons.Hierarchy.UpperLevelUnit','ili2db.ili.assocCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('AdministrativeUnitsCH_V1.CHCantons.Hierarchy.UpperLevelUnit','ili2db.ili.assocKind','AGGREGATE');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('Dictionaries_V1.Dictionaries.Dictionary.Entries','ili2db.ili.attrCardinalityMax','*');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('Dictionaries_V1.Dictionaries.Dictionary.Entries','ili2db.ili.attrCardinalityMin','0');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Entw_Bodenstruktur_Flaeche.Geometrie','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Entw_Bodenstruktur_Flaeche.Geometrie','ili2db.ili.attrCardinalityMin','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Entw_Bodenstruktur_Flaeche.Typ','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Entw_Bodenstruktur_Flaeche.Typ','ili2db.ili.attrCardinalityMin','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Milchleitung_Lokal.Geometrie','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Milchleitung_Lokal.Geometrie','ili2db.ili.attrCardinalityMin','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Oekologie_Punkt.Typ','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Oekologie_Punkt.Typ','ili2db.ili.attrCardinalityMin','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Oekologie_Linie.Geometrie','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Oekologie_Linie.Geometrie','ili2db.ili.attrCardinalityMin','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Projekt.Name','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Projekt.Name','ili2db.ili.attrCardinalityMin','0');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Wegebau_Linie.Fahrbahnbreite','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Wegebau_Linie.Fahrbahnbreite','ili2db.ili.attrCardinalityMin','0');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('AdministrativeUnits_V1.AdministrativeUnits.Hierarchy.LowerLevelUnit','ili2db.ili.assocCardinalityMin','0');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('AdministrativeUnits_V1.AdministrativeUnits.Hierarchy.LowerLevelUnit','ili2db.ili.assocCardinalityMax','*');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('AdministrativeUnits_V1.AdministrativeUnits.Hierarchy.LowerLevelUnit','ili2db.ili.assocKind','ASSOCIATE');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.Bauabnahme_Datum','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.Bauabnahme_Datum','ili2db.ili.attrCardinalityMin','0');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Wasserversorgung_Punkt.Geometrie','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Wasserversorgung_Punkt.Geometrie','ili2db.ili.attrCardinalityMin','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.Stand_Gueterregulierung.Stand_Gueterregulierung.Stand','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.Stand_Gueterregulierung.Stand_Gueterregulierung.Stand','ili2db.ili.attrCardinalityMin','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Wegebau_Linie.Anteil_LW','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Wegebau_Linie.Anteil_LW','ili2db.ili.attrCardinalityMin','0');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Genossenschaft_Dokument.Genossenschaft','ili2db.ili.assocCardinalityMin','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Genossenschaft_Dokument.Genossenschaft','ili2db.ili.assocCardinalityMax','*');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Genossenschaft_Dokument.Genossenschaft','ili2db.ili.assocKind','ASSOCIATE');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Genossenschaft.Gruendungsdatum','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Genossenschaft.Gruendungsdatum','ili2db.ili.attrCardinalityMin','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.WV_Leitung_Wasserversorgung.Bautyp','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.WV_Leitung_Wasserversorgung.Bautyp','ili2db.ili.attrCardinalityMin','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.EV_Linie.Typ','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.EV_Linie.Typ','ili2db.ili.attrCardinalityMin','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Werkeigentum_Element.Element','ili2db.ili.assocCardinalityMin','0');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Werkeigentum_Element.Element','ili2db.ili.assocCardinalityMax','*');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Werkeigentum_Element.Element','ili2db.ili.assocKind','ASSOCIATE');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('AdministrativeUnitsCH_V1','furtherInformation','http://www.geo.admin.ch/internet/geoportal/de/home/topics/geobasedata/models.html');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('AdministrativeUnitsCH_V1','technicalContact','models@geo.admin.ch');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('AdministrativeUnitsCH_V1.CHMunicipalities.CHMunicipality.Code','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('AdministrativeUnitsCH_V1.CHMunicipalities.CHMunicipality.Code','ili2db.ili.attrCardinalityMin','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Bew_Flaechen_Bewaesserung.Bautyp','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Bew_Flaechen_Bewaesserung.Bautyp','ili2db.ili.attrCardinalityMin','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Oekologie_Flaeche.Geometrie','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Oekologie_Flaeche.Geometrie','ili2db.ili.attrCardinalityMin','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('AdministrativeUnits_V1.Countries.Country.Code','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('AdministrativeUnits_V1.Countries.Country.Code','ili2db.ili.attrCardinalityMin','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.UnterhaltsID','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.UnterhaltsID','ili2db.ili.attrCardinalityMin','0');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.EV_Punkt.Typ','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.EV_Punkt.Typ','ili2db.ili.attrCardinalityMin','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Werkeigentum_Element.Werkeigentum','ili2db.ili.assocCardinalityMin','0');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Werkeigentum_Element.Werkeigentum','ili2db.ili.assocCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Werkeigentum_Element.Werkeigentum','ili2db.ili.assocKind','ASSOCIATE');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('AdministrativeUnitsCH_V1.CHCantons.CHCanton.Web','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('AdministrativeUnitsCH_V1.CHCantons.CHCanton.Web','ili2db.ili.attrCardinalityMin','0');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Wegebau_Linie.Techn_Schwierigkeit','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Wegebau_Linie.Techn_Schwierigkeit','ili2db.ili.attrCardinalityMin','0');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Wegebau_Linie.laenge_gerundet','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Wegebau_Linie.laenge_gerundet','ili2db.ili.attrCardinalityMin','0');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('AdministrativeUnitsCH_V1.CHAgencies.Agency.Description','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('AdministrativeUnitsCH_V1.CHAgencies.Agency.Description','ili2db.ili.attrCardinalityMin','0');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Genossenschaft_Element.Element_Genossenschaft','ili2db.ili.assocCardinalityMin','0');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Genossenschaft_Element.Element_Genossenschaft','ili2db.ili.assocCardinalityMax','*');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Genossenschaft_Element.Element_Genossenschaft','ili2db.ili.assocKind','ASSOCIATE');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.Stand_Gueterregulierung.Stand_Gueterregulierung.BFSNr','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.Stand_Gueterregulierung.Stand_Gueterregulierung.BFSNr','ili2db.ili.attrCardinalityMin','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Oekologie_Punkt.Geometrie','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Oekologie_Punkt.Geometrie','ili2db.ili.attrCardinalityMin','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Wege_Bruecke_Lehnenviadukt.Tonnage','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Wege_Bruecke_Lehnenviadukt.Tonnage','ili2db.ili.attrCardinalityMin','0');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Wiederherstellung_Punkt.Typ','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Wiederherstellung_Punkt.Typ','ili2db.ili.attrCardinalityMin','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('AdministrativeUnits_V1.AdministrativeUnits.UnionMembers.Member','ili2db.ili.assocCardinalityMin','0');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('AdministrativeUnits_V1.AdministrativeUnits.UnionMembers.Member','ili2db.ili.assocCardinalityMax','*');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('AdministrativeUnits_V1.AdministrativeUnits.UnionMembers.Member','ili2db.ili.assocKind','ASSOCIATE');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Genossenschaft.Bemerkung','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Genossenschaft.Bemerkung','ili2db.ili.attrCardinalityMin','0');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Oekologie_Trockenmauer.Hoehe','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Oekologie_Trockenmauer.Hoehe','ili2db.ili.attrCardinalityMin','0');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Dokument.Titel','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Dokument.Titel','ili2db.ili.attrCardinalityMin','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Milchleitung_Leitung.Bautyp','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Milchleitung_Leitung.Bautyp','ili2db.ili.attrCardinalityMin','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Entw_Bodenstruktur_Pumpwerk.Bautyp','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Entw_Bodenstruktur_Pumpwerk.Bautyp','ili2db.ili.attrCardinalityMin','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Wegebau_Linie.Typ','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Wegebau_Linie.Typ','ili2db.ili.attrCardinalityMin','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Genossenschaft.Typ','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Genossenschaft.Typ','ili2db.ili.attrCardinalityMin','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('AdministrativeUnits_V1.Agencies.Organisation.Executor','ili2db.ili.assocCardinalityMin','0');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('AdministrativeUnits_V1.Agencies.Organisation.Executor','ili2db.ili.assocCardinalityMax','*');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('AdministrativeUnits_V1.Agencies.Organisation.Executor','ili2db.ili.assocKind','ASSOCIATE');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('AdministrativeUnits_V1.Agencies.Authority.Supervisor','ili2db.ili.assocCardinalityMin','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('AdministrativeUnits_V1.Agencies.Authority.Supervisor','ili2db.ili.assocCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('AdministrativeUnits_V1.Agencies.Authority.Supervisor','ili2db.ili.assocKind','AGGREGATE');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Oekologie_Trockenmauer.Bautyp','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Oekologie_Trockenmauer.Bautyp','ili2db.ili.attrCardinalityMin','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.Status_Datum','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Raeumliches_Element.Status_Datum','ili2db.ili.attrCardinalityMin','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Projekt.Projekttypen','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Projekt.Projekttypen','ili2db.ili.attrCardinalityMin','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Oekologie_Trockenmauer.Geometrie','ili2db.ili.attrCardinalityMax','1');
INSERT INTO alw_strukturverbesserungen.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ALW_Strukturverbesserungen_20190912.RaeumlicheElemente.Oekologie_Trockenmauer.Geometrie','ili2db.ili.attrCardinalityMin','1');
