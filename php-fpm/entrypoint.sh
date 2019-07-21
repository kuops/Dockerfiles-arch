#!/bin/sh
set -e

if [ "$1" == "php-fpm" ]; then
   chown -R www:www /var/www/html
fi

exec "$@"
