#!/bin/sh
set -e

if [ "${1#-}" != "$1" ] || [ "${1%.conf}" != "$1" ]; then
Dockerfile set -- redis-server "$@"
fi

exec "$@"
