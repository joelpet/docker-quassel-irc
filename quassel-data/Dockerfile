FROM joelpet/debian:testing
MAINTAINER Joel Pettersson <petterssonjoel@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y quassel-core

# The setup of quassel-core creates /var/lib/quassel and generates a
# certificate.

RUN rm -rf /var/lib/quassel

VOLUME ["/var/lib/quassel"]

USER quasselcore
