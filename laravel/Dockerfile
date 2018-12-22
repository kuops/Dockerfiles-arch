FROM php:7.2-fpm-alpine

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories \
    && apk update \
    && apk add --no-cache --virtual .php-build-deps \
		libmemcached-dev \
                bzip2-dev \
                gd-dev \
                libpng-dev \
                freetype-dev \
                gettext-dev \
                readline-dev \
                jpeg-dev \
                libxml2-dev \
                icu-dev \
                gmp-dev \
                libedit-dev \
    && docker-php-ext-configure pdo_mysql --with-pdo-mysql=mysqlnd \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/lib \
    && docker-php-ext-install -j$(nproc) gd soap intl gmp bcmath mbstring zip pcntl sockets bz2 shmop readline exif opcache \
    && docker-php-ext-enable opcache \
    && apk del --no-cache .php-build-deps \
    && rm -rf /var/cache/apk/*

CMD ["php-fpm"]
