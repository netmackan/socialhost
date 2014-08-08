# restund (http://creytiv.com, https://github.com/jitsi/jitsi-videobridge)

FROM netmackan/baseimage:0.9.11
MAINTAINER Markus <markus@markuspage.com>
ENV DEBIAN_FRONTEND noninteractive

## Install an SSH key
ADD private/gateway-ssh-key.pub /tmp/my_key.pub
RUN cat /tmp/my_key.pub >> /root/.ssh/authorized_keys && rm -f /tmp/my_key.pub

#ADD jitsi-archive.key /tmp/
#RUN apt-key add /tmp/jitsi-archive.key

RUN apt-get update
RUN apt-get install -y make gcc; apt-get clean
#RUN echo deb http://download.jitsi.org/nightly/deb unstable/ | sudo tee -a /etc/apt/sources.list && \
#    apt-get update && \
#    apt-get install -y jitsi-videobridge; apt-get clean

RUN curl -O http://creytiv.com/pub/re-0.4.7.tar.gz
# TODO: Insecure download!

RUN tar zxvf re-0.4.7.tar.gz 
RUN ln -s re-0.4.7 re
RUN cd re-0.4.7 && sudo make install PREFIX=/usr && cd ..

RUN curl -O http://creytiv.com/pub/restund-0.4.2.tar.gz
# TODO: Insecure download!

RUN curl -O https://raw.github.com/andyet/otalk-server/master/restund/restund-auth.patch
RUN tar zxvf restund-0.4.2.tar.gz
RUN cd restund-0.4.2/ && patch -p1 < ../restund-auth.patch
RUN make install PREFIX=/usr

#cp debian/restund.init /etc/init.d/restund
#chmod +x /etc/init.d/restund


#RUN mkdir /etc/service/jvb
#ADD ./run.sh /etc/service/jvb/run

#VOLUME /var/log/jvb/

# EXPOSE 5222 5269 5280 5347

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

