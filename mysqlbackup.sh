#! /bin/bash

 TIMESTAMP=$(date +"%F")
 BACKUP_DIR="/var/www/html/mysqlbackups/backup/$TIMESTAMP"
 MYSQL_USER="backup"
 MYSQL=/usr/bin/mysql
 MYSQL_PASSWORD="jmrbackup"
 MYSQLDUMP=/usr/bin/mysqldump

mkdir -p "$BACKUP_DIR"

#connect to MYSQL and enumerate databases
databases=`$MYSQL --user=$MYSQL_USER -p$MYSQL_PASSWORD -e "SHOW DATABASES;" | grep -Ev "(Database|information_schema)"`

#dump database data for each
    for db in $databases; do
        $MYSQLDUMP --force --opt --user=$MYSQL_USER -p$MYSQL_PASSWORD --databases $db --verbose | gzip > "/$BACKUP_DIR/$    done

# clear files older than 14 days
find "/var/www/html/mysqlbackups/backup/" -mtime +14 -delete
