#!/bin/sh
STACK_NAME="PrometheusStarLink"

docker stack deploy --with-registry-auth --compose-file=./docker-compose.yml ${STACK_NAME}