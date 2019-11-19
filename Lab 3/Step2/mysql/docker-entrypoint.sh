#!/bin/bash
chown -R mysql:mysql /var/lib/mysql /var/run/mysqld

sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/my.cnf
sed -i "s/dbname/$MYSQL_DB_NAME/g" init.sql
sed -i "s/dbuser/$MYSQL_DB_USER/g" init.sql
sed -i "s/dbpassword/$MYSQL_DB_PASSWORD/g" init.sql

mysqld --init-file="/init.sql"