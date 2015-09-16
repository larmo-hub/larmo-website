#!/usr/bin/env bash

VAGRANT_IP="192.168.33.10"
LOG="track_bootstrap_file.txt"
OVERRIDE_NONE="AllowOverride None"
OVERRIDE_ALL="AllowOverride All"

touch $LOG
echo -e "Larmo Hub - Website"

apt-get update
echo "> packages updated" >> $LOG

apt-get install -y apache2 apache2-mpm-prefork apache2.2-bin apache2.2-common
echo "> apache server installed" >> $LOG

sed -i "s/$OVERRIDE_NONE/$OVERRIDE_ALL/g" /etc/apache2/sites-available/default
echo "ServerName $VAGRANT_IP" > /etc/apache2/httpd.conf
echo "> changed 'ServerName' and 'override' option" >> $LOG

a2enmod rewrite
echo "> enable apache module - rewrite" >> $LOG

service apache2 restart
echo "> restart services" >> $LOG

sudo apt-get install -y nodejs nodejs-dev npm
echo "> install nodejs" >> $LOG

sudo apt-get install -y ruby ruby-sass
echo "> install CSS tools" >> $LOG

cd /var/www/
npm install
./node_modules/.bin/bower install
./node_modules/.bin/gulp css
echo "> setup project" >> $LOG