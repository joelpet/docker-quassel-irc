FROM joelpet/debian:stretch
LABEL maintainer "Joel Pettersson <petterssonjoel@gmail.com>"

RUN (\
        export DEBIAN_FRONTEND=noninteractive; \

        apt-get update && \
        apt-get install -y \
            libqt5sql5-sqlite \
            quassel-core \
            sqlite3 \
            && \

        apt-get clean && \
        rm -rf \
            /tmp/* \
            /var/lib/apt/lists/* \
            /var/tmp/* \
    )

# A user `quasselcore` in group `quassel` is also created during setup.
USER quasselcore

EXPOSE 4242
CMD ["quasselcore", "--configdir=/var/lib/quassel"]
