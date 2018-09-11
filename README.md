# Docker Image with Telegraf (StatsD), InfluxDB and Grafana with [DataCore SANsymphony](http://www.datacore.com) 's dashboard & REST script included

This is a Docker image based on the awesome [Docker Image with Telegraf (StatsD), InfluxDB and Grafana](https://github.com/samuelebistoletti/docker-statsd-influxdb-grafana) from [Samuele Bistoletti](https://github.com/samuelebistoletti).

Goal is to have grafana, influxdb and python script running to grab DataCore SANsymphony REST API performances


## Build in progress ....


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

You can replace `latest` with the desired version listed in changelog file.

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