FROM debian:buster

RUN apt-get -y update && apt-get -y upgrade && apt update -y && apt upgrade -y\
apt install php-fpm php-mysql -y&& apt install curl -y

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp && \
	mkdir -p /var/www/html && cd /var/www/html && \
	wp core download --allow-root

COPY ./tools/script.sh .

RUN chmod +x script.sh

CMD [ "./tools/script.sh" ]