FROM ubuntu:latest

# Add the PostgreSQL PGP key to verify their Debian packages.
# It should be the same key as https://www.postgresql.org/media/keys/ACCC4CF8.asc
RUN apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys B97B0AFCAA1A47F044F244A07FCC7D46ACCC4CF8

# Add PostgreSQL's repository. It contains the most recent stable release
#     of PostgreSQL, ``9.3``.
RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main" > /etc/apt/sources.list.d/pgdg.list

# Install ``python-software-properties``, ``software-properties-common`` and PostgreSQL 9.3
#  There are some warnings (in red) that show up during the build. You can hide
#  them by prefixing each apt-get statement with DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y python-software-properties software-properties-common postgresql-9.3 &&\
postgresql-client-9.3 postgresql-contrib-9.3


#Copy the SonarQube database dump to the container
COPY   sonarexport.pgsql /PostgresImageData/
COPY   pg_hba.conf /etc/postgresql/9.3/main/pg_hba.conf

RUN chown postgres /etc/postgresql/9.3/main/pg_hba.conf && chgrp postgres /etc/postgresql/9.3/main/pg_hba.conf &&\
chmod 640 /etc/postgresql/9.3/main/pg_hba.conf

# Change the user from root to start the database
USER postgres

# Allow remote connections to PostgreSQL Database.
RUN echo "host all  all    0.0.0.0/0  md5" >> /etc/postgresql/9.3/main/pg_hba.conf

# And add ``listen_addresses`` to ``/etc/postgresql/9.3/main/postgresql.conf``
RUN echo "listen_addresses='*'" >> /etc/postgresql/9.3/main/postgresql.conf

# Change PostgreSQL port in postgresql.conf file
RUN sed -i -e 's/5432/5728/g' /etc/postgresql/9.3/main/postgresql.conf

ENV PGPASSWORD=sonar
#Start the Postgresql daemon and configure for Sonarqube
RUN    /etc/init.d/postgresql start && psql --command "CREATE USER docker WITH SUPERUSER PASSWORD 'docker';" &&\
psql --command "CREATE ROLE sonar LOGIN ENCRYPTED PASSWORD 'md5b05e02d26b524e4287428984d14a6824' NOSUPERUSER INHERIT CREATEDB NOCREATEROLE NOREPLICATION;" &&\
createdb -O sonar sonar && pg_dump -U sonar sonar < /PostgresImageData/sonarexport.pgsql

# Expose the PostgreSQL port
EXPOSE 5728

#Add new Volume to allow database backup
VOLUME ["/PostgresImageData"]

# Set the default command to run when starting the container
CMD ["/usr/lib/postgresql/9.3/bin/postgres", "-D", "/var/lib/postgresql/9.3/main", "-c", "config_file=/etc/postgresql/9.3/main/postgresql.conf"]






# Expose the PostgreSQL port
EXPOSE 5728

#Add new Volume to allow database backup
VOLUME ["/PostgresImageData"]

# Set the default command to run when starting the container
CMD ["/usr/lib/postgresql/9.3/bin/postgres", "-D", "/var/lib/postgresql/9.3/main", "-c", "config_file=/etc/postgresql/9.3/main/postgr$

