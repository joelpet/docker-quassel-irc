#!/bin/sh
docker run \
    --rm \
    --volumes-from quasselirc_core_1 \
    -v /var/backups/:/backup \
    joelpet/debian:stretch \
    tar cvf /backup/quassel_data.tar /var/lib/quassel
