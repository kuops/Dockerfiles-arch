FROM php:7.2.8-fpm-stretch

ENV PHP_DEPS \
		autoconf \
		libtool-bin \
		libzip-dev \
		lbzip2 \
		libxml2-dev \
		bzip2 \
		re2c \
		libbz2-dev \
		libjpeg-dev \
                libpng-dev \
                libgmp-dev \
                libedit-dev \
                libfreetype6-dev \
		libmcrypt-dev \
		libcurl4-openssl-dev \
                libmemcached-dev

RUN apt-get clean \
    && apt-get update --fix-missing \
    && apt-get install -y \
		$PHP_DEPS \
		ca-certificates \
		curl \
		xz-utils \
	--no-install-recommends && rm -r /var/lib/apt/lists/* \
    && docker-php-ext-configure pdo_mysql --with-pdo-mysql=mysqlnd \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-configure mysqli --with-mysqli=mysqlnd \
    && docker-php-ext-install mysqli \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/lib \
    && docker-php-ext-install -j$(nproc) gd soap intl gmp bcmath mbstring zip pcntl sockets bz2 shmop readline exif opcache \
    && pecl install redis-4.0.1 \
    && pecl install xdebug-2.6.0 \
    && pecl install memcached-3.0.4 \
    && docker-php-ext-enable redis xdebug memcached \
    && apt-get purge -y --auto-remove $PHP_DEPS

