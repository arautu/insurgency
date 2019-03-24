#!/bin/sh

IMAGE="${IMAGE:-arauto/insurgency:0.1}"
GAMEPORT="${GAMEPORT:-27015}"
STARTMAP="${STARTMAP:-buhriz_coop}"
TOTALPLAYERS="${TOTALPLAYERS:-45}"

echo "Starting Server..."
docker run --detach \
  --publish ${GAMEPORT}:${GAMEPORT} \
  --publish ${GAMEPORT}:${GAMEPORT}/udp \
  --name insurgency \
  --mount type=volume,source=insurgency-dedicated,target=/home/steam/insurgency-dedicated \
  --mount type=volume,source=insurgency-logs,target=/home/steam/logs \
  --env "PORT=${GAMEPORT}" \
  --env "MAP=${STARTMAP}" \
  --env "MAXPLAYERS=${TOTALPLAYERS}" \
  ${IMAGE}
