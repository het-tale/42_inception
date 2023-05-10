FROM debian:buster

RUN apt-get update && apt-get install -y mariadb-server

RUN sed -i "s/bind-address.*/bind-address            = 0.0.0.0/" /etc/mysql/mariadb.conf.d/50-server.cnf
RUN sed -i "s/#port.*/port                    = 3306/" /etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./tools/script.sh /

RUN chmod +x script.sh

CMD ["bash" , "script.sh"]