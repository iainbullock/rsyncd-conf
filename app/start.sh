#!/bin/sh
chmod go-r /conf/rsyncd.secrets
exec /usr/bin/rsync --no-detach --daemon --config /conf/rsyncd.conf