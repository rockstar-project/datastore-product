FROM mysql
COPY schema.sql /docker-entrypoint-initdb.d/data-dump.sql
WORKDIR /app/data
COPY data .
