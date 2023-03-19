FROM steamcmd/steamcmd:ubuntu-22

RUN apt update && apt upgrade -y
RUN apt install -y \
    net-tools \
    rename \
    sudo
RUN addgroup --system steam && \
    adduser --system steam --ingroup steam --shell /bin/sh

RUN steamcmd +quit
RUN mkdir -p "/home/steam/.local/share/Arma 3"
RUN mkdir -p "/home/steam/.local/share/Arma 3 - Other Profiles"

COPY ["server.Arma3Profile", "/home/steam/.local/share/Arma 3 - Other Profiles/"]
COPY entrypoint.sh /
COPY server-install.sh /home/steam/
COPY server.cfg /home/steam/
ENTRYPOINT [ "/entrypoint.sh" ]
# RUN ~/steam/steamcmd.sh +force_install_dir /arma3 +login anonymous +app_update 233780 validate +quit