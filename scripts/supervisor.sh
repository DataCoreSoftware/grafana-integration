#!/bin/bash

/usr/bin/supervisord

sleep 10

[ -f /etc/datacore/config.sh ] && /etc/datacore/config.sh || echo "Initial configuration already done"
#