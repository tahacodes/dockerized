#!/bin/bash

if ! $(wp core is-installed --allow-root); then
    wp core download --locale=fa_IR --path=/var/www --allow-root
    wp config create --dbhost=$WORDPRESS_DB_HOST --dbname=$WORDPRESS_DB_NAME --dbuser=$WORDPRESS_DB_USER --dbpass=$WORDPRESS_DB_PASSWORD --path=/var/www --allow-root
    wp core install --url=ggkala.omg --title=GGKala --admin_user=admin --admin_password=admin --admin_email=info@ggkala.omg --skip-email --path=/var/www --allow-root
fi