############################################################
# Dockerfile that builds a Insurgency Gameserver
############################################################
FROM cm2network/steamcmd
LABEL maintainer="leandrolive@gmail.com"

ARG PORT=27015
ARG MAP=buhriz_coop 
ARG MAXPLAYERS=45
ARG LOGFILE=insurgency.log
ARG MMSOURCE_ADRS=https://mms.alliedmods.net/mmsdrop/1.10/mmsource-1.10.7-git968-linux.tar.gz
ARG MMSOURCE_PKG=mmsource-1.10.7-git968-linux.tar.gz
ARG SOURCEMOD_ADRS=https://sm.alliedmods.net/smdrop/1.9/sourcemod-1.9.0-git6275-linux.tar.gz
ARG SOURCEMOD_PKG=sourcemod-1.9.0-git6275-linux.tar.gz

WORKDIR /home/steam

# Run Steamcmd, install Insurgency, install metamod, install sourcemod and create logs folder
RUN set -x \
        && steamcmd/steamcmd.sh \
        +login anonymous \
        +force_install_dir /home/steam/insurgency-dedicated \
        +app_update 237410 validate \
        +quit \
        && wget ${MMSOURCE_ADRS} \
        && tar xf ${MMSOURCE_PKG} -C insurgency-dedicated/insurgency/ \
        && rm ${MMSOURCE_PKG} \
        && wget ${SOURCEMOD_ADRS} \
        && tar xf ${SOURCEMOD_PKG} -C insurgency-dedicated/insurgency/ \
        && rm ${SOURCEMOD_PKG} \
        &&  mkdir logs

VOLUME insurgency-dedicated insurgency-logs

# Insert insurgency dynamic libraries to the LD_LIBRARY_PATH. Create enviroment variables for common game settings. 
ENV LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/home/steam/insurgency-dedicated/bin
ENV GAMEPORT=${PORT} FIXEDMAXPLAYERS=${MAXPLAYERS} STARTMAP=${MAP}

# Set Entrypoint; Technically 2 steps: 1. Update server, 2. Start server
ENTRYPOINT steamcmd/steamcmd.sh +login anonymous +force_install_dir /home/steam/insurgency-dedicated +app_update 237410 +quit && \
          cd insurgency-dedicated && \
          ./srcds_linux -console +sv_lan 0 +map ${STARTMAP} Port=${GAMEPORT} +maxplayers ${FIXEDMAXPLAYERS} +mp_coop_lobbysize 8 -workshop 2>&1 > ../logs/${LOGFILE}

# Expose ports
EXPOSE ${GAMEPORT}
