#!/bin/sh

set -e

cp ${HOME}/basic.cfg /arma3/basic.cfg
cp ${HOME}/server.cfg /arma3/server.cfg

echo "password = \"$SERVER_PASSWORD\";" >> /arma3/server.cfg;
echo "passwordAdmin = \"$SERVER_ADMIN_PASSWORD\";" >> /arma3/server.cfg;
echo "serverCommandPassword = \"$SERVER_COMMAND_PASSWORD\";" >> /arma3/server.cfg;

mkdir -p /arma3/profiles/server
cp ${HOME}/server.Arma3Profile "/arma3/profiles/server/server.Arma3Profile"

cd "${HOME}/steamcmd"

./steamcmd.sh \
    +force_install_dir "/arma3" \
    +login "${STEAM_USERNAME}" "${STEAM_PASSWORD}" \
    +app_update 233780 \
    +quit

cd "/arma3"
./arma3server_x64 "$@" | tee arma3server_$(date +%m%e%Y-%H%M%S).rpt
