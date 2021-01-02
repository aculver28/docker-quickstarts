FROM postgres:12

COPY scripts/setup-pagila-db.sh /docker-entrypoint-initdb.d/setup-pagila-db.sh

RUN apt-get update && \
    yes | apt-get install wget unzip && \
    mkdir -p /tmp && mkdir -p /tmp/test-db && \
    cd /tmp && \
    wget https://github.com/devrimgunduz/pagila/archive/master.zip && \
    unzip -o master.zip && \
    rm -f /tmp/master.zip

ENV POSTGRES_PASSWORD password123

EXPOSE 5432

USER postgres
