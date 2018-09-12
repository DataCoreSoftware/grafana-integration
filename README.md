# Docker Image with Telegraf, InfluxDB and Grafana with [DataCore SANsymphony](http://www.datacore.com) 's dashboard & REST script included

<img>
<svg width="212px" height="41px" viewBox="0 0 212 41" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
  <g fill-rule="nonzero">
    <polygon fill="#00BCBC" points="0 18 0 12.8905941 17.9997302 12.8905941 17.9997302 0 36 18"></polygon>
    <polygon fill="#00BCBC" points="0 23 17.9997302 41 17.9997302 28.1094059 36 28.1094059 36 23"></polygon>
    <g transform="translate(50.000000, 10.000000)">
      <path d="M9.37313882,16.0682846 C11.0677441,16.0682846 12.4271586,15.5831308 13.4535138,14.6133615 C14.4798691,13.6435923 14.9930467,12.3022846 14.9930467,10.5905154 C14.9930467,8.87820769 14.4798691,7.53743846 13.4535138,6.56659231 C12.4271586,5.59736154 11.0677441,5.11166923 9.37313882,5.11166923 L5.84377697,5.11166923 L5.84377697,16.0682846 L9.37313882,16.0682846 Z M0.253178289,0.603669231 L9.59908618,0.603669231 C11.7637046,0.603669231 13.6842572,1.01343846 15.3591454,1.83136154 C17.0350993,2.64874615 18.3332309,3.80859231 19.2567375,5.31143846 C20.1781125,6.81428462 20.6401322,8.57397692 20.6401322,10.5905154 C20.6401322,12.6065154 20.1781125,14.3662077 19.2567375,15.8685154 C18.3332309,17.3719 17.0350993,18.5322846 15.3591454,19.3502077 C13.6842572,20.1670538 11.7637046,20.5762846 9.59908618,20.5762846 L0.253178289,20.5762846 L0.253178289,0.603669231 Z" fill="#FFFFFF"></path>
      <path d="M33.4881711,12.5309692 L30.9467961,6.13889231 L28.4059539,12.5309692 L33.4881711,12.5309692 Z M35.1257566,16.6959692 L26.7673026,16.6959692 L25.2149803,20.5761231 L19.510875,20.5761231 L28.2364934,0.604046154 L33.7423618,0.604046154 L42.4956908,20.5761231 L36.6780789,20.5761231 L35.1257566,16.6959692 Z" fill="#FFFFFF"></path>
      <polygon fill="#FFFFFF" points="45.6021474 5.08296923 39.5303447 5.08296923 39.5303447 0.604046154 57.2357724 0.604046154 57.2357724 5.08296923 51.1927461 5.08296923 51.1927461 20.5761231 45.6021474 20.5761231"></polygon>
      <path d="M68.2787901,12.5309692 L65.7368822,6.13889231 L63.1960401,12.5309692 L68.2787901,12.5309692 Z M69.9163757,16.6959692 L61.5579217,16.6959692 L60.0055993,20.5761231 L54.3014941,20.5761231 L63.0271125,0.604046154 L68.532448,0.604046154 L77.285777,20.5761231 L71.468698,20.5761231 L69.9163757,16.6959692 Z" fill="#FFFFFF"></path>
      <path d="M82.5795533,19.6487846 C80.9323757,18.7651692 79.6385072,17.5331692 78.697948,15.9549385 C77.7557901,14.3761692 77.2852441,12.5874 77.2852441,10.5907846 C77.2852441,8.59309231 77.7557901,6.80486154 78.697948,5.22663077 C79.6385072,3.64786154 80.9323757,2.41586154 82.5795533,1.53170769 C84.2272638,0.646476923 86.0860007,0.2044 88.1568296,0.2044 C89.9633428,0.2044 91.592402,0.528015385 93.0418757,1.17470769 C94.4913493,1.8214 95.6956914,2.75347692 96.6565007,3.97093846 L93.0978296,7.22324615 C91.8178164,5.66386154 90.2649612,4.88363077 88.4392638,4.88363077 C87.3660138,4.88363077 86.4100007,5.12163077 85.572823,5.59709231 C84.7356454,6.07255385 84.0860467,6.74293846 83.6245599,7.60932308 C83.1636059,8.47463077 82.9333954,9.46809231 82.9333954,10.5907846 C82.9333954,11.7124 83.1636059,12.7058615 83.6245599,13.5722462 C84.0860467,14.4375538 84.7356454,15.1084769 85.572823,15.5828615 C86.4100007,16.0594 87.3660138,16.2963231 88.4392638,16.2963231 C90.2649612,16.2963231 91.8178164,15.5166308 93.0978296,13.9572462 L96.6565007,17.2100923 C95.6956914,18.4275538 94.4913493,19.3596308 93.0418757,20.0063231 C91.592402,20.6524769 89.9633428,20.9760923 88.1568296,20.9760923 C86.0860007,20.9760923 84.2272638,20.5340154 82.5795533,19.6487846" fill="#00BCBC"></path>
      <path d="M110.862995,15.5829692 C111.672462,15.1085846 112.311936,14.4376615 112.782482,13.5723538 C113.253028,12.7059692 113.488567,11.7125077 113.488567,10.5908923 C113.488567,9.4682 113.253028,8.47473846 112.782482,7.60889231 C112.311936,6.74304615 111.672462,6.07266154 110.862995,5.5972 C110.052995,5.12173846 109.149205,4.88373846 108.151626,4.88373846 C107.154047,4.88373846 106.250258,5.12173846 105.440791,5.5972 C104.632389,6.07266154 103.991317,6.74304615 103.520771,7.60889231 C103.050225,8.47473846 102.815218,9.4682 102.815218,10.5908923 C102.815218,11.7125077 103.050225,12.7059692 103.520771,13.5723538 C103.991317,14.4376615 104.632389,15.1085846 105.440791,15.5829692 C106.250258,16.0595077 107.154047,16.2964308 108.151626,16.2964308 C109.149205,16.2964308 110.052995,16.0595077 110.862995,15.5829692 M102.518929,19.6343538 C100.852567,18.7410462 99.5443105,17.5042 98.5941592,15.9259692 C97.6429421,14.3472 97.1676,12.5692 97.1676,10.5908923 C97.1676,8.61204615 97.6429421,6.83350769 98.5941592,5.25473846 C99.5443105,3.67650769 100.852567,2.4402 102.518929,1.54581538 C104.184758,0.651969231 106.062146,0.203969231 108.151626,0.203969231 C110.241107,0.203969231 112.119561,0.651969231 113.785389,1.54581538 C115.451218,2.4402 116.758942,3.67650769 117.710159,5.25473846 C118.660311,6.83350769 119.135653,8.61204615 119.135653,10.5908923 C119.135653,12.5692 118.660311,14.3472 117.710159,15.9259692 C116.758942,17.5042 115.451218,18.7410462 113.785389,19.6343538 C112.119561,20.5292769 110.241107,20.9762 108.151626,20.9762 C106.062146,20.9762 104.184758,20.5292769 102.518929,19.6343538" fill="#00BCBC"></path>
      <path d="M132.660681,5.82545385 C132.076628,5.31176154 131.210674,5.05491538 130.062819,5.05491538 L126.956576,5.05491538 L126.956576,10.9042231 L130.062819,10.9042231 C131.210674,10.9042231 132.076628,10.6522231 132.660681,10.1482231 C133.243668,9.64422308 133.536227,8.92591538 133.536227,7.99383846 C133.536227,7.06176154 133.243668,6.33914615 132.660681,5.82545385 Z M130.006865,15.2695308 L126.956576,15.2695308 L126.956576,20.5766077 L121.36651,20.5766077 L121.36651,0.603992308 L130.402273,0.603992308 C132.190135,0.603992308 133.742457,0.903376923 135.061372,1.50268462 C136.378155,2.10145385 137.395451,2.95760769 138.110595,4.07060769 C138.825207,5.18360769 139.183312,6.49153077 139.183312,7.99383846 C139.183312,9.44014615 138.849188,10.7001462 138.180938,11.7743769 C137.512687,12.8496846 136.557207,13.6907615 135.314497,14.2992231 L139.578188,20.5766077 L133.592714,20.5766077 L130.006865,15.2695308 Z" fill="#00BCBC"></path>
      <polygon fill="#00BCBC" points="157.424672 16.2108154 157.424672 20.5761231 141.556133 20.5761231 141.556133 0.604046154 157.058041 0.604046154 157.058041 4.96935385 147.089712 4.96935385 147.089712 8.33581538 155.87235 8.33581538 155.87235 12.5589692 147.089712 12.5589692 147.089712 16.2108154"></polygon>
      <polygon fill="#00BCBC" points="158.90628 2.77081538 158.632905 2.77081538 158.632905 0.822661538 157.920424 0.822661538 157.920424 0.604046154 159.619293 0.604046154 159.619293 0.822661538 158.90628 0.822661538"></polygon>
      <polygon fill="#00BCBC" points="160.171905 1.03449231 160.171905 2.77103077 159.90226 2.77103077 159.90226 0.603723077 160.195885 0.603723077 160.921155 2.10818462 161.648023 0.603723077 161.940582 0.603723077 161.940582 2.77103077 161.670937 2.77103077 161.670937 1.03449231 161.014944 2.39356923 160.831628 2.39356923"></polygon>
    </g>
  </g>
</svg>
</img>


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

* -r -> DataCore REST server IP
* -d -> DataCore Server IP
* -u -> DataCore User
* -p -> DataCore Password

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
