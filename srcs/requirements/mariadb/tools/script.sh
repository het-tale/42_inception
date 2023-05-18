#!/bin/bash

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
