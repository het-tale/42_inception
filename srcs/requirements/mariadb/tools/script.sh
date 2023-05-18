#!/bin/bash

# sed -i "s/bind-address.*/bind-address            = 0.0.0.0/" /etc/mysql/mariadb.conf.d/50-server.cnf
# sed -i "s/#port.*/port                    = 3306/" /etc/mysql/mariadb.conf.d/50-server.cnf

# source .env

service mysql start

touch db

    echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;" >> db
    echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PASS';" >> db
    echo "CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';" >> db
    echo "GRANT ALL PRIVILEGES ON *.* TO '$DB_USER'@'%';" >> db
    echo "FLUSH PRIVILEGES;" >> db
    echo "EXIT" >> db

    mysql -h localhost -uroot -p$DB_ROOT_PASS < db

kill $(cat /var/run/mysqld/mysqld.pid)

# mysqld