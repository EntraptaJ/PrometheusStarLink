#!/bin/sh
PROMETHEUS_CORE1_DATA_VOLUME="prometheusStarLinkPrometheusCore1Data"

GRAFANA_DATA_VOLUME="prometheusStarLinkGrafanaData"

STACK_NAME="PrometheusStarLink"

echo "Preparing ${STACK_NAME} Stack."

echo "Creating Prometheus Core Data volumes"
docker volume create ${PROMETHEUS_CORE1_DATA_VOLUME}

echo "Provisioning main data Volume"

docker run -it --rm -v ${PROMETHEUS_CORE1_DATA_VOLUME}:/tmp/data alpine touch /tmp/data/helloWorld

docker run -it --rm -v ${PROMETHEUS_CORE1_DATA_VOLUME}:/tmp/data alpine chown -R 1000:1000 /tmp

echo "Creating other Data volume"
docker volume create ${GRAFANA_DATA_VOLUME}

echo "Provisioning other data Volume"

docker run -it --rm -v ${GRAFANA_DATA_VOLUME}:/tmp/data alpine touch /tmp/data/helloWorld
docker run -it --rm -v ${GRAFANA_DATA_VOLUME}:/tmp/data alpine chown -R 472:472 /tmp