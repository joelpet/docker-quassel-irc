# docker-quassel-irc

[Quassel IRC](http://quassel-irc.org/) is a modern, cross-platform, distributed
IRC program, where multiple clients can attach to and detach from a central
core. This is a [docker](https://www.docker.io) image that eases setup.

## Usage

### Docker Compose

From the directory where docker-compose.yml is located, run:

```bash
docker-compose up -d
```

## SSL certificate

Quassel IRC requires the private key and full (public) keychain be concatenated
into a single file. See ./install-ssl-cert.sh for details.

On certificate renewal, QuasselIRC (<= 0.12.4) must be restarted for it to be
used. The next version is likely to feature a signal trap allowing for online
certificate reload.

## Backup and restore

Based on the [Managing data in
containers](https://docs.docker.com/userguide/dockervolumes/) part of the
Docker Documentation:

```bash
docker run --volumes-from quassel_data_X -v $(pwd):/backup busybox tar cvf /backup/quassel_data_X.tar /var/lib/quassel
``` 

```bash
docker run --volumes-from quassel_data_Y -v $(pwd):/backup busybox tar xvf /backup/quasse_data_X.tar
``` 

### Notes on permissions

Files in volumes share the owner uid/guid with the host system, so these must
match with the user inside the container. Run a new container from the same
image and inspect a file with ln -ln in /tmp created with the current user to
find out the uid/guid.

## TODO

- Give Quassel IRC docker container proper read access to LetsEncrypt SSL certs from host.
- Figure out, and document how SSL certificate updates should be handled.
