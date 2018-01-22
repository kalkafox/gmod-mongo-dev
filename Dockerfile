FROM kalka/steamcmd:latest
LABEL maintainer="Kalka <k@kalka.io>"

RUN /opt/steamcmd/steamcmd.sh +login anonymous +force_install_dir /home/steam/garrysmod +app_update 4020 validate +quit

ENV port=27015

ENV LD_LIBRARY_PATH=/home/steam/bin

RUN curl -o /home/steam/garrysmod/bin/libmongoclient.so https://dl.kalka.io/libmongoclient.so

EXPOSE ${port}/udp

WORKDIR /home/steam/garrysmod

ENTRYPOINT ["./srcds_run"]
