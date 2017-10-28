#!/bin/sh
set -e

# fix permissions on data folder
chown -R xenorchestra:xenorchestra /app/data

# start App
cd /app/xo-server
exec "$@"
