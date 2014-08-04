#Jitsi Videobridge (https://github.com/jitsi/jitsi-videobridge)

FROM netmackan/baseimage:0.9.11
MAINTAINER Markus <markus@markuspage.com>
ENV DEBIAN_FRONTEND noninteractive

## Install an SSH key
ADD private/gateway-ssh-key.pub /tmp/my_key.pub
RUN cat /tmp/my_key.pub >> /root/.ssh/authorized_keys && rm -f /tmp/my_key.pub

#ADD jitsi-archive.key /tmp/
#RUN apt-key add /tmp/jitsi-archive.key

RUN apt-get update
RUN apt-get install -y ca-certificates; apt-get clean
RUN apt-get install -y default-jre unzip; apt-get clean
#RUN echo deb http://download.jitsi.org/nightly/deb unstable/ | sudo tee -a /etc/apt/sources.list && \
#    apt-get update && \
#    apt-get install -y jitsi-videobridge; apt-get clean

RUN useradd --create-home jvb
RUN mkdir /home/jvb/.sip-communicator
RUN echo "org.jitsi.impl.neomedia.transform.srtp.SRTPCryptoContext.checkReplay=false" > /home/jvb/.sip-communicator/sip-communicator.properties
RUN chown -R jvb:jvb /home/jvb/.*

RUN curl -O https://download.jitsi.org/jitsi-videobridge/linux/jitsi-videobridge-linux-x64-197.zip

RUN unzip jitsi-videobridge-linux-x64-197.zip
RUN mv jitsi-videobridge-linux-x64-197 /home/jvb
RUN cd /home/jvb && ln -s jitsi-videobridge-linux-x64-197/ jitsi-videobridge

RUN mkdir /etc/service/jvb
ADD ./run.sh /etc/service/jvb/run

VOLUME /var/log/jvb/

# EXPOSE 5222 5269 5280 5347

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

