#!/bin/bash
export name=$(ls /etc/php/)

cd /var/www/html

if [ -f './wp-config-sample.php' ]; then

    mv wp-config-sample.php wp-config.php > /dev/null

    chmod 777 wp-config.php

    sed -i "s/database_name_here/$db1_name/1" wp-config.php
    sed -i "s/password_here/$db1_pwd/1" wp-config.php
    sed -i "s/username_here/$db1_user/1" wp-config.php
    sed -i "s/localhost/mariadb/1" wp-config.php

    wp core install --title=$WP_TITLE \
                    --admin_user=$WP_ADMIN_USR \
                    --admin_password=$WP_ADMIN_PWD \
                    --admin_email=$WP_ADMIN_EMAIL \
                    --url=$db_host \
                    --allow-root

    wp user create $WP_USR $WP_EMAIL --role=author --user_pass=$WP_PWD --allow-root
   sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf

    sed -i '60i\
    define( 'WP_REDIS_HOST', 'redis' );\
    define( 'WP_REDIS_PORT', 6379 );\
    define('WP_CACHE', true);' wp-config.php

fi

wp plugin update --all --allow-root
wp plugin install redis-cache --activate --allow-root
wp theme install twentysixteen --activate --allow-root

wp redis enable --allow-root
# the /run/php used by PHP-FPM to store process Id.
mkdir -p /run/php


# exec destroyed The current shell process , and entirely replace it by the command php-fpm
exec php-fpm7.3 -F