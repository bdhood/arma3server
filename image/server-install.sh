#!/bin/sh

set -ex

steamcmd +force_install_dir /home/steam/Steam/arma3 +login "${STEAM_USERNAME}" "${STEAM_PASSWORD}" +app_update 233780 +quit
