# kcptun

```
docker run -d \
    -e PASSWORD=123456 \
    -e LISTEN=":29900" \
    -e SHADOWSOCK_ADDR="127.0.0.1:8388" \
    kuops/kcptun
```