#!/usr/bin/env bash

STARTMAP=buhriz_coop
MAXPLAYERS=43

set -e

# Update the game
/home/steam/steamcmd/steamcmd.sh +login anonymous +force_install_dir /home/steam/insurgency-dedicated +app_update 237410 +quit

# Start the game server
cd /home/steam/insurgency-dedicated
srcds_linux -console +map ${STARTMAP} +port ${GAMEPORT} +maxplayers ${MAXPLAYERS}  +sv_lan 0 +mp_coop_lobbysize 8 -workshop +sv_pure 0

exec srcds_linux "$@"
exec "$@"
