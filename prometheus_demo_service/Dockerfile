FROM golang:1.11-alpine AS build

RUN apk add git

RUN git clone https://github.com/juliusv/prometheus_demo_service.git \
    && go get github.com/prometheus/client_golang/prometheus 

WORKDIR prometheus_demo_service

RUN  CGO_ENABLED=0 GOOS=linux go build -a -o prometheus_demo_service .


FROM alpine

COPY --from=build /prometheus_demo_service/prometheus_demo_service .

CMD ["./prometheus_demo_service"]  

