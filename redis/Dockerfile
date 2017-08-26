FROM debian:jessie-slim

RUN     apt-get update \
	&& apt-get install -y --no-install-recommends wget gcc libc6-dev make curl ca-certificates \
	&& curl -sSL https://get.rvm.io | bash -s stable \
	&& rvm install 2.3.4 \
	&& rvm --default use 2.3.4 \
	&& rm -rf /var/lib/apt/lists/* \
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
        && apt-get purge -y --auto-remove wget gcc libc6-dev make curl ca-certificates \
        && mkdir /data

VOLUME /data
WORKDIR /data
EXPOSE 6379
COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["redis-server"]
