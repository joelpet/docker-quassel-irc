# docker-quassel-core

[Quassel IRC](http://quassel-irc.org/) is a modern, cross-platform, distributed IRC program,
where multiple clients can attach to and detach from a central core.
This is a [docker](https://www.docker.io) image that eases setup.

## About Quassel Core

> *From [the official readme](http://bugs.quassel-irc.org/projects/quassel-irc/wiki):*

Quassel is a program to connect to an IRC network.
It has the unique ability to split the graphical component (quasselclient) from the part that handles the IRC connection (quasselcore).
This means that you can have a remote core permanently connected to one or more IRC networks and attach a client from wherever you are without moving around any information or settings.

![](http://bugs.quassel-irc.org/attachments/download/111/distributed.png)

## Usage

### Fig

From this directory, run:

```bash
fig up -d
```

### Manually using Docker

#### Build image

First build the image:

```bash
docker build -t joelpet/quassel-core .
```

#### Create containers

Create a data volume container and finally the actual quassel-core container:

```bash
# Data Volume Container
docker run -d -v /var/lib/quassel --name quassel-core_data joelpet/quassel-core echo Data-only container for quassel-core.
# Quassel IRC core
docker run -d -P --volumes-from quassel-core_data --name quassel-core joelpet/quassel-core
```

## Notes

Files in volumes share the owner uid/guid with the host system, so these must
match with the user inside the container. Run a new container from the same
image and inspect a file with ln -ln in /tmp created with the current user to
find out the uid/guid.
