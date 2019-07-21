FROM nginx:1.15-alpine

RUN addgroup -g 82 -S www-data \
    && adduser -u 82 -D -S -G www-data www-data \
    && sed -i 's@user  nginx;@user  www-data;@g' /etc/nginx/nginx.conf
