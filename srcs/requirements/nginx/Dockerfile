FROM debian:buster

RUN apt update -y && apt upgrade -y && \
apt install -y nginx && apt install openssl -y && \
openssl req -x509 -nodes -days 365	-newkey rsa:2048 \
	-keyout /etc/ssl/private/het-tale-prv.key \ 
	-out /etc/ssl/certs/het-tale-cer.crt \
	-subj "/CN=het-tale.42.fr"

WORKDIR /home/het-tale/Desktop/nginx_cont

COPY conf/nginx.conf /etc/nginx/sites-available/default
#COPY  . /home/het-tale/Desktop/nginx_cont

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]