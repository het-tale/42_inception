FROM debian:buster

RUN apt-get update && apt-get install \
	php-fpm php-mysql curl mariadb-client -y

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
&&  chmod +x wp-cli.phar  && mv wp-cli.phar /usr/local/bin/wp

WORKDIR  /var/www/html/

COPY ./tools/script.sh .
# COPY .env .env

RUN chmod +x script.sh

RUN sed -i "s/listen = \/run\/php\/php7.3-fpm.sock/listen = wordpress:9000/1" /etc/php/7.3/fpm/pool.d/www.conf

RUN mkdir -p /run/php

ENTRYPOINT [ "./script.sh" ]

CMD [ "php-fpm7.3" ,"-R", "-F" ]