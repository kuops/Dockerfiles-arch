FROM debian:9-slim

ENV INSTALL_CMD ssh git jq curl ca-certificates

RUN  apt-get update \
     && apt-get install -y --no-install-recommends ${INSTALL_CMD} \
     && rm -rf /var/lib/apt/lists/* \
     && mkdir /code

WORKDIR /code
