FROM postgis/postgis:11-3.0

COPY sql/dump.sql /docker-entrypoint-initdb.d/
