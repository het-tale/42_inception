FROM alpine:latest

RUN apk update && apk add nginx

WORKDIR /Users/het-tale/Desktop/nginx_cont

COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY  . /Users/het-tale/Desktop/nginx_cont

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]