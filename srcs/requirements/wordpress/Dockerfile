FROM debian:buster

RUN apt-get update && apt-get install \
	php-fpm php-mysql curl -y


COPY ./tools/script.sh .

RUN chmod +x script.sh
RUN bash script.sh

CMD [ "php-fpm7.3", "-F" ]