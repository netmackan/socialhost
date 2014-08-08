#!/bin/sh

echo Starting Jitsi Meet using:
echo XMPPHOST:  ${XMPPHOST}
echo XPPDOMAIN: ${XMPPDOMAIN}
echo JVBPASS:   ${JVBPASS}
echo PUBLICIP:  ${PUBLICIP}
LOCALIP=`ip addr show eth0 | grep -w "inet" | awk '{ print $2 }' | cut -f1 -d\/`
echo LOCALIP:   ${LOCALIP}

echo 'user www-data;
worker_processes  1;

error_log  /var/log/nginx/error.log;
pid        /var/run/nginx.pid;
daemon off;

events {
    worker_connections  1024;
    # multi_accept on;
}

http {
    include       /etc/nginx/mime.types;

    access_log	/var/log/nginx/access.log;

    sendfile        on;
    #tcp_nopush     on;

    #keepalive_timeout  0;
    keepalive_timeout  65;
    tcp_nodelay        on;

    tcp_nopush on;
    types_hash_max_size 2048;
    server_names_hash_bucket_size 64;

    gzip  on;
    gzip_disable "MSIE [1-6]\.(?!.*SV1)";

    include /etc/nginx/conf.d/*.conf;
    include /etc/nginx/sites-enabled/*;
}' > /etc/nginx/nginx.conf


exec nginx

