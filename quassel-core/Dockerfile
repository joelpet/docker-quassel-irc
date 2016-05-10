FROM joelpet/debian:jessie
MAINTAINER Joel Pettersson <petterssonjoel@gmail.com>

RUN (\
        export DEBIAN_FRONTEND=noninteractive; \
        apt-get update && \
        apt-get install -y quassel-core && \
        rm -rf /var/lib/apt/lists/* \
    )

# The setup of quassel-core creates /var/lib/quassel and generates a
# certificate in there.
COPY quasselCert.pem /var/lib/quassel/

# A user `quasselcore` in group `quassel` is also created during setup.
USER quasselcore

EXPOSE 4242
CMD ["quasselcore", "--configdir=/var/lib/quassel"]
