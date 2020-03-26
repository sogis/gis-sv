#!/bin/bash

# This file is sourced by the start.sh script. Changes made to environment
# variables or adding environment variables will take effect in the shell
# postgres is running in. Anything added to this file will be executed
# after the database has been started.

echo_info "Executing post-start-hook.." # add below this line

if [[ -v PGHOST ]]; then # Hack: Detects if DB starts for the first time (in this case PGHOST=/tmp; this is set in https://github.com/CrunchyData/crunchy-containers/blob/4dcbbf676523e613a571c3f79bb844d03643866f/bin/postgres/start.sh#L334)
    echo "Waiting for PostgreSQL to start.."
    while true; do
        pg_isready \
        --host=${PGHOST} \
        --port=${PG_PRIMARY_PORT} \
        --username=${PG_PRIMARY_USER?} \
        --timeout=2
        if [ $? -eq 0 ]; then
            echo "The database is up and running ... now running post hooks"
            break
        fi
        sleep 2
    done

    # create empty alw_strukturverbesserungen datastructure
    echo "Creating data structure 'alw_strukturverbesserungen' for edit db.."
    psql -d $PG_DATABASE --single-transaction \
    -v PG_DATABASE=$PG_DATABASE \
    -v PG_WRITE_USER=$PG_WRITE_USER \
    -v PG_WRITE_PASSWORD=$PG_WRITE_PASSWORD \
    -v PG_READ_USER=$PG_READ_USER \
    -v PG_READ_PASSWORD=$PG_READ_PASSWORD \
    -f /pgconf/alw_strukturverbesserungen_edit.sql
    echo "\nDone creating data structure 'alw_strukturverbesserungen' for edit db.."
    
    
    # Create additional DB users and grant privileges
    psql -d $PG_DATABASE --single-transaction \
    -v PG_DATABASE=$PG_DATABASE \
    -v PG_WRITE_USER=$PG_WRITE_USER \
    -v PG_WRITE_PASSWORD=$PG_WRITE_PASSWORD \
    -v PG_READ_USER=$PG_READ_USER \
    -v PG_READ_PASSWORD=$PG_READ_PASSWORD \
    -f /pgconf/grants.sql
    
    
    # optional migration
    # first check if directory exists
    if [[ -d "/migration" ]]
    then
        "\n importing SQL files for migration\n"
        for i in $(ls /migration/*.sql); do
             echo "importing sql-file $i"
             psql -d $PG_DATABASE -U $PG_USER < $i
        done
    fi
fi

echo_info "Executing post-start-hook finished. Edit database is ready for use."
