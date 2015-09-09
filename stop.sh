#!/usr/bin/env bash

DOCKER_COMPOSE_BIN=`which docker-compose`

# env
if [ -z "$DOCKER_HOST" ]; then
    echo "no DOCKER_HOST env set";
    exit 1
fi
if [ -z "$DOCKER_COMPOSE_BIN" ]; then
    echo "docker-compose binary not found";
    exit 1
fi

echo "stop docker containers"
if ! $DOCKER_COMPOSE_BIN stop ; then
    echo "starting docker containers failed";
    exit 1
fi

echo "done"