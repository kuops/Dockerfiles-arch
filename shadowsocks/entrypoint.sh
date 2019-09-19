#!/bin/sh
set -x
set -e

PASSWORD=${PASSWORD:-123456}
PORT=${PORT:-15000}
ENCRYPT_METHOD=${ENCRYPT_METHOD:-"AES-256-CFB"}

/usr/local/bin/go-shadowsocks2 -s "ss://$ENCRYPT_METHOD:$PASSWORD@:$PORT" -verbose
