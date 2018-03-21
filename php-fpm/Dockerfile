FROM php:fpm-alpine3.7

RUN apk add --no-cache --virtual .php-build-deps \
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
    && docker-php-ext-configure mysqli --with-mysqli=mysqlnd \
    && docker-php-ext-install mysqli \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/lib \
    && docker-php-ext-install -j$(nproc) gd soap intl gmp bcmath mbstring zip pcntl sockets bz2 shmop readline exif opcache

RUN pecl install memcached \
    && pecl install redis \
    && pecl install xdebug-2.6.0 \
    && apk del --no-cache .php-build-deps


#ENV PHP_EXT_SOFT redis
#ENV PHP_EXT_SOFT_VER 4.0.0
#RUN export https_proxy=192.168.3.173:1080 \
#        &&curl -fsSL "https://pecl.php.net/get/${PHP_EXT_SOFT}-${PHP_EXT_SOFT_VER}.tgz" -o ${PHP_EXT_SOFT}.tar.gz \
#	&& mkdir -p /tmp/${PHP_EXT_SOFT} \
#	&& tar -xf ${PHP_EXT_SOFT}.tar.gz -C /tmp/${PHP_EXT_SOFT} --strip-components=1 \
#	&& rm ${PHP_EXT_SOFT}.tar.gz \
#	&& docker-php-ext-configure /tmp/${PHP_EXT_SOFT} --enable-${PHP_EXT_SOFT} \
#	&& docker-php-ext-install /tmp/${PHP_EXT_SOFT} \
#	&& rm -r /tmp/${PHP_EXT_SOFT} \
#        && unset https_proxy

#RUN apk del --no-cache .php-build-deps
