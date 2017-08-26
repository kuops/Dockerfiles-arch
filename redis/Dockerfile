FROM debian:jessie-slim

RUN mkdir -p /usr/local/etc \
	&& { \
		echo 'install: --no-document'; \
		echo 'update: --no-document'; \
	} >> /usr/local/etc/gemrc

ENV RUBY_MAJOR 2.3
ENV RUBY_VERSION 2.3.4
ENV RUBYGEMS_VERSION 2.6.12

RUN set -ex \
	\
	&& buildDeps=' \
		bison \
		dpkg-dev \
		libgdbm-dev \
		ruby \
		wget \
		autoconf \
		gcc \
		libc6-dev \
		make \
		curl \
		ca-certificates \
	' \


	&& apt-get update \
	&& apt-get install -y --no-install-recommends $buildDeps \
	&& rm -rf /var/lib/apt/lists/* \
	&& wget -O ruby.tar.xz "https://cache.ruby-lang.org/pub/ruby/${RUBY_MAJOR%-rc}/ruby-$RUBY_VERSION.tar.xz" \
	&& mkdir -p /usr/src/ruby \
	&& tar -xJf ruby.tar.xz -C /usr/src/ruby --strip-components=1 \
	&& rm ruby.tar.xz \
	&& cd /usr/src/ruby \

	&& { \
		echo '#define ENABLE_PATH_CHECK 0'; \
		echo; \
		cat file.c; \
	} > file.c.new \
	
	&& mv file.c.new file.c \
	&& autoconf \
	&& gnuArch="$(dpkg-architecture --query DEB_BUILD_GNU_TYPE)" \
	&& ./configure \
		--build="$gnuArch" \
		--disable-install-doc \
		--enable-shared \
	&& make -j "$(nproc)" \
	&& make install \
	&& cd / \
	&& rm -r /usr/src/ruby \
	&& gem update --system "$RUBYGEMS_VERSION" \
	
        && wget -O redis.tar.gz http://download.redis.io/releases/redis-4.0.1.tar.gz \
        && mkdir -p /usr/src/redis \
        && tar -xzf redis.tar.gz -C /usr/src/redis --strip-components=1 \
        && rm redis.tar.gz \
        && make -C /usr/src/redis -j "$(nproc)" \
        && make -C /usr/src/redis install \
        && cp /usr/src/redis/src/redis-trib.rb /usr/local/bin/ \
        && chmod +x /usr/src/redis/src/redis-trib.rb \
        && rm -r /usr/src/redis \
        && gem install redis \
        && apt-get purge -y --auto-remove wget ca-certificates $buildDeps \
        && rm -rf /var/lib/apt/lists/* \
        && mkdir /data

VOLUME /data
WORKDIR /data
EXPOSE 6379
COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["redis-server"]
