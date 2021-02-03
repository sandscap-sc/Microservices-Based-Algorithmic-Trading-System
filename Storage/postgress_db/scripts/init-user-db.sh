#!/bin/bash
set -e
# create a shared role to read & write general datasets into postgres
echo "Creating database role: shared"
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
	CREATE USER shared WITH
   LOGIN
   NOSUPERUSER
   NOCREATEDB
   NOCREATEROLE
   NOINHERIT
   NOREPLICATION
   PASSWORD '$SHARED_PASSWORD';
EOSQL
