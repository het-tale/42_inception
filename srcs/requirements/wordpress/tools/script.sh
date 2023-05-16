#!/bin/bash
export name=$(ls /etc/php/)

cd /var/www/html

# rm -rf *
wp core download --allow-root
    # echo "wp-config-sample.php exist"
if [ -f './wp-config-sample.php' ]; then


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
    # sed -i "s/listen = \/run\/php\/php$name-fpm.sock/listen = 9000/1" /etc/php/$name/fpm/pool.d/www.conf
    

fi
    sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf

wp plugin update --all --allow-root
# wp plugin install redis-cache --activate --allow-root
wp theme install twentysixteen --activate --allow-root

# wp redis enable --allow-root
# the /run/php used by PHP-FPM to store process Id.
mkdir -p /run/php


# exec destroyed The current shell process , and entirely replace it by the command php-fpm
exec php-fpm$name -F