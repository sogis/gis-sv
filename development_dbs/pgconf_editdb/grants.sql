-- Create additional DB users
CREATE USER neum WITH PASSWORD 'neum';
CREATE USER zehnd WITH PASSWORD 'zehnd';


CREATE ROLE alw_strukturverbesserungen_read
;
CREATE ROLE alw_strukturverbesserungen_write
;
GRANT USAGE ON SCHEMA alw_strukturverbesserungen TO alw_strukturverbesserungen_read, alw_strukturverbesserungen_write, gretl
;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA alw_strukturverbesserungen TO alw_strukturverbesserungen_write, gretl
;
GRANT SELECT ON ALL TABLES IN SCHEMA alw_strukturverbesserungen TO alw_strukturverbesserungen_read
;
GRANT USAGE ON ALL SEQUENCES IN SCHEMA alw_strukturverbesserungen TO alw_strukturverbesserungen_write
, gretl
;
-- Schreib-Zugriffe fuer J. Zehnder, A. Neumann, A. Luescher
GRANT alw_strukturverbesserungen_write TO zehnd, neum, admin
;
