#!/usr/bin/env bash

openssl req -newkey rsa:4096 -x509 -sha256 -days 3650 -nodes -out /etc/nginx/certificate.crt \
-keyout /etc/nginx/private.key -subj "/C=RU/ST=Moscow/L=Moscow /O=21 School/OU=srorscha/CN=srorscha.42.fr/emailAddress=unknown"
if [ -f /var/www/nginx.conf ]; then
mv /var/www/nginx.conf /etc/nginx/sites-available/default
fi
echo "Starting nginx"
chown -R www-data:www-data	/var/www/*
chmod -R 755			/var/www/*
exec "$@"
