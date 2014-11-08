FROM joelpet/debian:jessie
MAINTAINER Joel Pettersson <petterssonjoel@gmail.com>

RUN (export DEBIAN_FRONTEND=noninteractive ; \
        apt-get update && \
        apt-get install -y quassel-core)

# The setup of quassel-core creates /var/lib/quassel and generates a
# certificate in there.

EXPOSE 4242

# A user `quasselcore` in group `quassel` is also created during setup.

USER quasselcore

CMD ["quasselcore", "--configdir=/var/lib/quassel"]
