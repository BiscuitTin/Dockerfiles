#!/bin/sh
# Adapted from https://github.com/nodejs/docker-node/blob/961785b30d9a7cf1d46271e1b71fe0c68be44cff/14/bullseye/docker-entrypoint.sh
set -e

if [ "${1#-}" != "${1}" ] || [ -z "$(command -v "${1}")" ]; then
  set -- node "$@"
fi

exec "$@"
