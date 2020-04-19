#!/usr/bin/with-contenv sh
# Remove existing file if exists
if [ -f /etc/timezone ]; then
  rm -rf /etc/timezone /etc/localtime
fi
# Set timezone
if [ -f /usr/share/zoneinfo/${TZ} ]; then
  cp /usr/share/zoneinfo/${TZ} /etc/localtime
  echo $TZ >/etc/timezone
fi
