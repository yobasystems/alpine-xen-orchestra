#!/bin/sh
set -e
rpcbind

mkdir -p /app/data
chown ${USER}:${USER} /app/data

exec su-exec ${USER} "$@"
