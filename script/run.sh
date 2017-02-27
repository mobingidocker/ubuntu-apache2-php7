#!/bin/bash

echo "installing" > /var/log/container_status

bash /tmp/init/init.sh >>/var/log/startup.log 2>&1

echo "complete" > /var/log/container_status

exec /usr/bin/supervisord
