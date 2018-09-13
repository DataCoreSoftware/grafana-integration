#!/bin/bash

[ -f /etc/datacore/config.sh] && /etc/datacore/config.sh|| echo "Initial configuration already done"


/usr/bin/supervisord