FROM alpine:3.8

RUN apk add --no-cache curl tar

ARG ISTIO_VERSION=1.0.5
RUN curl -LO https://github.com/istio/istio/releases/download/${ISTIO_VERSION}/istio-${ISTIO_VERSION}-linux.tar.gz
RUN tar xf istio-${ISTIO_VERSION}-linux.tar.gz --strip-components 2 -C /usr/local/bin  istio-1.0.5/bin/istioctl 

RUN apk del -no-cache curl tar
RUN rm istio-${ISTIO_VERSION}-linux.tar.gz
