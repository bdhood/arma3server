FROM ubuntu:22.10

ARG STEAM_USERNAME
ARG STEAM_PASSWORD

RUN apt update && \
    apt upgrade -y && \
    apt install -y \
        curl \
        lib32gcc-s1 \
        net-tools \
        rename \
        software-properties-common \
        tmux
RUN addgroup \
        --system steam && \
    adduser \
        --system steam \
        --ingroup steam \
        --shell /bin/sh

USER steam:steam

RUN mkdir -p "/home/steam/.local/share/Arma 3" && mkdir -p "/home/steam/.local/share/Arma 3 - Other Profiles"
COPY ["server.Arma3Profile", "/home/steam/.local/share/Arma 3 - Other Profiles/"]
COPY server.cfg /home/steam/
COPY entrypoint.sh /home/steam
ENTRYPOINT [ "/home/steam/entrypoint.sh" ]
CMD [ "-name=server", "-config=/home/steam/server.cfg", "-world=empty"]