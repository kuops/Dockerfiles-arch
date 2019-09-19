FROM debian:9.5-slim

ENV Kcptun_Url https://github.com/xtaci/kcptun/releases/download/v20181002/kcptun-linux-amd64-20181002.tar.gz
ENV Deps_Soft curl

RUN apt-get update \
    && apt-get install -y ${Deps_Soft} \
    && curl -L ${Kcptun_Url} |tar xz -C /usr/local/bin server_linux_amd64 \
    && mv /usr/local/bin/server_linux_amd64 /usr/local/bin/kcptun-server \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get purge -y --auto-remove ${Deps_Soft} 

CMD ["kcptun-server"]
