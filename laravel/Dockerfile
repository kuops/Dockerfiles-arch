FROM php:7.2-fpm-alpine

ENV TIMEZONE="Asia/Shanghai" 

# replace apk repo
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories \
        && apk update \
# setting timezone
	&& apk add --no-cache tzdata \
	&& ln -sf /usr/share/zoneinfo/${TIMEZONE} /etc/localtime \
	&& echo "${TIMEZONE}" > /etc/timezone

# install php ext
RUN     apk add --no-cache --virtual .build-deps \
            gd-dev \
            m4 \
            autoconf \
            dpkg-dev \
            dpkg \
            libmagic \
            file \
            binutils \
            isl \
            libatomic \
            mpfr3 \
            mpc1 \
            gcc \
            musl-dev \
            libc-dev \
            g++ \
            make \
            re2c \
        && apk add --no-cache --virtual .run-deps \
            libpng-dev \
            bzip2-dev \
            gettext-dev \
            libxml2-dev \
            libxslt-dev \
            zlib-dev \
	&& docker-php-ext-install -j$(nproc) \
           gd \
           bcmath \
           bz2 \
           calendar \
           exif \
           gettext \
           mysqli \
           pdo_mysql \
           sockets \
           pcntl \
           wddx \
           xmlrpc \
           xsl \
           opcache \
           zip

RUN     curl -fsSL https://pecl.php.net/get/redis-4.2.0.tgz -o /tmp/redis-4.2.0.tgz \
        && mkdir /tmp/redis \
        && tar -xf /tmp/redis-4.2.0.tgz -C /tmp/redis --strip-components=1 \
        && rm -f /tmp/redis-4.2.0.tgz \
        && ( \
		cd /tmp/redis \
		&& phpize \
		&& ./configure --enable-redis \
		&& make -j "$(nproc)" \
		&& make install \
	) \
        && rm -r /tmp/redis \
	&& docker-php-ext-enable redis

# clean cache
RUN    apk del --no-cache .build-deps \
       && rm -rf /var/cache/apk/* \
       && rm -rf /tmp/*
