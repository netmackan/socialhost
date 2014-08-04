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
$ cd ~/socialhost/docker/imdock
$ sudo docker build -t imdock .
```
TODO: Remember to setup DNS SRV records for the XMPP service.
TODO: Create prosody database

### Jitsi Videobridge (SFU)
```
$ cd ~/socialhost/docker/jvbdock
$ sudo docker build -t jvbdock .
```
TODO: Currently one need to update bin/run-jvbdock manually with the XMPPHOST by:
```
$ sudo docker ps
```
Find the ID of imdock and the run:
```
$ bin/getip ID 
```


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


Start Jitsi Videobridge
```
$ bin/run-jvbdock
```
TODO: Note: need to update with IP of XMPPHOST (imdock)


Start Apache HTTP Server
```
$ bin/run-webdock
```

## Backup
TODO
