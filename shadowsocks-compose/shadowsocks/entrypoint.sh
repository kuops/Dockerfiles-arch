#!/bin/bash

PASSWORD=${PASSWORD:-123456}
PORT=${PORT:-15000}
ENCRYPT_METHOD=${ENCRYPT_METHOD:-"aes-256-cfb"}

/usr/local/bin/shadowsocks-server  -k $PASSWORD -p $PORT -m $ENCRYPT_METHOD
