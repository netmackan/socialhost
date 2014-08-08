#Jitsi Meet ()

FROM netmackan/baseimage:0.9.11
MAINTAINER Markus <markus@markuspage.com>
ENV DEBIAN_FRONTEND noninteractive

## Install an SSH key
ADD private/gateway-ssh-key.pub /tmp/my_key.pub
RUN cat /tmp/my_key.pub >> /root/.ssh/authorized_keys && rm -f /tmp/my_key.pub

#ADD jitsi-archive.key /tmp/
#RUN apt-key add /tmp/jitsi-archive.key

RUN apt-get update
RUN apt-get install -y nginx; apt-get clean

RUN mkdir /etc/service/meet
ADD ./run.sh /etc/service/meet/run

VOLUME ["/srv/meet", "/etc/nginx/sites-enabled", "/var/log/nginx"]

EXPOSE 8081

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

