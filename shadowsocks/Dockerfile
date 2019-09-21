FROM kuops/python:latest

RUN pip3 install shadowsocks \
    &&  sed -i 's@cleanup@reset@g' /usr/lib/python3.7/site-packages/shadowsocks/crypto/openssl.py

COPY entrypoint.sh .

CMD ["./entrypoint.sh"]
