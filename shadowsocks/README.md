# shadowsocks

default port: 8388
default password: 123456
default encrypt_mothod: aes-256-cfb

## Usage

```
docker run -d \
    -e PASSWORD=123456 \
    -e PORT=16000 \
    -e ENCRYPT_METHOD=aes-256-cfb \
    kuops/shadowsocks
```
