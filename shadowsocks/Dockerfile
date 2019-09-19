FROM golang:1.13.0-alpine as builder

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
    && apk add --no-cache git \
    && go env -w GOPROXY="https://goproxy.cn,direct" \
    && go env -w GO111MODULE="on" \
    && go get -u -v github.com/shadowsocks/go-shadowsocks2

FROM kuops/alpine:latest

WORKDIR /root/

COPY --from=builder /go/bin/go-shadowsocks2 /usr/local/bin/

COPY entrypoint.sh .

CMD ["./entrypoint.sh"]
