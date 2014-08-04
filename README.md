socialhost
==========

Social/communication small server/VPS set up with blog/micro-blog/chat/voip etc using Docker


## Building & configuring

TODO: How to build the Docker images

### MariaDB (database)
TODO
```
$ sudo mkdir /opt/db-data
```

### Prosody (XMPP)
```
$ cd ~socialhost/docker/imdock
$ sudo docker build -t imdock .
```
TODO: Remember to setup DNS SRV records for the XMPP service.
TODO: Create prosody database


### Apache HTTP Server
```
$ cd ~/socialhost/docker/webdock
$ sudo docker build -t webdock .
```
TODO: Configure vhosts in /opt/apache-sites
TODO: Put TLS certificates in /opt/apache-private


## Running

Start MariaDB
```
$ bin/run-dbdock
```

Start Prosody
```
$ bin/run-imdock
```

Start Apache HTTP Server
```
$ bin/run-webdock
```

## Backup
TODO
