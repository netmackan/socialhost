#!/bin/sh

exec apachectl -DFOREGROUND >> /var/log/apache.log 2>&1

