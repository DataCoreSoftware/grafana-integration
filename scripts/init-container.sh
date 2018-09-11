#!/bin/bash


echo "Create Influxdb telegraf database"
RUN curl  --silent --output /dev/null -POST 'http://127.0.0.1:8086/query?pretty=true' --data-urlencode "q=CREATE DATABASE telegraf"


echo "Create Influxdb DataCore database"
RUN curl  --silent --output /dev/null -POST 'http://127.0.0.1:8086/query?pretty=true' --data-urlencode "q=CREATE DATABASE DataCoreRestDB"


echo "Run Supervisord"
/usr/bin/supervisord