FROM debian:buster

RUN apt update -y && apt install nginx -y \
	&& apt install openssl -y  \
	&& openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
        -keyout /etc/ssl/private/het-tale-prv.key \
        -out /etc/ssl/certs/het-tale-cer.crt \
        -subj "/CN=het-tale.42.fr"

COPY conf/nginx.conf /etc/nginx/conf.d/

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]