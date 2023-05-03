FROM debian:buster

RUN apt-get >/dev/null 2>&1 || { apt-get update && apt-get install -y apt-utils; }
RUN apt-get update && apt-get install -y mariadb-server mariadb-client