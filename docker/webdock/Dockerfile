# Install Apache

# use the latest ubuntu image
FROM ubuntu:latest

MAINTAINER: Markus KilÃa "markus@markuspage.com"

# make sure the pacage repository is up to date
RUN echo "deb http://se.archive.ubuntu.com/ubuntu/ trusty main restricted" > /etc/apt/sources.list
RUN echo "deb http://se.archive.ubuntu.com/ubuntu/ trusty-updates main restricted" >> /etc/apt/sources.list
RUN echo "deb http://se.archive.ubuntu.com/ubuntu/ trusty main universe" >> /etc/apt/sources.list
RUN apt-get update

# install apache
RUN apt-get install -y apache2 php5 libapache2-mod-php5 php5-curl php5-gd php5-mcrypt php-apc php-pear php5-mysql

RUN apt-get install curl

# todo fetch content
# curl -O https://...

# Ports to be publicly exposed
EXPOSE 443
