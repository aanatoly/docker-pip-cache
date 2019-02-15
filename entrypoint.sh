#!/bin/bash

set -x

DEVPI_SERVERDIR="/data/server"
DEVPI_CLIENTDIR="/data/client"


function initialise_devpi {
    devpi-server --restrict-modify root --start --host 127.0.0.1 --port 3141 --init
    devpi-server --status
    devpi use http://localhost:3141
    devpi login root --password=''
    devpi user -m root password="${DEVPI_PASSWORD}"
    devpi index -y -c public pypi_whitelist='*'
    devpi-server --stop
    devpi-server --status
}

echo $PWD

args="--restrict-modify root --host 0.0.0.0 --port 3141 --serverdir ${DEVPI_SERVERDIR}"
if [ ! -f  $DEVPI_SERVERDIR/.serverversion ]; then
    echo "[RUN]: Initialise devpi-server"
    devpi-server $args --init
fi

echo "[RUN]: Launching devpi-server"
exec devpi-server $args --threads 20
