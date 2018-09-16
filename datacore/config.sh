#!/bin/bash

sed -i 's/datacore_server = dcs-ip/datacore_server = '${DCSSVR}'/' /etc/datacore/datacore_get_perf.ini && \
sed -i 's/rest_server = rest-ip/rest_server = '${DCSREST}'/' /etc/datacore/datacore_get_perf.ini && \
sed -i 's/user = user/user = '${DCSUNAME}'/' /etc/datacore/datacore_get_perf.ini && \
sed -i 's/passwd = pass/passwd = '${DCSPWORD}'/' /etc/datacore/datacore_get_perf.ini

/etc/init.d/grafana-server start

sleep 5

echo "Create Influxdb DataCore database"
curl  --silent --output /dev/null -POST 'http://127.0.0.1:8086/query?pretty=true' --data-urlencode "q=CREATE DATABASE DataCoreRestDB WITH DURATION 6w REPLICATION 1"

echo "Create Grafana Data Sources"
curl --silent --output /dev/null  -X POST \
  http://127.0.0.1:3000/api/datasources \
  -H 'Accept: application/json' \
  -H 'Authorization: Basic Z3JhZmFuYTpncmFmYW5h' \
  -H 'Cache-Control: no-cache' \
  -H 'Content-Type: application/json' \
  -d @/etc/datacore/influxdb-datacoredb.json

curl --silent --output /dev/null  -X POST \
  http://127.0.0.1:3000/api/datasources \
  -H 'Accept: application/json' \
  -H 'Authorization: Basic Z3JhZmFuYTpncmFmYW5h' \
  -H 'Cache-Control: no-cache' \
  -H 'Content-Type: application/json' \
  -d @/etc/datacore/influxdb-telegraf.json



echo "Create Grafana DataCore Dashboard"
curl  --silent --output /dev/null  -X POST \
  http://127.0.0.1:3000/api/dashboards/db \
  -H 'Accept: application/json' \
  -H 'Authorization: Basic Z3JhZmFuYTpncmFmYW5h' \
  -H 'Cache-Control: no-cache' \
  -H 'Content-Type: application/json' \
  -d @/etc/datacore/datacore-perf-monitor.json



echo "Set DataCore Dashboard as Home"
curl  --silent --output /dev/null  -X PUT \
  http://docker:3000/api/user/preferences \
  -H 'Accept: application/json' \
  -H 'Authorization: Basic Z3JhZmFuYTpncmFmYW5h' \
  -H 'Cache-Control: no-cache' \
  -H 'Content-Type: application/json' \
  -d @/etc/datacore/default-home-dashboard.json

exec "$@"