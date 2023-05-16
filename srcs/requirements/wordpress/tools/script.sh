#!/bin/bash
export name=$(ls /etc/php/)


mkdir -p /var/www/html > /dev/null

cd /var/www/html


rm -rf *

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 

chmod +x wp-cli.phar 

mv wp-cli.phar /usr/local/bin/wp

wp core download --allow-root


mv wp-config-sample.php wp-config.php > /dev/null

    chmod 777 wp-config.php

    sed -i "s/database_name_here/$MYSQL_DATABASE/1" wp-config.php
    sed -i "s/password_here/$DB_PASS/1" wp-config.php
    sed -i "s/username_here/$DB_USER/1" wp-config.php
    sed -i "s/localhost/mariadb/1" wp-config.php

    wp core install --title=$WP_TITLE \
                    --admin_user=$WP_ADMN_USR \
                    --admin_password=$WP_ADMN_PASS \
                    --admin_email=$WP_ADMN_MAIL \
                    --url=$DB_HOST \
                    --allow-root

    wp user create $WP_USER $WP_MAIL --role=author --user_pass=$WP_PASS --allow-root
    sed -i "s/listen = \/run\/php\/php$name-fpm.sock/listen = 9000/1" /etc/php/$name/fpm/pool.d/www.conf
    



# wp plugin update --all --allow-root
# wp theme install twentysixteen --activate --allow-root
wp theme install twentytwentytwo --activate --allow-root


mkdir -p /run/php


# exec destroyed The current shell process , and entirely replace it by the command php-fpm
exec php-fpm$name -F