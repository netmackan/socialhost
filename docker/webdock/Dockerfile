# Apache HTTP Server

FROM socialhost/basedock:0.9.11
MAINTAINER Markus <markus@markuspage.com>
ENV DEBIAN_FRONTEND noninteractive
ENV LANG C.UTF-8

## Install an SSH key
ADD private/gateway-ssh-key.pub /tmp/my_key.pub
RUN cat /tmp/my_key.pub >> /root/.ssh/authorized_keys && rm -f /tmp/my_key.pub

# make sure the package repository is up to date
RUN echo "deb http://mirrors.digitalocean.com/ubuntu/ trusty main restricted" > /etc/apt/sources.list && \
	echo "deb http://mirrors.digitalocean.com/ubuntu/ trusty-updates main restricted" >> /etc/apt/sources.list && \
	echo "deb http://mirrors.digitalocean.com/ubuntu/ trusty main universe" >> /etc/apt/sources.list && \
	echo "deb http://security.ubuntu.com/ubuntu trusty-security main restricted" >> /etc/apt/sources.list && \
	echo "deb-src http://security.ubuntu.com/ubuntu trusty-security main restricted" >> /etc/apt/sources.list && \
	echo "deb http://security.ubuntu.com/ubuntu trusty-security universe" >> /etc/apt/sources.list && \
	echo "deb-src http://security.ubuntu.com/ubuntu trusty-security universe" >> /etc/apt/sources.list && \
	echo "deb http://security.ubuntu.com/ubuntu trusty-security multiverse" >> /etc/apt/sources.list && \
	echo "deb-src http://security.ubuntu.com/ubuntu trusty-security multiverse" >> /etc/apt/sources.list
RUN apt-get update

# install apache
RUN apt-get install -y apache2 php5 libapache2-mod-php5 php5-curl php5-gd php5-mcrypt php-apc php-pear php5-mysql php5-mcrypt && \
	apt-get install curl

RUN a2enmod ssl
RUN a2enmod rewrite
RUN rm /etc/apache2/sites-enabled -r

RUN mkdir /etc/service/apache
ADD ./run.sh /etc/service/apache/run

# Cleanup
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Volumes
VOLUME ["/var/www", "/var/log/apache2", "/etc/apache2/sites-enabled", "/etc/apache2/private"]

##RUN curl -O https://sourceforge.net/projects/nibbleblog/files/v4.0/nibbleblog-v4.0.3.zip
# todo fetch content
# curl -O https://...

# Ports to be publicly exposed
EXPOSE 80 443

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

