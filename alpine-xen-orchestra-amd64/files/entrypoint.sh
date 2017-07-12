#!/bin/sh
set -e

# storge directory and fix perms
mkdir -p /app/data
chown -R xenorchestra:xenorchestra /app/data

# start App
cd /app/xo-server
exec "$@"
