#!/bin/sh
NOCOLOR='\033[0m'
RED='\033[0;31m'
CYAN='\033[0;36m'
GREEN='\033[0;32m'

echo -e "${GREEN}[$(date +%H:%M:%S)] Starting container...${NOCOLOR}"

if [ ! -f /config/rsyncd.conf ]; then
 echo -e "${CYAN}Creating default config file${NOCOLOR}"
 cp -n /conf/rsyncd.conf /config
 touch /config/not_configured
fi

if [ ! -f /config/rsyncd.secrets ]; then
 echo -e "${CYAN}Creating default secrets file${NOCOLOR}"
 cp -n /conf/rsyncd.secrets /config
 chmod go-r /config/rsyncd.secrets
 touch /config/not_configured
fi

if [ -f /config/not_configured ]; then
 echo -e "${RED}Not configured - exiting. Update rsyncd.conf and rsyncd.secrets, then delete not_configured${NOCOLOR}"
 exit 1
else
 echo -e "${GREEN}Starting rsync daemon${NOCOLOR}"
 exec /usr/bin/rsync --no-detach --daemon --config /config/rsyncd.conf
 exit 0
fi