FROM cm2network/steamcmd:latest

USER root

RUN apt update && \
    apt install net-tools unzip -y
RUN mkdir /arma3 && \
    chown steam:steam /arma3 && \
    chmod -R 0700 /arma3

COPY --chown=steam:steam entrypoint.sh /home/steam
USER steam:steam

EXPOSE 2302/udp 2303/udp 2304/udp 2305/udp 2306/udp
VOLUME ["/arma3", "/home/steam/basic.cfg", "/home/steam/server.cfg", "/home/steam/server.Arma3Profile"]
ENTRYPOINT [ "/home/steam/entrypoint.sh" ]
CMD ["-name=server", "-cfg=basic.cfg", "-config=server.cfg", "-profiles=/arma3/profiles"]