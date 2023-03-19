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

WORKDIR /home/steam
RUN mkdir -p ".local/share/Arma 3" && mkdir -p ".local/share/Arma 3 - Other Profiles"
COPY ["server.Arma3Profile", ".local/share/Arma 3 - Other Profiles/"]
COPY server.cfg .
COPY entrypoint.sh .
RUN chown -R steam:steam /home/steam

USER steam:steam

ENTRYPOINT [ "/home/steam/entrypoint.sh" ]
CMD [ "-name=server", "-config=/home/steam/server.cfg", "-world=empty"]