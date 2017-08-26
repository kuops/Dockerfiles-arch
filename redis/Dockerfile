FROM debian:jessie-slim
RUN apt-get update \
    && apt-get -y install --no-install-recommends wget ca-certificates gcc libc6-dev make python-software-properties software-properties-common \
    && apt-add-repository ppa:brightbox/ruby-ng \
    && apt-get -y install ruby2.3 \
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
    && apt-get purge -y --auto-remove wget ca-certificates gcc libc6-dev make python-software-properties software-properties-common \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir /data

VOLUME /data
WORKDIR /data
EXPOSE 6379
COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["redis-server"]
