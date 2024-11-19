#!/bin/bash
set -e

_env=$1

if [ -z "$_env" ]; then
  echo "Usage: $0 <environment>"
  exit 1
fi

if ! docker network inspect ${_env}_frontend >/dev/null 2>&1; then
  docker network create \
    --attachable \
    --driver overlay \
    ${_env}_frontend
fi

if ! docker network inspect ${_env}_backend >/dev/null 2>&1; then
  docker network create \
    --attachable \
    --driver overlay \
    ${_env}_backend
fi

if ! docker network inspect ${_env}_proxy >/dev/null 2>&1; then
  docker network create \
    --attachable \
    --driver overlay \
    ${_env}_proxy
fi

if ! docker volume inspect ${_env}_mysql_data >/dev/null 2>&1; then
  docker volume create ${_env}_mysql_data
fi

if ! docker volume inspect ${_env}_elasticsearch_data >/dev/null 2>&1; then
  docker volume create ${_env}_elasticsearch_data
fi

if ! docker volume inspect ${_env}_redis_data >/dev/null 2>&1; then
  docker volume create ${_env}_redis_data
fi

if ! docker volume inspect ${_env}_proxy_data >/dev/null 2>&1; then
  docker volume create ${_env}_proxy_data
fi

if ! docker volume inspect ${_env}_letsencrypt_data >/dev/null 2>&1; then
  docker volume create ${_env}_letsencrypt_data
fi

export BUILD_CONTEXT=$(dirname $(pwd))

docker compose --project-name ${_env}-core -f ${_env}/core.yml up -d
