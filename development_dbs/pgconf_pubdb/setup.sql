-- This is the original setup.sql file, copied from https://github.com/CrunchyData/crunchy-containers/blob/31e455e3cdc47c01d32ce0891e5487c5be93153f/bin/postgres-gis/setup.sql,

SET application_name="container_setup";

alter user postgres password 'PG_ROOT_PASSWORD';

create user PG_PRIMARY_USER with REPLICATION  PASSWORD 'PG_PRIMARY_PASSWORD';
create user "PG_USER" with password 'PG_PASSWORD';
-- Additional user:
create user gretl with password 'gretl';

create table primarytable (key varchar(20), value varchar(20));
grant all on primarytable to PG_PRIMARY_USER;

create database PG_DATABASE;

grant all privileges on database PG_DATABASE to "PG_USER";
-- Additional privilege settings:
REVOKE TEMPORARY ON DATABASE PG_DATABASE FROM PUBLIC;
REVOKE CREATE ON SCHEMA public FROM PUBLIC;

\c PG_DATABASE

create extension postgis;
-- Additional extension needed for working with ili2pg:
create extension "uuid-ossp";

-- create data structure for editdb
\c PG_DATABASE "PG_USER";

