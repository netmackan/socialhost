#Prosody (https://prosody.im)

# To build for armhf (ARMv7) devices, change like this:
# * FROM mazzolino/armhf-debian
# * add "lua-sec-prosody" to prosody install line (because lua-sec v0.5 is needed for PFS)
FROM netmackan/baseimage:0.9.11
MAINTAINER Markus <markus@markuspage.com>
ENV DEBIAN_FRONTEND noninteractive

## Install an SSH key
ADD private/gateway-ssh-key.pub /tmp/my_key.pub
RUN cat /tmp/my_key.pub >> /root/.ssh/authorized_keys && rm -f /tmp/my_key.pub

ADD prosody-debian-packages.key /tmp/
RUN apt-key add /tmp/prosody-debian-packages.key

RUN apt-get update
RUN apt-get install -y ca-certificates; apt-get clean
RUN echo deb http://packages.prosody.im/debian $(lsb_release -sc) main | sudo tee -a /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y prosody lua-event lua-zlib && \
    apt-get install -y lua-dbi-mysql && \
    apt-get install -y telnet; apt-get clean

ADD prosody.cfg.lua /etc/prosody/
ADD private/conf.d /etc/prosody/conf.d/
ADD private/certs /etc/prosody/certs
RUN chown -R prosody:prosody /etc/prosody/certs && chmod 0700 /etc/prosody/certs && chmod 0600 /etc/prosody/certs/*

RUN touch /var/log/prosody/.keep && chown -R prosody:prosody /var/log/prosody
VOLUME /var/log/prosody

ENV __FLUSH_LOG 1

EXPOSE 5222 5269 5280 5347


# Use baseimage-docker's init system.
CMD ["/sbin/my_init", "--", "/sbin/setuser", "prosody", "/usr/bin/lua", "/usr/bin/prosody"]
