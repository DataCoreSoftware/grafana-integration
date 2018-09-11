#!/bin/bash

echo "Create Influxdb DataCore database"
curl  --silent --output /dev/null -POST 'http://127.0.0.1:8086/query?pretty=true' --data-urlencode "q=CREATE DATABASE DataCoreRestDB WITH DURATION 6w REPLICATION 1"

echo "Create Grafana Data Source"
curl --silent --output /dev/null  -X POST \
  http://127.0.0.1:3000/api/datasources \
  -H 'Accept: application/json' \
  -H 'Authorization: Basic Z3JhZmFuYTpncmFmYW5h' \
  -H 'Cache-Control: no-cache' \
  -H 'Content-Type: application/json' \
  -d '{
  "name":"DataCoreRestDB",
  "type":"influxdb",
  "url":"http://localhost:8086",
  "database":"DataCoreRestDB",
  "access":"proxy"
}'