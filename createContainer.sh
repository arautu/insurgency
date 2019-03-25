#!/bin/sh

IMAGE="${IMAGE:-arauto/insurgency:0.5}"
GAMEPORT="${GAMEPORT:-27015}"

echo "Starting Server..."
docker run --detach \
  --interactive \
  --publish ${GAMEPORT}:${GAMEPORT} \
  --publish ${GAMEPORT}:${GAMEPORT}/udp \
  --log-driver json-file \
  --log-opt max-size=100m \
  --log-opt max-file=10 \
  --name insurgency \
  --mount type=volume,source=insurgency,target=/home/steam/insurgency-dedicated \
  --mount type=bind,source="$(pwd)"/docker/custom,target=/home/steam/custom \
  --env "PORT=${GAMEPORT}" \
  ${IMAGE}
