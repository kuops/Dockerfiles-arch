FROM debian:9-slim

ENV INSTALL_CMD git jq curl

COPY get_image_tag.sh /usr/local/bin/

RUN  apt-get update \
     && apt-get install -y --no-install-recommends ${INSTALL_CMD} \
     && rm -rf /var/lib/apt/lists/* \
     && chmod +x /usr/local/bin/get_image_tag.sh \
     && mkdir /code

WORKDIR /code

ENTRYPOINT  ["/usr/local/bin/get_image_tag.sh"]
