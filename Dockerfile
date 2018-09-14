FROM debian:9
MAINTAINER Luc Blanc <email@luc-blanc.com>

ENV DEBIAN_FRONTEND noninteractive
ENV LANG en_US.UTF-8

# Database Defaults
ENV INFLUXDB_GRAFANA_DB datasource
ENV INFLUXDB_GRAFANA_USER datasource
ENV INFLUXDB_GRAFANA_PW datasource

ENV MYSQL_GRAFANA_USER grafana
ENV MYSQL_GRAFANA_PW grafana

# Default versions
ENV TELEGRAF_VERSION 1.7.4-1
ENV INFLUXDB_VERSION 1.6.2
ENV GRAFANA_VERSION  5.2.4
ENV CHRONOGRAF_VERSION 1.6.2


# Copy files for DataCore
COPY scripts/config.sh /etc/datacore/config.sh
COPY scripts/datacore_get_perf.ini /etc/datacore/datacore_get_perf.ini
COPY scripts/datacore_get_perf.py /etc/datacore/datacore_get_perf.py
COPY scripts/setup_mysql.sh /etc/datacore/setup_mysql.sh
COPY system/datacore-cron /tmp/datacore-cron


# Base dependencies
RUN rm /var/lib/apt/lists/* -vf && \
 apt-get -y update && \
 apt-get -y dist-upgrade && \
 apt-get -y --force-yes install \
  apt-utils \
  ca-certificates \
  curl \
  git \
  htop \
  libfontconfig \
  mysql-client \
  mysql-server \
  nano \
  gnupg2 \
  net-tools \
  openssh-server \
  vim \
  supervisor \
  python-configparser \
  python-concurrent.futures \
  python-requests \
  cron \
  wget && \
 curl -sL https://deb.nodesource.com/setup_9.x | bash - && \
 apt-get install -y nodejs


# Configure Supervisord, SSH, base env, cron and MySql
COPY supervisord/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

WORKDIR /root

RUN mkdir -p /var/log/supervisor && \
    mkdir -p /var/run/sshd && \
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    echo 'root:root' | chpasswd && \
    rm -rf .ssh && \
    rm -rf .profile && \
    mkdir .ssh && \
    cat /tmp/datacore-cron >> /etc/crontab && \
    /etc/datacore/setup_mysql.sh


COPY ssh/authorized_keys .ssh/authorized_keys
COPY bash/bashrc .bashrc


# Install InfluxDB
RUN wget https://dl.influxdata.com/influxdb/releases/influxdb_${INFLUXDB_VERSION}_amd64.deb && \
	dpkg -i influxdb_${INFLUXDB_VERSION}_amd64.deb && rm influxdb_${INFLUXDB_VERSION}_amd64.deb

# Configure InfluxDB
COPY influxdb/init.sh /etc/init.d/influxdb


# Install Telegraf
RUN wget https://dl.influxdata.com/telegraf/releases/telegraf_${TELEGRAF_VERSION}_amd64.deb && \
	dpkg -i telegraf_${TELEGRAF_VERSION}_amd64.deb && rm telegraf_${TELEGRAF_VERSION}_amd64.deb

# Configure Telegraf
COPY telegraf/telegraf.conf /etc/telegraf/telegraf.conf
COPY telegraf/init.sh /etc/init.d/telegraf

# Install chronograf
RUN wget https://dl.influxdata.com/chronograf/releases/chronograf_${CHRONOGRAF_VERSION}_amd64.deb && \
  dpkg -i chronograf_${CHRONOGRAF_VERSION}_amd64.deb

# Install Grafana
RUN wget https://s3-us-west-2.amazonaws.com/grafana-releases/release/grafana_${GRAFANA_VERSION}_amd64.deb && \
	dpkg -i grafana_${GRAFANA_VERSION}_amd64.deb && rm grafana_${GRAFANA_VERSION}_amd64.deb

# Configure Grafana
COPY grafana/grafana.ini /etc/grafana/grafana.ini


# Cleanup
RUN apt-get clean && \
 rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENTRYPOINT [ "/etc/datacore/config.sh" ]

CMD [ "/usr/bin/supervisord" ]