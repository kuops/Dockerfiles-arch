FROM kuops/golang:latest as builder

ENV  GO111MODULE="on"
ENV  GOPROXY="https://goproxy.cn,direct"
ENV  GOSUMDB="off"

RUN  go build -o $GOPATH/bin/kcptun-server github.com/xtaci/kcptun/server

FROM kuops/alpine:latest 

COPY --from=builder /go/bin/kcptun-server /usr/local/bin/

COPY entrypoint.sh .

CMD ["./entrypoint.sh"]