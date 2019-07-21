FROM debian:9.5-slim

ENV ShadowSocks_Ver 1.2.1
ENV ShadowSocks_Url  https://github.com/shadowsocks/shadowsocks-go/releases/download/${ShadowSocks_Ver}/shadowsocks-server.tar.gz
ENV Deps_Soft curl

RUN apt-get update \
    && apt-get install -y ${Deps_Soft} \
    && curl -L ${ShadowSocks_Url} |tar xz -C /usr/local/bin/ \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get purge -y --auto-remove ${Deps_Soft} 

COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
