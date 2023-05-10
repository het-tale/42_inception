FROM debian:buster

RUN apt-get update && apt-get -y upgrade && \
apt install php-fpm php-mysql -y && apt install curl -y

COPY ./tools/script.sh /
COPY ./tools/wp-config.php /

RUN chmod +x script.sh

CMD ["bash" , "script.sh"]