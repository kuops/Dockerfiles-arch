#!/bin/bash
set -x
set -e

SHADOWSOCK_ADDR=${SHADOWSOCK_ADDR:-"127.0.0.1:8388"}
LISTEN=${LISTEN:-":29900"}
PASSWORD=${PASSWORD:-123456}


/usr/bin/kcptun-server -t ${SHADOWSOCK_ADDR} -l ${LISTEN} -k ${PASSWORD} 
