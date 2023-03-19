#!/bin/sh

set -ex

chown -R steam:steam /root/Steam
chown -R steam:steam /home/steam/.local/share

su steam -c sh << EOF
    whoami
    ls -al /home/steam/.local
    ls -al /home/steam/.local/share
    steamcmd +force_install_dir /home/steam/Steam/arma3 +login "${STEAM_USERNAME}" "${STEAM_PASSWORD}" +app_update 233780 +quit
EOF

chown -R steam:steam /home/steam/Steam/arma3
su steam -c sh << EOF
    cd "/home/steam/Steam/arma3"
    ./arma3server_x64 -name=server -config=/home/steam/server.cfg -world=empty
EOF