socialhost
==========

Social/communication small server/VPS set up with blog/micro-blog/chat/voip etc using Docker


## Building

TODO: How to build the Docker images


$ cd docker/imdock
$ sudo docker build -t imdock .

$ sudo mkdir /opt/db-data


$ cd ~/socialhost/docker/webdock
$ sudo docker build -t webdock .

## Configuring

TODO: Remember to setup DNS SRV records for the XMPP service.


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
TODO
```

## Backup
TODO
