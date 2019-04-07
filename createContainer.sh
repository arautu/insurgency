#!/bin/sh

IMAGE="${IMAGE:-arauto/insurgency:0.95}"
PORT="${PORT:-27015}"

echo "Starting Server..."
docker run --detach \
  --interactive \
  --publish ${PORT}:${PORT} \
  --publish ${PORT}:${PORT}/udp \
  --name insurgency \
  --log-driver json-file \
  --log-opt max-size=100m \
  --log-opt max-file=10 \
  --mount type=volume,source=insurgency-files,target=/home/steam/insurgency-dedicated \
  --env "GAMEPORT=${PORT}" \
  ${IMAGE}
#  --publish 1200:1200 \
#  --publish 27005:27005/udp \
#  --publish 27020:27020/udp \
#  --publish 26901:26901/udp \
#  --mount type=bind,source="$(pwd)"/docker/custom,target=/home/steam/custom \
#  --entrypoint "/home/steam/custom/start.sh" \
