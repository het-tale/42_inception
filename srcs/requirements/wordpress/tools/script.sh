#!/bin/bash

# source .env

# mkdir -p /var/www/html > /dev/null

# chown -R www-data:www-data /var/www/html

# cd /var/www/html

wp core download --allow-root


# mv wp-config-sample.php wp-config.php > /dev/null

#     chmod 777 wp-config.php

#     sed -i "s/database_name_here/$MYSQL_DATABASE/1" wp-config.php
#     sed -i "s/password_here/$DB_PASS/1" wp-config.php
#     sed -i "s/username_here/$DB_USER/1" wp-config.php
#     sed -i "s/localhost/mariadb/1" wp-config.php

wp core config --dbhost=$HOST --dbname=$MYSQL_DATABASE --dbuser=$DB_USER --dbpass=$DB_PASS --allow-root

    # wp core install --title=random_hdchy \
    #                 --admin_user=asilo99 \
    #                 --admin_password=asilo99 \
    #                 --admin_email=ettalebyhasnaa99@gmail.com \
    #                 --url=het-tale.42.fr \
    #                 --allow-root

# wp config create --dbname=$MYSQL_DATABASE \
#     --dbuser=$DB_USER --dbpass=$DB_PASS \
#     --dbhost=$HOST --allow-root

echo HIIIII

wp core install --url=$DB_HOST --title=$WP_TITLE --admin_user=$WP_ADMN_USR --admin_password=$WP_ADMN_PASS  --admin_email=$WP_ADMN_MAIL --allow-root

echo HIIIII

    # wp user create $WP_USER $WP_MAIL --role=author --user_pass=$WP_PASS --allow-root
    



# wp plugin update --all --allow-root
# wp theme install twentysixteen --activate --allow-root
# wp theme install twentytwentytwo --activate --allow-root


# chown -R www-data:www-data /run/php


# exec destroyed The current shell process , and entirely replace it by the command php-fpm
# exec php-fpm$name -F
exec $@