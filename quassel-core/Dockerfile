FROM joelpet/debian:testing
MAINTAINER Joel Pettersson <petterssonjoel@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y quassel-core

# The setup of quassel-core creates /var/lib/quassel and generates a
# certificate.

VOLUME ["/var/lib/quassel"]

EXPOSE 4242

USER quasselcore

CMD ["quasselcore", "--configdir=/var/lib/quassel"]
