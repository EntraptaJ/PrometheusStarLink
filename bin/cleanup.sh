#!/bin/sh
STACK_NAME="PrometheusStarLink"

PROMETHEUS_CORE1_DATA_VOLUME="prometheusStarLinkPrometheusCore1Data"

GRAFANA_DATA_VOLUME="prometheusStarLinkGrafanaData"

echo "Cleaning up ${STACK_NAME} stack"

docker stack rm ${STACK_NAME}

echo "Waiting 30 seconds to ensure all containers are removed"

sleep 30

echo "Removing data volumes"

echo "Removing Core Data Volumes"

docker volume rm ${PROMETHEUS_CORE1_DATA_VOLUME}

echo "Removing Grafana Data Volumes"

docker volume rm ${GRAFANA_DATA_VOLUME}