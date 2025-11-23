#!/bin/bash

CERT=/home/container/.cloudflared/cert.pem
if test -f "$CERT"; then
	cd .cloudflared
    TUNNELS=`ls -1 *.json 2>/dev/null | wc -l`
    if [ $TUNNELS != 0 ]; then
        /usr/bin/cloudflared tunnel run
    else
    	NEW_UUID=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)
        /usr/bin/cloudflared tunnel create dcloud$NEW_UUID
        TUNNEL=$(cut -c 3-38 <<< $(find . -type f -name "*.json"))
        curl -o /home/container/.cloudflared/config.yml https://raw.githubusercontent.com/Dojnaz/DojnazCloudEggs/main/cloudflared/config.yml
        sed -i "s/TUNNEL_ID/$TUNNEL/" /home/container/.cloudflared/config.yml
    fi
else
    /usr/bin/cloudflared tunnel login
fi
