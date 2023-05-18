FROM debian:buster

RUN apt update && \
	apt install mariadb-server -y

# RUN sed -i "s/bind-address.*/bind-address            = 0.0.0.0/" /etc/mysql/mariadb.conf.d/50-server.cnf
# RUN sed -i "s/#port.*/port                    = 3306/" /etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./requirements/mariadb/tools/script.sh /script.sh
# COPY .env .env

ARG MYSQL_DATABASE
ARG DB_ROOT_PASS
ARG DB_USER
ARG DB_PASS

RUN chmod +x script.sh
RUN bash script.sh

CMD ["mysqld", "--bind-address=0.0.0.0"]