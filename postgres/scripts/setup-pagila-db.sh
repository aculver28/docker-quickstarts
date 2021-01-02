#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE USER pagila WITH PASSWORD 'pagila123';
    CREATE DATABASE pagila;
    GRANT ALL PRIVILEGES ON DATABASE pagila TO pagila;
EOSQL

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname pagila < /tmp/pagila-master/pagila-schema.sql

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname pagila < /tmp/pagila-master/pagila-data.sql
