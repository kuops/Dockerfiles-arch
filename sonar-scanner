FROM java:openjdk-8-jre-alpine

ENV SONAR_SCANNER_VERSION 3.0.3.778

RUN apk add --no-cache --virtual .build-deps openssl ca-certificates \
    && cd /usr/local \
    && wget https://sonarsource.bintray.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-${SONAR_SCANNER_VERSION}-linux.zip \ 
    && unzip -d /usr/local sonar-scanner-cli-${SONAR_SCANNER_VERSION}-linux.zip \
    && ln -s /usr/local/sonar-scanner-3.0.3.778-linux/bin/sonar-scanner /usr/local/bin/ \
    && rm -f sonar-scanner-cli-${SONAR_SCANNER_VERSION}-linux.zip \
    && apk del .build-deps

WORKDIR /code

ENTRYPOINT ["/usr/local/bin/sonar-scanner"]
