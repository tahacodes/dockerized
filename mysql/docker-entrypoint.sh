#!/bin/bash

MARIADB_DATABASE="wordpress"
MARIADB_USER="wordpress"
MARIADB_PASSWORD="wordpress"

if [ ! -f /var/lib/mysql/ibdata1 ]; then
    mysql_install_db
fi

if [[ $MARIADB_DATABASE != "" ]]; then
    mysql -Bse "CREATE DATABASE IF NOT EXISTS \`$MARIADB_DATABASE\` CHARACTER SET utf8 COLLATE utf8_general_ci;"
    if [[ $MARIADB_USER != "" ]]; then
        mysql -Bse "GRANT ALL ON \`$MARIADB_DATABASE\`.* to '$MARIADB_USER'@'%' IDENTIFIED BY '$MARIADB_PASSWORD';"
    fi
fi

mysqld_safe
