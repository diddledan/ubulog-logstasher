FROM docker.elastic.co/logstash/logstash:6.2.0

USER root
RUN mkdir -p /var/lib/ubuntu-chatlogs /usr/share/ubuntu-chatlogs
WORKDIR /var/lib/ubuntu-chatlogs
COPY . /usr/share/ubuntu-chatlogs

USER logstash
CMD [ "-f", "/usr/share/ubuntu-chatlogs/ubuntu-log-archive.conf" ]
