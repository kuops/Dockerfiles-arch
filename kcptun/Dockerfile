FROM kuops/golang:latest as builder

ENV  GO111MODULE="on"
ENV  GOPROXY="https://goproxy.cn,direct"
ENV  GOSUMDB="off"

RUN  apk add git \
     &&  git clone -b 'v20190905' --depth 1 https://github.com/xtaci/kcptun.git \
     &&  cd kcptun/server \
     && go build -o $GOPATH/bin/kcptun-server

FROM kuops/alpine:latest 

COPY --from=builder /go/bin/kcptun-server /usr/local/bin/

COPY entrypoint.sh .

CMD ["./entrypoint.sh"]