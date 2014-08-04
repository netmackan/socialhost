#!/bin/sh

echo Starting jvb using:
echo XMPPHOST:  ${XMPPHOST}
echo XPPDOMAIN: ${XMPPDOMAIN}
echo JVBPASS:   ${JVBPASS}
echo PUBLICIP:  ${PUBLICIP}

LOCALIP=`ip addr show eth0 | grep -w "inet" | awk '{ print $2 }' | cut -f1 -d\/`

echo LOCALIP:   ${LOCALIP}

echo "org.jitsi.impl.neomedia.transform.srtp.SRTPCryptoContext.checkReplay=false" > /home/jvb/.sip-communicator/sip-communicator.properties
echo "org.jitsi.videobridge.NAT_HARVESTER_LOCAL_ADDRESS=${LOCALIP}" >> /home/jvb/.sip-communicator/sip-communicator.properties
echo "org.jitsi.videobridge.NAT_HARVESTER_PUBLIC_ADDRESS=${PUBLICIP}" >> /home/jvb/.sip-communicator/sip-communicator.properties

exec /sbin/setuser jvb /bin/bash /home/jvb/jitsi-videobridge/jvb.sh --host=${XMPPHOST} --domain=${XMPPDOMAIN} --port=5347 --secret=${JVBPASS} --min-port=10000 --max-port=10008 >> /var/log/jvb/jvb.log 2>&1

