#!/bin/sh
docker run \
    --volumes-from quasselirc_core_1 \
    -v /var/backups/:/backup \
    joelpet/debian:stretch \
    tar cvf /backup/quassel_data.tar /var/lib/quassel
