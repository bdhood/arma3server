#!/bin/sh

set -ex

cd "${HOME}/Steam"
if [ ! -f "steamcmd.sh" ]; then
    curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar zxvf -
fi
./steamcmd.sh +force_install_dir ./arma3 +login "${STEAM_USERNAME}" "${STEAM_PASSWORD}" +app_update 233780 +quit

cd "./arma3"
./arma3server_x64 "$@"
