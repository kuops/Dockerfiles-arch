# shadowsocks

using go-shadowsocks2 server 


## Usage

```
docker run -d \
    -e PASSWORD=123456 \
    -e PORT=15000 \
    -e ENCRYPT_METHOD=AES-256-CFB \
    imagename
```
