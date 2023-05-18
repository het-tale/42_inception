#!/bin/bash

wp core download --allow-root
mv wp-config-sample.php wp-config.php > /dev/null
chmod 777 wp-config.php
sed -i "s/database_name_here/$MYSQL_DATABASE/1" wp-config.php
sed -i "s/password_here/$DB_PASS/1" wp-config.php
sed -i "s/username_here/$DB_USER/1" wp-config.php
sed -i "s/localhost/mariadb/1" wp-config.php
wp core install --url=$DB_HOST --title=$WP_TITLE --admin_user=$WP_ADMN_USR --admin_password=$WP_ADMN_PASS  --admin_email=$WP_ADMN_MAIL --allow-root
wp user create $WP_USER $WP_MAIL --role=author --user_pass=$WP_PASS --allow-root
wp theme install twentysixteen --activate --allow-root

exec $@