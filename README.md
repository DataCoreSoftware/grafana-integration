# Docker Image with Telegraf, InfluxDB and Grafana with [DataCore SANsymphony](http://www.datacore.com) 's dashboard & REST script included

[![](https://dockerbuildbadges.quelltext.eu/status.svg?organization=lblanc&repository=docker-influxdb-grafana-datacore)](https://hub.docker.com/r/lblanc/docker-influxdb-grafana-datacore/builds/)

[![License](http://img.shields.io/:license-mit-blue.svg)](http://octopress.mit-license.org)



This is a Docker image based on the awesome [Docker Image with Telegraf (StatsD), InfluxDB and Grafana](https://github.com/samuelebistoletti/docker-statsd-influxdb-grafana) from [Samuele Bistoletti](https://github.com/samuelebistoletti).

Goal is to have grafana, influxdb and python script running to grab DataCore SANsymphony REST API performances


## Quick Start

To start the container the first time launch:

```sh
docker run --ulimit nofile=66000:66000 \
  -d \
  --name grafana-datacore \
  -p 3000:3000 \
  -p 8888:8888 \
  -p 8086:8086 \
  -p 22022:22 \
  -p 8125:8125/udp \
  lblanc/docker-statsd-influxdb-grafana-datacore:latest
```

After the first run, connect in ssh to container and run config.sh with these parameters:
-r -> DataCore REST server IP
-d -> DataCore Server IP
-u -> DataCore User
-p -> DataCore Password

Ex:
```sh
sh /etc/datacore/config.sh -r X.X.X.X -d X.X.X.X -u Administrator -p 123456
```

To stop the container launch:

```sh
docker stop grafana-datacore
```

To start the container again launch:

```sh
docker start grafana-datacore
```

## Mapped Ports

```
Host		Container		Service

3000		3000			grafana
8888		8888			chronograf
8086		8086			influxdb
8125		8125			statsd
22022		22        sshd
```
## SSH

```sh
ssh root@localhost -p 22022
```
Password: root

## Grafana

Open <http://localhost:3000>

```
Username: grafana
Password: grafana
```
