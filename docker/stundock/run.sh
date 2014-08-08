#!/bin/sh

echo Starting jvb using:
echo XMPPHOST:  ${XMPPHOST}
echo XPPDOMAIN: ${XMPPDOMAIN}
echo JVBPASS:   ${JVBPASS}

exec /bin/bash /home/jvb/jitsi-videobridge/jvb.sh --host=${XMPPHOST} --domain=${XMPPDOMAIN} --port=5347 --secret=${JVBPASS} >> /var/log/jvb/jvb.log 2>&1

