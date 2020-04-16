FROM postgis/postgis:11-3.0



# ENV POSTGRES_DB my_database
# ENV POSTGRES_PASSWORD=password

# COPY psql_dump.sql /docker-entrypoint-initdb.d/

# install Python 3
# RUN apt-get update && apt-get install -y python3 python3-pip
# RUN apt-get -y install python3.7-dev
# RUN apt-get install postgresql-server-dev-10 gcc python3-dev musl-dev

# WORKDIR /src
# COPY requirements.txt requirements.txt
# RUN pip install -r requirements.txt
# COPY . .