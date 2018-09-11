RUN curl  --silent --output /dev/null -POST 'http://127.0.0.1:8086/query?pretty=true' --data-urlencode "q=CREATE DATABASE telegraf"
COPY telegraf/telegraf.conf /etc/telegraf/telegraf.conf
COPY telegraf/init.sh /etc/init.d/telegraf


# Configure DataCore Perf Monitor
RUN curl  --silent --output /dev/null -POST 'http://127.0.0.1:8086/query?pretty=true' --data-urlencode "q=CREATE DATABASE DataCoreRestDB"
COPY datacore/datacore_get_perf.py /etc/datacore/datacore_get_perf.py
COPY datacore/datacore_get_perf.ini /etc/datacore/datacore_get_perf.ini
ADD system/datacore-cron /etc/cron.d/datacore-cron
RUN chmod 0644 /etc/cron.d/datacore-cron
