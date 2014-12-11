# DOCKER-VERSION 1.3
# AUTHOR: Minku Lee <minku@sha.kr>
# DESCRIPTION: Out-of-the-box StatsD + InfluxDB backend image for Docker

FROM node:0.10.33-slim

RUN git clone https://github.com/etsy/statsd.git
RUN cd /statsd && npm install statsd-influxdb-backend

ADD config.js /statsd/config.js

EXPOSE 8125/udp
EXPOSE 8126/tcp

CMD node /statsd/stats.js /statsd/config.js