###########################################################
# Dockerfile that builds a Insurgency Gameserver
############################################################
FROM cm2network/steamcmd
LABEL maintainer="leandrolive@gmail.com"

ARG PORT=27015
ARG MMSOURCE_ADRS=https://mms.alliedmods.net/mmsdrop/1.10/mmsource-1.10.7-git968-linux.tar.gz
ARG MMSOURCE_PKG=mmsource-1.10.7-git968-linux.tar.gz
ARG SOURCEMOD_ADRS=https://sm.alliedmods.net/smdrop/1.9/sourcemod-1.9.0-git6275-linux.tar.gz
ARG SOURCEMOD_PKG=sourcemod-1.9.0-git6275-linux.tar.gz

WORKDIR /home/steam

# Run steamcmd, install insurgency, metamod, sourcemod and create custom folder.
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
        && mkdir custom

# RUN set -x \
#         && steamcmd/steamcmd.sh \
#         +login anonymous \
#         +force_install_dir /home/steam/insurgency-dedicated \
#         +app_update 237410 validate \
#         +quit
#         
# RUN set -x \
#         && wget ${MMSOURCE_ADRS} \
#         && tar xf ${MMSOURCE_PKG} -C insurgency-dedicated/insurgency/ \
#         && rm ${MMSOURCE_PKG} \
#         && wget ${SOURCEMOD_ADRS} \
#         && tar xf ${SOURCEMOD_PKG} -C insurgency-dedicated/insurgency/ \
#         && rm ${SOURCEMOD_PKG}
# 
# RUN set -x \        
#         && mkdir custom
 
VOLUME insurgency
COPY custom/start.sh .

# Insert insurgency dynamic libraries to the LD_LIBRARY_PATH. Create enviroment variables
# for common game settings. 
ENV LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/home/steam/insurgency-dedicated/bin
ENV GAMEPORT=${PORT}

# Set Entrypoint
ENTRYPOINT ./start.sh

# Expose ports
EXPOSE ${GAMEPORT}
