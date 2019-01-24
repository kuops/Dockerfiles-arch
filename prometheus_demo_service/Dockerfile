FROM alpine

RUN apk add curl \
    && curl -LO https://github.com/juliusv/prometheus_demo_service/releases/download/0.0.4/prometheus_demo_service-0.0.4.linux.amd64.tar.gz \
    && tar xf prometheus_demo_service-0.0.4.linux.amd64.tar.gz \
    && apk del curl

ENTRYPOINT ["./prometheus_demo_service"] 
