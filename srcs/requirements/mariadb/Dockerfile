FROM debian:buster

RUN apt update && \
	apt install mariadb-server -y

COPY ./requirements/mariadb/tools/script.sh /script.sh

ARG MYSQL_DATABASE
ARG DB_ROOT_PASS
ARG DB_USER
ARG DB_PASS

RUN chmod +x script.sh
RUN bash script.sh

CMD ["mysqld", "--bind-address=0.0.0.0"]